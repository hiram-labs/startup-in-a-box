#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\" 

if [[ "$LAST_ARG" =  "uninstall" ]]
    then
        helm uninstall erpnext-mariadb -n erpnext 
        echo -e "${RED}"erpnext uninstall"${RESET_COLOR}"
        return 1
fi

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install erpnext-mariadb \
    -f "$HELM_VALUES"/mariadb.yml \
    --atomic \
    --create-namespace \
    --namespace erpnext \
    bitnami/mariadb

echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
sleep 3m 
kubectl get svc -n erpnext