#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"

if [[ "$LAST_ARG" =  "uninstall" ]]
    then
        kubectl delete -f https://github.com/jetstack/cert-manager/releases/download/v1.2.0/cert-manager.yml
        rm "$SCRIPTS"/k8s/resources/cert-manager-resource.yml
        return 1
fi

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.2.0/cert-manager.yml
rm "$SCRIPTS"/k8s/resources/cert-manager-resource.yml
kubectl get pods --namespace cert-manager