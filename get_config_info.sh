#!/usr/bin/env bash
set -e

echo "Get the config info associated with current context for the cluster"
kubectl config view --flatten --minify > cluster-cert.txt
echo "Process completed"
