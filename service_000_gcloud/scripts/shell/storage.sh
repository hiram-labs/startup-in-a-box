#! /bin/sh

# set -x
# set -euo pipefail

STORAGE_NAME=storage

# . cluster.sh ${STORAGE_NAME} 1
# . connect.sh ${STORAGE_NAME} 

# helm repo add kvaps https://kvaps.github.io/charts
# helm repo update
# helm install nfs-server \
#     --version 1.2.1 \
#     --create-namespace \
#     --namespace nfs \
#     kvaps/nfs-server-provisioner

# echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
# sleep 3m 

helm repo add ckotzbauer https://ckotzbauer.github.io/helm-charts
helm repo update
helm install nfs-client \
    --version 1.0.2 \
    --set nfs.server=nfs-server.nfs.svc.cluster.local \
    --set nfs.path=/exported/path \
    --create-namespace \
    --namespace nfs \
    ckotzbauer/nfs-client-provisioner