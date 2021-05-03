#!/bin/bash
set -e
set x
echo "Stopping apache2 server via docker-compose"
docker-compose down

echo "Process completed"
