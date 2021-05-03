#!/usr/bin/env bash
set -e

echo "Creating yaml for installing csi on k8s"
kubectl create -f csi-smb-controller.yaml
kubectl create -f csi-smb-driver.yaml
kubectl create -f csi-smb-node.yaml
kubectl create -f rbac-csi-smb-controller.yaml

#The followng steps is to be executed if you want to link up to a samba server hosted on one of local networked machines
: '
echo "Creating secret storing Samba Server username, password for qzq and samba storageclass"
kubectl create secret generic smbcreds --from-literal username=xxx --from-literal password=P@ssw0rd1
kubectl create -f smb-storageclass-xxx.yaml
kubectl create secret generic smbcredsuser --from-literal username=users --from-literal password=P@ssw0rd1
kubectl create -f smb-storageclass.yaml #smb 

echo "Setting default storageclass to samba share"
kubectl create -f smb-pvc.yaml
kubectl create -f testpod.yaml
'
echo "Process completed"

