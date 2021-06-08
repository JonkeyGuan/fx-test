
oc delete sa gitea

oc delete svc gitea gitea-postgresql

oc delete dc gitea gitea-postgresql

oc delete route gitea

oc delete pvc gitea-postgres-data gitea-repositories

oc delete cm gitea-config

