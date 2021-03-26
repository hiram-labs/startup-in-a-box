#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\" 

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

if [[ "$LAST_ARG" =  "uninstall" ]]
    then
        helm uninstall erpnext-mariadb -n erpnext 
        return 1
fi

if [[ "$LAST_ARG" =  "upgrade" ]]
    then
        helm upgrade erpnext-mariadb \
            -f "$HELM_VALUES"/mariadb.yml \
            --atomic \
            --version 10.5.9 \
            --namespace erpnext \
            bitnami/mariadb 
        return 1
fi

if [[ "$LAST_ARG" =  "install" ]]
    then
        helm install erpnext-mariadb \
            -f "$HELM_VALUES"/mariadb.yml \
            --atomic \
            --version 10.5.9 \
            --create-namespace \
            --namespace erpnext \
            bitnami/mariadb \
            && progress_indicator long \
            && kubectl get svc -n erpnext
        return 1
fi