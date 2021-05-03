#!/usr/bin/env bash
set -e

echo "Retrieving token to join"
kubeadm token create --print-join-command | tee ./joinnode.txt
