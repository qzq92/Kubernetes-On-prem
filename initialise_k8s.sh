#!/bin/sh
set -e

echo "Configuring iptables to accept forwarded packets"
sudo iptables -P FORWARD ACCEPT

echo "Reload settings from system config files"
sudo sysctl --system

echo "Generating new cert"
mkdir -p ssl
cd ./ssl
cfssl gencert -initca ca-csr.json | cfssljson -bare ca
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -hostname=127.0.0.1,192.168.111.11 -profile=kubernetes etcd-csr.json | cfssljson -bare etcd
echo "Certificate generated"

echo "Making etcd and ssl directories and copying generated pem files from ssl folder to /etc/etcd/ssl folder"
sudo mkdir -p /etc/etcd/ssl
sudo mkdir -p /var/lib/etcd
sudo cp *.pem /etc/etcd/ssl/
sudo chmod 644 /etc/etcd/ssl/*

cd ../
echo "Daemon reload, enable and start etcd..."
sudo systemctl daemon-reload && sudo systemctl enable etcd && sudo systemctl start etcd
echo "Checking health status of cluster"
etcdctl --ca-file=/etc/etcd/ssl/ca.pem --cert-file=/etc/etcd/ssl/etcd.pem --key-file=/etc/etcd/ssl/etcd-key.pem cluster-health
ETCDCTL_API=3 etcdctl member list

echo "Daemon reload, enable and start keepalived..."
sudo systemctl daemon-reload && systemctl enable keepalived && systemctl restart keepalived

echo "Initialising kubernetes cluster and making .kube folder for existing account"
sudo kubeadm init --config kubeadm-config.yaml
mkdir -p $HOME/.kube

echo "Changing ownership for /etc/Kubernetes and Copying /etc/kubernetes/admin.conf to $HOME/.kube/config"
sudo chmod 644 /etc/kubernetes/*
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $USER:$USER $HOME/.kube/config

echo "Making .kube directory in root folder.Copying /etc/kubernetes/admin.conf to /root/.kube/config"
sudo mkdir -p /root/.kube
sudo cp -i /etc/kubernetes/admin.conf /root/.kube/config

echo "Applying flannel..."
kubectl apply -f kube-flannel.yml

#Comment taint node command if you do not wish to tain master node(allow workloads to run on master node)
echo "Tainting master node"
kubectl taint nodes --all node-role.kubernetes.io/master-

echo "Applying metallb yaml plugins and settings"
cd ./MetalLB
/bin/bash deploy_MetalLB.sh

echo "Applying local storage"
cd ../local-storage_guide

echo "Deploying NFS storage"
/bin/bash deploy_NFS.sh

echo "Deploying SAMBA storage using csi plugin"
cd ../smbclient
/bin/bash deploy_csi.sh
cd ..

echo "Deploying dashboard"
kubectl create -f kubernetes-dashboard-1.10.1.yaml

echo "Deploying service account for dashboard"
kubectl create -f kubernetes-dashboard-admin.yaml

echo "Getting token"
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}') > admin_dashboard_token.txt

echo "Applying NVIDIA plugins"
kubectl create -f nvidia-device-plugin-1.0.0.yml

echo "Labelling master02 node as master"
kubectl label node master02 node-role.kubernetes.io/master=master --overwrite

#echo "Setting up dexgangway"
#cd ./dexgangway
#/bin/bash deploy_dexgangway.sh

cd ./nvidia-dcgm-exporter-prom-grafana
/bin/bash deploy_monitoring.sh

cd ..

echo "Creating a join token for other client nodes to join the existing Kubernetes cluster by printing out the join command into a text file that is located in specified path"
kubeadm token create --print-join-command | tee joinnode.txt

