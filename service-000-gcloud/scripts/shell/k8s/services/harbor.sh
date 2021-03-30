#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"

helm repo add harbor https://helm.goharbor.io
helm repo update 

if [ "$LAST_ARG" =  "uninstall" ]
    then
        helm uninstall harbor -n harbor \
            && kubectl delete pvc harbor -n harbor
        return 1
fi

if [ "$LAST_ARG" =  "upgrade" ]
    then
        helm upgrade harbor \
            -f "$HELM_VALUES"/harbor.yml \
            --atomic \
            --version 1.5.4 \
            --namespace harbor \
            harbor/harbor
        return 1
fi

if [ "$LAST_ARG" =  "install" ]
    then
        helm install harbor \
            -f "$HELM_VALUES"/harbor.yml \
            --atomic \
            --version 1.5.4 \
            --create-namespace \
            --namespace harbor \
            harbor/harbor \
            && progress_indicator long \
            && echo -e "${BLUE}Admin username:${RESET_COLOR} admin" \
            && echo -e "${BLUE}Admin password:${RESET_COLOR} Harbor12345" \
            && kubectl get svc -n harbor
        return 1
fi