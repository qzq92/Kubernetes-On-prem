#!/bin/sh
set -e
set x
echo "Applying localstorage"
#kubectl apply -f local-path-storage.yaml
echo "Creating rbac,class and applying deployment yaml scripts"
kubectl create -f external-storage/nfs-client/deploy/rbac.yaml
kubectl create -f external-storage/nfs-client/deploy/class.yaml
kubectl apply -f external-storage/nfs-client/deploy/deployment.yaml
echo "Process completed."

#echo "Setting nfs storage as default storage class"
#kubectl patch storageclass managed-nfs-storage -p '{"metadata":{"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}' #managed-nfs-storage is the metadata name of storageclass defined
echo "Retrieving storage class with kubectl"
kubectl get storageclass
