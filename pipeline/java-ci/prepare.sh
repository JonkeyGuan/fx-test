
export NS=test-java

oc new-project ${NS}
oc policy add-role-to-user edit system:serviceaccount:cicd-tools:jenkins -n ${NS}

oc new-build --binary=true --name="hello-spring-boot" openjdk-11-rhel7:1.1 -n ${NS}
oc new-app ${NS}/hello-spring-boot:0.0-0 --name=hello-spring-boot --allow-missing-imagestream-tags=true --as-deployment-config=true -n ${NS}
oc set triggers dc/hello-spring-boot --remove-all -n ${NS}
oc expose dc hello-spring-boot --port 8080 -n ${NS}
oc expose svc hello-spring-boot -n ${NS}
