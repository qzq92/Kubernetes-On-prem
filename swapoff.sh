#!/bin/sh
set -e

sudo touch /etc/cloud/cloud-init.disabled
sudo swapoff -a
sudo sed -i 's/^.*swap/#&/' /etc/fstab
sudo iptables -P FORWARD ACCEPT
sudo sysctl --system
echo "Swapoff process done"
