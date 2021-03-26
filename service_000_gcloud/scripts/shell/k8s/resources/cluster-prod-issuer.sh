#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"

cat <<EOF > "$SCRIPTS"/k8s/resources/cluster-prod-issuer-manifest.yml
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    email: hiram.labs@gmail.com
    server: https://acme-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      name: cluster-prod-letsencrypt-key
    solvers:
    - http01:
        ingress:
          class: nginx
EOF

if [[ "$LAST_ARG" =  "uninstall" ]]
    then
        kubectl delete -f "$SCRIPTS"/k8s/resources/cluster-prod-issuer-manifest.yml \
          && kubectl delete secrets letsencrypt-prod \
          && rm "$SCRIPTS"/k8s/resources/cluster-prod-issuer-manifest.yml
        return 1
fi

if [[ "$LAST_ARG" =  "install" ]] || [[ "$LAST_ARG" =  "upgrade" ]]
    then
        kubectl apply -f "$SCRIPTS"/k8s/resources/cluster-prod-issuer-manifest.yml \
          && progress_indicator short \
          && rm "$SCRIPTS"/k8s/resources/cluster-prod-issuer-manifest.yml \
          && kubectl describe ClusterIssuer letsencrypt-prod
        return 1
fi
