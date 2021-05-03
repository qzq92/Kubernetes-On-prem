#!/bin/bash

echo "Retagging images required for kubeflow"
for i in $(cat kubeadm_config_image.list);
do docker rmi $i; done
