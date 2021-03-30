#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"

helm repo add gitea-charts https://dl.gitea.io/charts/
helm repo update

if [ "$LAST_ARG" =  "uninstall" ]
    then
        helm uninstall gitea -n gitea \
            && kubectl delete pvc data-gitea-0 -n  gitea \
            && kubectl delete pvc data-gitea-mysql-master-0 -n gitea \
            && kubectl delete pvc data-gitea-mysql-slave-0 -n gitea
        return 1
fi

if [ "$LAST_ARG" = "upgrade" ]
    then
        helm upgrade gitea \
        -f "$HELM_VALUES"/gitea.yml \
            --atomic \
            --version 2.1.2 \
            --namespace gitea \
            gitea-charts/gitea 
        return 1
fi

if [ "$LAST_ARG" =  "install" ]
    then
        helm install gitea \
        -f "$HELM_VALUES"/gitea.yml \
            --atomic \
            --version 2.1.2 \
            --create-namespace \
            --namespace gitea \
            gitea-charts/gitea \
            && progress_indicator long \
            && echo -e "${BLUE}Default credentials.${RESET_COLOR}" \
            && echo -e "${BLUE}username:${RESET_COLOR} gitea_admin" \
            && echo -e "${BLUE}email:${RESET_COLOR} gitea@local.domain" \
            && echo -e "${BLUE}password:${RESET_COLOR} r8sA8CPHD9!bt6d" \
            && kubectl get svc -n gitea
        return 1
fi

# kubectl exec -n gitea --stdin --tty gitea-0 -- /bin/bash