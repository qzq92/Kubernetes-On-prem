#!/bin/sh
set -e
set x
echo "Making necessary directory after kubeadm init"
echo "Making $HOME/.kube"
mkdir -p $HOME/.kube

echo "Copying /etc/kubernetes/admin.conf to $HOME/.kube/config, changing ownership"
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $USER:$USER $HOME/.kube/config

echo "Making /root/.kube directory.Copying /etc/kubernetes/admin.conf to /root/.kube/config"
sudo mkdir -p /root/.kube
sudo cp -i /etc/kubernetes/admin.conf /root/.kube/config

echo "Applying flannel..."
kubectl apply -f kube-flannel.yml
echo "Process completed"


