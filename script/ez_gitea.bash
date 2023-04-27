#!/bin/bash

# NOTE: Avoids problems with relative paths.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

docker-compose -f ../docker-compose/docker-compose.yml --env-file ../SETTINGS up -d
sleep 2
google-chrome-stable --user-data-dir="/tmp" --app="http://localhost:3000/" & CHROME_PID=$!
wait $CHROME_PID
docker-compose -f ../docker-compose/docker-compose.yml --env-file ../SETTINGS stop
