#!/bin/bash
set -e
set x

echo "Starting apache2 server via docker-compose in detached mode"
docker-compose up -d 

echo "Process completed"
