
export NS=test-jar

oc new-project ${NS}
oc policy add-role-to-user edit system:serviceaccount:cicd-tools:jenkins -n ${NS}

oc new-build --binary=true --name="jar-spring-boot" openjdk-11-rhel7:1.1 -n ${NS}
oc new-app ${NS}/jar-spring-boot:0.0-0 --name=jar-spring-boot --allow-missing-imagestream-tags=true --as-deployment-config=true -n ${NS}
oc set triggers dc/jar-spring-boot --remove-all -n ${NS}
oc expose dc jar-spring-boot --port 8080 -n ${NS}
oc expose svc jar-spring-boot -n ${NS}
