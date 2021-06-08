#!/bin/bash

my_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)"
resource="."
source ${my_dir}/utils.sh
source ${my_dir}/env.conf
source ${my_dir}/${resource}/env.conf

token_files="${my_dir}/*.conf ${my_dir}/${resource}/*.conf"
token_cmd=$(getTokenCmd ${token_files})

namespace=$(oc project | awk -F "\"" '{print $2}')
token_cmd=$(addTokenCmd "${token_cmd}" "namespace" "${namespace}")

eval "${token_cmd} ${my_dir}/${resource}/jenkins-maven-slave-configmap.yaml" | oc apply -n ${namespace} -f -

eval "${token_cmd} ${my_dir}/${resource}/jenkins-maven-slave-pvc.yaml" | oc -n ${namespace} apply -f -

eval "${token_cmd} ${my_dir}/${resource}/jenkins-persistent.yaml" | oc -n ${namespace} apply -f -
