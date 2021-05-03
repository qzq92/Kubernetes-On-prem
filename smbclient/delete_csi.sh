#!/usr/bin/env bash
set e
set -x

echo "Deleting testpod, smb pvc and storageclass"
#kubectl delete -f testpod.yaml
#kubectl delete -f smb-pvc.yaml
kubectl delete -f smb-storageclass-admin.yaml
kubectl delete -f smb-storageclass.yaml

kubectl delete secrets smbcreds
kubectl delete secrets smbcredsuser
echo "Deleting csi smb driver on k8s"
kubectl delete -f csi-smb-controller.yaml
kubectl delete -f csi-smb-driver.yaml
kubectl delete -f csi-smb-node.yaml
kubectl delete -f rbac-csi-smb-controller.yaml

echo "Process completed"
