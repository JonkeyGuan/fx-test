#!/bin/bash

podman container run \
  --name jenkins \
  --rm \
  --detach \
  --privileged \
  --publish 8088:8080 \
  --publish 50000:50000 \
  --volume="/var/lib/jenkins:/var/lib/jenkins:z" \
  --volume="/root/resolv.conf:/etc/resolv.conf:z" \
  -e JENKINS_PASSWORD=admin \
helper.90ocp.example.com:5000/ocp4/openshift4@sha256:f65ae03a27ad36b92acdaf190ad2887902fae0884149a39126662c7ec69fbe4d
