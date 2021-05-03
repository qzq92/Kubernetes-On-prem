#!/bin/sh
set -e
set x
echo "Deleting localstorage"
#kubectl delete -f local-path-storage.yaml
echo "Deleting created and applied rbac,class and deployment yaml scripts"
kubectl delete -f external-storage/nfs-client/deploy/deployment.yaml
kubectl delete -f external-storage/nfs-client/deploy/class.yaml
kubectl delete -f external-storage/nfs-client/deploy/rbac.yaml
echo "Process completed."

