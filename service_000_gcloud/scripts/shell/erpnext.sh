#! /bin/sh

# set -x
# set -euo pipefail

. connect.sh management

helm repo add frappe https://helm.erpnext.com
helm repo update
helm install -f ../../helm/values/erpnext.yml \
    --version 2.1.3 \
    --create-namespace \
    --namespace erpnext \
    erpnext frappe/erpnext

echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
sleep 3m 

kubectl get svc -n erpnext