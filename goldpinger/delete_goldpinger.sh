#!/usr/bin/env bash
set -e
set x

echo "Removing service monitor for goldpinger"
kubectl delete -f goldpinger-service-monitor.yaml

echo "Removing goldpinger settings"
kubectl delete -f goldpinger.yaml
echo "Removing goldpinger namespace"
kubectl delete namespace goldpinger
echo "Process completed"
