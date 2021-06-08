#!/bin/bash

my_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)"

CONTAINER_ID=$(podman ps | grep nexus | awk -F " " '{print $1}')

NEXUS_PASSWORD=$(podman exec ${CONTAINER_ID} /bin/sh  -c "cat /nexus-data/admin.password")

nexus_url=192.168.31.114:8081
nexus_admin_user=admin
nexus_admin_password=admin123

${my_dir}/nexus3-change-admin-password.sh ${nexus_url} ${NEXUS_PASSWORD} ${nexus_admin_password}
${my_dir}/nexus3-allow-anonymous-access.sh ${nexus_url} ${nexus_admin_password}
${my_dir}/nexus3-configure.sh ${nexus_admin_user} ${nexus_admin_password} ${nexus_url}

podman stop ${CONTAINER_ID}

sleep 5

${my_dir}/00-run.sh
