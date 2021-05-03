#!/bin/sh
set -e
set x

echo "Delete the service account in the current namespace (we assume default)"
kubectl delete serviceaccount k8dash-sa

echo "Deleting k8dash yaml"
kubectl delete -f k8sdash.yaml

echo "Deleting k8s metric server"
kubectl delete -f k8smetricserver.yaml


