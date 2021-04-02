#!/bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"

if [ "$LAST_ARG" =  "uninstall" ]
    then
        kubectl delete -f https://github.com/jetstack/cert-manager/releases/download/v1.2.0/cert-manager.yaml
        return 1
fi

if [ "$LAST_ARG" =  "install" ] || [ "$LAST_ARG" =  "upgrade" ]
    then
        kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.2.0/cert-manager.yaml \
            && kubectl get pods --namespace cert-manager
        return 1
fi
