#!/bin/bash

my_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)"

CONTAINER_ID=$(podman ps | grep nexus | awk -F " " '{print $1}')

podman exec ${CONTAINER_ID} -- /bin/sh  -c "echo nexus.scripts.allowCreation=true >> /nexus-data/etc/nexus.properties"

