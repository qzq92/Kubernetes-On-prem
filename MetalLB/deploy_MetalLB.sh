#!/usr/bin/env bash
set -e

echo "Applying metallb yaml plugins"
kubectl apply -f metallb.yaml
echo "Applying metallb settings"
kubectl apply -f metallb_settings.yaml
echo "Process completed"
