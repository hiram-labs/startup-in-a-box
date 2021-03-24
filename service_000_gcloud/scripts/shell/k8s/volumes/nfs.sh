#! /bin/sh

# set -x
# set -euo pipefail

if [[ "$1" =  "uninstall" ]]
    then
        helm uninstall nfs -n nfs 
        echo -e ${RED}nfs uninstall${RESET_COLOR}
        return 1
fi

helm repo add kvaps https://kvaps.github.io/charts
helm repo update
helm install nfs-server \
    -f $HELM_VALUES/nfs.yml \
    --atomic \
    --version 1.2.1 \
    --create-namespace \
    --namespace nfs \
    kvaps/nfs-server-provisioner

echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
sleep 3m 

kubectl get pvc -n nfs