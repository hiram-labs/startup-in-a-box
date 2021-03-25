# #! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"

if [[ "$LAST_ARG" =  "uninstall" ]]
    then
        helm uninstall nginx -n nginx 
        echo -e "${RED}"nginx uninstall"${RESET_COLOR}"
        return 1
fi

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install nginx \
    -f "$HELM_VALUES"/nginx.yml \
    --atomic \
    --create-namespace \
    --namespace nginx \
    ingress-nginx/ingress-nginx

echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
sleep 3m

kubectl get svc -n nginx