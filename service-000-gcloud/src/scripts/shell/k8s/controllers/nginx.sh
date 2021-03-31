#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"

VALUES_ENV_INJECTED="$HELM_VALUES"/nginx-env-injected.yml
inject_env_vars_yml "$HELM_VALUES"/nginx.yml

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

if [ "$LAST_ARG" =  "uninstall" ]
    then
        helm uninstall nginx -n nginx 
        return 1
fi

if [ "$LAST_ARG" =  "upgrade" ]
    then
        helm upgrade nginx \
            -f "$VALUES_ENV_INJECTED" \
            --atomic \
            --version 3.24.0 \
            --namespace nginx \
            ingress-nginx/ingress-nginx 
        return 1
fi

# throws error if no IP is provided
parse_general_flags "$@"
if [ -z "$INGRESS_IP" ]
    then
        chalk error 102
fi


if [ "$LAST_ARG" =  "install" ]
    then
        helm install nginx \
            -f "$VALUES_ENV_INJECTED" \
            --atomic \
            --version 3.24.0 \
            --create-namespace \
            --namespace nginx \
            --set controller.service.loadBalancerIP="$INGRESS_IP" \
            ingress-nginx/ingress-nginx \
            && progress_indicator long \
            && kubectl get svc -n nginx
        return 1
fi


