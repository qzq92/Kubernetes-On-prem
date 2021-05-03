#!/usr/bin/env bash
set e
set -x

echo "Deploying dashboard"
kubectl apply -f kubernetes-dashboard-1.10.1.yaml

echo "Process completed"
