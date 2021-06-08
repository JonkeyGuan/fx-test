#!/bin/bash

DOMAIN=$(oc cluster-info | grep Kubernetes | awk -F "api." '{print $2}' | awk -F ":" '{print $1}')

NS=$(oc project | awk -F "\"" '{print $2}')

oc new-app -f sonarqube-persistent-template.yaml \
--param=SONAR_IMAGE=helper.90ocp.example.com:5000/cicd/sonarqube:7.9.2 
