
export NS=test-binary

oc new-project ${NS}
oc policy add-role-to-user edit system:serviceaccount:cicd-tools:jenkins -n ${NS}

oc new-build --name="hello-openshift" golang:1.14.7-ubi8 --dockerfile=$'FROM golang:1.14.7-ubi8\nUSER root\nCOPY --chown=default:root hello_openshift /opt/app-root/gobinary\nRUN chmod 755 /opt/app-root/gobinary\nUSER 1001\nENTRYPOINT ["/opt/app-root/gobinary"]' -n ${NS}
sleep 5
oc cancel-build hello-openshift-1
oc new-app ${NS}/hello-openshift:0.0-0 --name=hello-openshift --allow-missing-imagestream-tags=true --as-deployment-config=true -n ${NS}
oc set triggers dc/hello-openshift --remove-all -n ${NS}
oc expose dc hello-openshift --port 18080 -n ${NS}
oc expose svc hello-openshift -n ${NS}
