#!/bin/sh
set -e
set x
echo "Testing deployment to persistent storage"
kubectl create -f external-storage/nfs-client/deploy/test-claim.yaml
kubectl create -f external-storage/nfs-client/deploy/test-pod.yaml
echo "Process completed."

