#!/bin/bash -ex

IMPORT_FILE="watchpoint.tar"

if [ -f "$IMPORT_FILE" ]; then
    docker load --input "$IMPORT_FILE"
    rm "$IMPORT_FILE"
fi

exec /usr/bin/docker-compose up
