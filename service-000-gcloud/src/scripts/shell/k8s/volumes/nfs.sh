#!/bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"

VALUES_ENV_INJECTED="$HELM_VALUES"/nfs-env-injected.yml
inject_env_vars_yml "$HELM_VALUES"/nfs.yml

helm repo add kvaps https://kvaps.github.io/charts
helm repo update

if [ "$LAST_ARG" =  "uninstall" ]
    then
        helm uninstall nfs -n nfs 
        return 1
fi

if [ "$LAST_ARG" =  "upgrade" ]
    then
        helm upgrade nfs-server \
            -f "$VALUES_ENV_INJECTED" \
            --atomic \
            --version 1.2.1 \
            --namespace nfs \
            kvaps/nfs-server-provisioner 
        return 1
fi

if [ "$LAST_ARG" =  "install" ]
    then
        helm install nfs-server \
            -f "$VALUES_ENV_INJECTED" \
            --atomic \
            --version 1.2.1 \
            --create-namespace \
            --namespace nfs \
            kvaps/nfs-server-provisioner \
            && progress_indicator long \
            && kubectl patch storageclass standard -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}' \
            && kubectl get pvc -n nfs
        return 1
fi
