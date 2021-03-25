#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"

if [[ "$LAST_ARG" =  "uninstall" ]]
    then
        helm uninstall gitea -n gitea 
        echo -e "${RED}"gitea uninstall"${RESET_COLOR}"
        return 1
fi

helm repo add gitea-charts https://dl.gitea.io/charts/
helm repo update
helm install gitea \
    -f "$HELM_VALUES"/gitea.yml \
    --atomic \
    --set service.http.loadBalancerIP="$GITEA_HTTP_I"P \
    --set service.ssh.loadBalancerIP="$GITEA_SSH_IP" \
    --set gitea.config.server.DOMAIN="$GITEA_HTTP_IP" \
    --set gitea.config.server.SSH_DOMAIN="$GITEA_SSH_IP" \
    --set gitea.config.server.ROOT_URL="http://$GITEA_HTTP_IP:3000" \
    --create-namespace \
    --namespace gitea \
    gitea-charts/gitea

echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
sleep 3m 
echo -e "${BLUE}Default credentials.${RESET_COLOR}"
echo -e "${BLUE}username:${RESET_COLOR} gitea_admin"
echo -e "${BLUE}email:${RESET_COLOR} gitea@local.domain"
echo -e "${BLUE}password:${RESET_COLOR} r8sA8CPHD9!bt6d"

kubectl get svc -n gitea