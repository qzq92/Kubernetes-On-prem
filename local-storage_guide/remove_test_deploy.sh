#!/bin/sh
set -e
set x
echo "Deleting deployment to persistent storage"
sudo kubectl delete -f external-storage/nfs-client/deploy/test-pod.yaml -f external-storage/nfs-client/deploy/test-claim.yaml
echo "Process completed."

