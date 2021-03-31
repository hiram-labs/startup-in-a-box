#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\" 

VALUES_ENV_INJECTED="$HELM_VALUES"/erpnext-db-env-injected.yml
inject_env_vars_yml "$HELM_VALUES"/erpnext-db.yml

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

if [ "$LAST_ARG" =  "uninstall" ]
    then
        helm uninstall erpnext-mariadb -n erpnext \
        && kubectl delete pvc data-erpnext-mariadb-0 -n erpnext \
        && kubectl delete pvc erpnext -n erpnext \
        && kubectl delete pvc erpnext-logs -n erpnext
        return 1
fi

if [ "$LAST_ARG" =  "upgrade" ]
    then
        helm upgrade erpnext-mariadb \
            -f "$VALUES_ENV_INJECTED" \
            --atomic \
            --namespace erpnext \
            bitnami/mariadb 
        return 1
fi

if [ "$LAST_ARG" =  "install" ]
    then
        helm install erpnext-mariadb \
            -f "$VALUES_ENV_INJECTED" \
            --atomic \
            --create-namespace \
            --namespace erpnext \
            bitnami/mariadb \
            && progress_indicator long \
            && kubectl get svc -n erpnext
        return 1
fi