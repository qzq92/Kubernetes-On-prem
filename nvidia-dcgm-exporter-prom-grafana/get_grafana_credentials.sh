#!/bin/bash
set e
set -x

echo "Retrieving grafana admin password"
kubectl get secret --namespace monitoring-gpu prometheus-operator-grafana -o jsonpath="{.data.admin-password}" | base64 --decode
