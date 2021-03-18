#! /bin/sh

# set -x
# set -euo pipefail

. connect.sh management

helm repo add kvaps https://kvaps.github.io/charts
helm repo update
helm install nfs-server \
    -f ../../helm/values/nfs.yml \
    --version 1.2.1 \
    --create-namespace \
    --namespace nfs \
    kvaps/nfs-server-provisioner

echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
sleep 3m 