#!/bin/bash

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"

VALUES_ENV_INJECTED="$HELM_VALUES"/harbor-env-injected.yml
inject_env_vars_yml "$HELM_VALUES"/harbor.yml

helm repo add harbor https://helm.goharbor.io
helm repo update 

if [ "$LAST_ARG" =  "uninstall" ]
    then
        helm uninstall harbor -n harbor \
            && kubectl delete pvc harbor -n harbor
        exit 0
fi

if [ "$LAST_ARG" =  "upgrade" ]
    then
        helm upgrade harbor \
            -f "$VALUES_ENV_INJECTED" \
            --atomic \
            --version 1.5.4 \
            --namespace harbor \
            harbor/harbor
        exit 0
fi

if [ "$LAST_ARG" =  "install" ]
    then
        helm install harbor \
            -f "$VALUES_ENV_INJECTED" \
            --atomic \
            --version 1.5.4 \
            --create-namespace \
            --namespace harbor \
            harbor/harbor \
            && progress_indicator long \
            && echo -e "${BLUE}Admin username:${RESET_STYLE} admin" \
            && echo -e "${BLUE}Admin password:${RESET_STYLE} Harbor12345" \
            && kubectl get svc -n harbor
        exit 0
fi
