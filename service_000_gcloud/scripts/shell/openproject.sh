#! /bin/sh

BLUE='\033[1;34m'
RESET_COLOR='\033[0m' 

. ./connect.sh management

helm repo update
helm install openproject ../../helm/charts/openproject/

echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
sleep 3m 
# export OPENPROJECT_PASSWORD=$(kubectl exec --namespace default -it svc/openproject -c openproject -- /bin/cat /run/secrets/chart-admin-password && echo)
# echo -e "${BLUE}Admin password:${RESET_COLOR} ${OPENPROJECT_PASSWORD}"
# kubectl create clusterrolebinding openproject-deploy --clusterrole=cluster-admin --serviceaccount=default:openproject
kubectl get svc