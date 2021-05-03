#!/usr/bin/env bash
set -e

worker=klabmaster01
echo "Tainting GPU nodes as noschedule and worker node" #This would only allow pods that have atoleration for such a taint can be scheduled on those nodes
kubectl label node $worker node-role.kubernetes.io/worker=worker --overwrite
kubectl taint nodes $worker nvidia.com/gpu=present:NoSchedule
