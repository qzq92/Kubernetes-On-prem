#!/usr/bin/env bash
set -e

echo "Daemon reload, enable and start etcd..."
sudo systemctl daemon-reload && systemctl enable etcd && systemctl start etcd
echo "Checking health status of cluster"
etcdctl --ca-file=/etc/etcd/ssl/ca.pem --cert-file=/etc/etcd/ssl/etcd.pem --key-file=/etc/etcd/ssl/etcd-key.pem cluster-health
ETCDCTL_API=3 etcdctl member list

