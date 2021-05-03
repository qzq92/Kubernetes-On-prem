#!/bin/sh
set -e

echo "Making directories: /etc/etcd/ssl and /var/lib/etcd"
cd /opt/ssl
sudo mkdir -p /etc/etcd/ssl
sudo mkdir -p /var/lib/etcd
echo "Copying pem files from /opt/ssl to /etc/etcd/ssl"
sudo cp *.pem /etc/etcd/ssl/
