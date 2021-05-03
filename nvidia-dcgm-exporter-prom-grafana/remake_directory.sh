#!/bin/bash
set e
set -x

echo "Remaking persistentvolume directories for chronograf and influxdb"
sudo rm -rf /home/qzq/Desktop/k8s/prometheus-dcgm
sudo mkdir /home/qzq/Desktop/k8s/prometheus-dcgm/alertmanager /home/qzq/Desktop/k8s/prometheus-dcgm/server && sudo chown 65534:65534 /home/qzq/Desktop/k8s/prometheus-dcgm/alertmanager /home/qzq/Desktop/k8s/prometheus-dcgm/server

echo "Directory created and changed ownership to 65534:65534"
