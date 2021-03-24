#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\${$#}\"

if [[ "$LAST_ARG" =  "uninstall" ]]
    then
        helm uninstall erpnext -n erpnext 
        kubectl delete -n erpnext -f $HELM_SECRETS/erpnext.yml 
        echo -e ${RED}erpnext uninstall${RESET_COLOR}
        return 1
fi

helm repo add frappe https://helm.erpnext.com
helm repo update
helm install erpnext \
    -f $HELM_VALUES/erpnext.yml \
    --atomic \
    --version 2.1.7 \
    --create-namespace \
    --namespace erpnext \
    frappe/erpnext \
    && echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" \
    && sleep 3m \
    && kubectl get svc -n erpnext
    && kubectl create -n erpnext -f $HELM_SECRETS/erpnext.yml \