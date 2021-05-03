#!/usr/bin/env bash

echo "Applying NVIDIA plugins"
kubectl create -f nvidia-device-plugin-1.0.0.yml
kubectl get nodes "-o=custom-columns=NAME:.metadata.name,GPU:.status.allocatable.nvidia\.com/gpu"

echo "Labelling worker node which will serve as trains node"
kubectl label node klabmaster01 node-role.kubernetes.io/worker= app=trains

echo "Showing node labels"
kubectl get nodes --show-labels

echo "Process completed"

