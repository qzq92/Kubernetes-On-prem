#!/usr/bin/env bash
set -e

echo "Removing metallb settings"
kubectl delete -f metallb_settings.yaml
echo "Removing metallb yaml plugins"
kubectl delete -f metallb.yaml
echo "Process completed"
