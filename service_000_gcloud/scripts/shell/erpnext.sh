#! /bin/sh

# set -x
# set -euo pipefail

. connect.sh management
# . nfs.sh
# . mariadb.sh

helm repo add frappe https://helm.erpnext.com
helm repo update
helm install erpnext \
    -f ../../helm/values/erpnext.yml \
    --version 2.1.2 \
    --create-namespace \
    --namespace erpnext \
    frappe/erpnext

echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
sleep 3m

kubectl create -n erpnext -f ../../helm/secrets/erpnext.yml

kubectl get svc -n erpnext