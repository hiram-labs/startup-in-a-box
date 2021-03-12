#! /bin/sh

# set -x
set -euo pipefail

. connect.sh intellectual-property

helm repo add gitea-charts https://dl.gitea.io/charts/
helm repo update
helm install -f ../../helm/values/gitea.yml \
    --set service.http.loadBalancerIP=$GITEAHTTP_IP \
    --set service.ssh.loadBalancerIP=$GITEASSH_IP \
    --set gitea.config.server.DOMAIN=$GITEAHTTP_IP \
    --set gitea.config.server.SSH_DOMAIN=$GITEASSH_IP \
    --set gitea.config.server.ROOT_URL="http://$GITEAHTTP_IP:3000" \
    gitea gitea-charts/gitea

echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
sleep 3m 
# export SERVICE_IP=$(kubectl get svc --namespace default gitea --template "{{ range (index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}")
# echo -e "${BLUE}Service IP:${RESET_COLOR} ${SERVICE_IP}"
echo -e "${BLUE}Default credentials.${RESET_COLOR}"
echo -e "${BLUE}username:${RESET_COLOR} gitea_admin"
echo -e "${BLUE}email:${RESET_COLOR} gitea@local.domain"
echo -e "${BLUE}password:${RESET_COLOR} r8sA8CPHD9!bt6d"
# kubectl create clusterrolebinding openproject-deploy --clusterrole=cluster-admin --serviceaccount=default:openproject
kubectl get svc