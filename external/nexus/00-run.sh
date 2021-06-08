#!/bin/bash

podman run \
  --name=nexus \
  --rm \
  --publish=8081:8081 \
  --volume="/var/lib/nexus:/nexus-data:z" \
  --detach \
  helper.90ocp.example.com:5000/cicd/nexus3:3.30.0
