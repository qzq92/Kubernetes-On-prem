#!/bin/bash

echo "Retagging images required for metallb"
for i in $(cat image.list);
do docker rmi $i; done
