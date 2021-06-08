
oc delete route jenkins

oc delete dc jenkins

oc delete sa jenkins

oc delete svc jenkins jenkins-jnlp

oc delete RoleBinding jenkins_edit

oc delete cm jenkins-maven-slave

oc delete pvc jenkins jenkins-maven-slave-repository
