#!/bin/bash
set -e

echo "Creating monitoring-gpu namespaces"
kubectl create ns monitoring-gpu

helm install ingress-controller ./nginx-controller/nginx-ingress-0.6.1.tgz --set controller.service.loadBalancerIP=192.168.111.45 -n monitoring-gpu

echo "Creating grafana secret, pv,pvc using nfs share"
kubectl create secret generic grafana-password --from-literal=admin-user=admin --from-literal=admin-password=admin --namespace monitoring-gpu
kubectl apply -f prometheus-dcgm-pv.yaml -n monitoring-gpu
kubectl apply -f prometheus-dcgm-pvc.yaml -n monitoring-gpu
kubectl apply -f grafana-dcgm-pv.yaml -n monitoring-gpu
kubectl apply -f grafana-dcgm-pvc.yaml -n monitoring-gpu

echo "Creating dcgm-exporter yaml"
kubectl create -f dcgm-exporter.yaml -n monitoring-gpu
#kubectl create -f dcgm-exporter_nodeaffinity.yaml -n monitoring-gpu

echo "Installing prometheus operator"
helm install prometheus-operator prometheus-operator-8.15.0.tgz -f prometheus-operator_values.yaml -n monitoring-gpu
#helm install prometheus-operator prometheus-operator-8.15.0/prometheus-operator -n monitoring-gpu

echo "Running serviceMonitor on Prometheus operator"
kubectl create -f service-monitor.yaml -n monitoring-gpu #Requires prometheus operator to be helm installed first as "serviceMonitor" type is Prometheus dependent operator.

kubectl apply -f grafana-ingress.yaml -n monitoring-gpu
echo "Process completed"
