#!/bin/sh
set -e

echo "Applying k8s metric server"
kubectl apply -f k8smetricserver.yaml

echo "Applying k8dash yaml"
kubectl apply -f k8sdash.yaml

echo "Create the service account in the current namespace (we assume default)"
kubectl create serviceaccount k8dash-sa

echo "Give that service account root on the cluster"
kubectl create clusterrolebinding k8dash-sa --clusterrole=cluster-admin --serviceaccount=default:k8dash-sa

echo "Find the secret that was created to hold the token for the SA"
kubectl get secrets

# Show the contents of the secret to extract the token
#kubectl describe secret k8dash-sa-token-xxxxx
