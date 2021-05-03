#!/bin/bash

echo "Retagging images required for kubeflow"
for i in $(cat image.list);
do docker rmi $i; done
