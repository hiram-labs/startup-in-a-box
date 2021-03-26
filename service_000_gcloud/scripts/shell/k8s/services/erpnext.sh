#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"

helm repo add frappe https://helm.erpnext.com
helm repo update

if [[ "$LAST_ARG" =  "uninstall" ]]
    then
        helm uninstall erpnext -n erpnext \
            && kubectl delete -n erpnext -f "$HELM_SECRETS"/erpnext-db.yml
        return 1
fi

if [[ "$LAST_ARG" =  "upgrade" ]]
    then
        helm upgrade erpnext \
            -f "$HELM_VALUES"/erpnext.yml \
            --atomic \
            --version 2.1.7 \
            --namespace erpnext \
            frappe/erpnext
        return 1
fi

if [[ "$LAST_ARG" =  "install" ]]
    then
        helm install erpnext \
            -f "$HELM_VALUES"/erpnext.yml \
            --atomic \
            --version 2.1.7 \
            --create-namespace \
            --namespace erpnext \
            frappe/erpnext \
            && progress_indicator long \
            && kubectl get svc -n erpnext \
            && kubectl create -n erpnext -f "$HELM_SECRETS"/erpnext-db.yml
        return 1
fi
