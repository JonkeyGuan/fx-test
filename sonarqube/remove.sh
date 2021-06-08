
oc delete Secret sonarqube-ldap-bind-dn sonarqube-postgresql

oc delete svc sonarqube sonarqube-postgresql

oc delete dc sonarqube sonarqube-postgresql

oc delete route sonarqube

oc delete pvc sonarqube-data sonarqube-postgresql
