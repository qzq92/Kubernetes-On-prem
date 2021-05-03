#!/bin/bash

echo "Retagging images required for kubeflow"
for i in $(cat image.list);
#do docker tag $i goharbor.io/admin/$i; docker push goharbor.io/admin/$i; done
do docker push goharbor.io/admin/$i; done
