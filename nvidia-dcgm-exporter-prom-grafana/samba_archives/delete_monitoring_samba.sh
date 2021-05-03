#!/bin/bash
set -e
set x

echo "Deleting created metric endpoint that was to Prometheus for collecting GPU metrics from NVIDIA dcgm-exporter"

kubectl delete -f grafana-svc.yaml -n monitoring-gpu
kubectl delete -f grafana-ingress.yaml -n monitoring-gpu
kubectl delete -f dcgm-exporter_nodeaffinity.yaml -n monitoring-gpu
kubectl delete -f service-monitor.yaml -n monitoring-gpu

echo "Removing helm installed prometheus operator"
helm uninstall prometheus-operator -n monitoring-gpu

echo "Removing pvc."
kubectl delete pvc/alertmanager-prometheus-operator-alertmanager-db-alertmanager-prometheus-operator-alertmanager-0 pvc/prometheus-prometheus-operator-prometheus-db-prometheus-prometheus-operator-prometheus-0 -n monitoring-gpu

echo "Removing pv from samba share directory"
kubectl delete -f prometheus-dcgm-samba-pv.yaml -n monitoring-gpu
kubectl delete -f grafana-dcgm-pv.yaml -n monitoring-gpu
kubectl delete secret grafana-password --namespace monitoring-gpu
echo "Removing monitoring-gpu namespace"
kubectl delete namespace monitoring-gpu
echo "Process completed"
