#!/bin/sh
#set -e

echo "Removing /etc/kubernetes/pki;/var/lib/etcd;sudo rm -rf /var/lib/kubelet/*;$HOME/.kube;/root/.kube;/etc/kubernetes/manifests/kube*"
sudo kubeadm reset
#sudo rm -rf /etc/etcd/ssl/*
sudo rm -rf /etc/kubernetes/pki
sudo rm -rf /var/lib/cni
sudo rm -rf /var/lib/etcd/*
sudo rm -rf /run/flannel 
sudo rm -rf /etc/cni/
sudo rm -rf $HOME/.kube
sudo rm -rf /root/.kube
sudo rm -rf /etc/kubernetes/manifests/kube*
#sudo ifconfig cni0 down
#sudo ifconfig flannel.1 down
ip link delete cni0
ip link delete flannel.1
echo "Removal completed"
