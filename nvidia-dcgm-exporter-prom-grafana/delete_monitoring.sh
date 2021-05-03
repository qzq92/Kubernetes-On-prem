#!/bin/bash
#set -e

echo "Deleting created metric endpoint that was to Prometheus for collecting GPU metrics from NVIDIA dcgm-exporter"
kubectl delete -f grafana-ingress.yaml -n monitoring-gpu
kubectl delete -f dcgm-exporter.yaml -n monitoring-gpu
#kubectl delete -f dcgm-exporter_nodeaffinity.yaml -n monitoring-gpu
kubectl delete -f service-monitor.yaml -n monitoring-gpu

echo "Removing helm installed prometheus operator"
helm uninstall prometheus-operator -n monitoring-gpu

echo "Removing pvc."
kubectl delete pvc/alertmanager-prometheus-operator-alertmanager-db-alertmanager-prometheus-operator-alertmanager-0 pvc/prometheus-prometheus-operator-prometheus-db-prometheus-prometheus-operator-prometheus-0 -n monitoring-gpu

echo "Removing pv and secret"
kubectl delete -f prometheus-dcgm-pvc.yaml -n monitoring-gpu
kubectl delete -f prometheus-dcgm-pv.yaml -n monitoring-gpu
kubectl delete -f grafana-dcgm-pvc.yaml -n monitoring-gpu
kubectl delete -f grafana-dcgm-pv.yaml -n monitoring-gpu 
kubectl delete secret grafana-password --namespace monitoring-gpu

echo "Removing ingress-controller"
helm uninstall ingress-controller -n monitoring-gpu

echo "Removing monitoring-gpu namespace"
kubectl delete namespace monitoring-gpu
echo "Process completed"
