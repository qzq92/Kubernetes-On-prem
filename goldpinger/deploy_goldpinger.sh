#!/usr/bin/env bash
set -e
set x


echo "Creating goldpinger namespace"
kubectl create namespace goldpinger
echo "Applying goldpinger yaml plugins"
kubectl apply -f goldpinger.yaml

echo "Applying service monitor for goldpinger"
kubectl apply -f goldpinger-service-monitor.yaml
echo "Process completed"
