#! /bin/sh

# set -x
# set -euo pipefail

if [[ "$1" =  "uninstall" ]]
    then
        helm uninstall erpnext -n erpnext 
        kubectl delete -n erpnext -f ../../helm/secrets/erpnext.yml 
        echo -e ${RED}erpnext uninstall${RESET_COLOR}

fi

. connect.sh management
. nfs.sh
. mariadb.sh

helm repo add frappe https://helm.erpnext.com
helm repo update
helm install erpnext \
    -f ../../helm/values/erpnext.yml \
    --atomic \
    --version 2.1.3 \
    --create-namespace \
    --namespace erpnext \
    frappe/erpnext

echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
sleep 3m

kubectl create -n erpnext -f ../../helm/secrets/erpnext.yml

kubectl get svc -n erpnext