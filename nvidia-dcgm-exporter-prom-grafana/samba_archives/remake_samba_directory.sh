#!/bin/bash
set e
set -x

echo "Remaking persistentvolume directories for chronograf and influxdb"
sudo rm -rf /smbmount
sudo mkdir /smbmount/prometheus-dcgm/alertmanager /smbmount/prometheus-dcgm/server

echo "Process completed"
