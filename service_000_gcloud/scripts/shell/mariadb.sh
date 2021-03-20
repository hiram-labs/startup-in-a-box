#! /bin/sh

# set -x
# set -euo pipefail

. connect.sh management

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install erpnext-mariadb \
    -f ../../helm/values/mariadb.yml \
    --atomic \
    --create-namespace \
    --namespace erpnext \
    bitnami/mariadb

echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
sleep 3m 

kubectl get svc