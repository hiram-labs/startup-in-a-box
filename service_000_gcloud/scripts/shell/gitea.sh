#! /bin/sh

BLUE='\033[1;34m'
RESET_COLOR='\033[0m' 

. ./connect.sh intellectual-property

helm repo update
helm repo add gitea-charts https://dl.gitea.io/charts/
helm install -f ../../helm/values/gitea.yml gitea gitea-charts/gitea

echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
sleep 3m 
# export OPENPROJECT_PASSWORD=$(kubectl exec --namespace default -it svc/openproject -c openproject -- /bin/cat /run/secrets/chart-admin-password && echo)
# echo -e "${BLUE}Admin password:${RESET_COLOR} ${OPENPROJECT_PASSWORD}"
# kubectl create clusterrolebinding openproject-deploy --clusterrole=cluster-admin --serviceaccount=default:openproject
kubectl get svc