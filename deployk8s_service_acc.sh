#!/usr/bin/env bash
set e
set -x

echo "Deploying service account"
kubectl create -f kubernetes-dashboard-admin.yaml
echo "Getting token"
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
echo "Process completed"

