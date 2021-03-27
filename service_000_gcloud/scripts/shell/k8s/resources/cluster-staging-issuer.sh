#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"
CLUSTER_STAGING_ISSUER_MANIFEST="$SCRIPTS"/k8s/resources/cluster-staging-issuer-manifest.yml

cat <<EOF > "$CLUSTER_STAGING_ISSUER_MANIFEST"
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-staging
spec:
  acme:
    email: hiram.labs@gmail.com
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      name: cluster-staging-letsencrypt-key
    solvers:
    - http01:
        ingress:
          class: nginx
EOF

if [[ "$LAST_ARG" =  "uninstall" ]]
    then
        kubectl delete -f "$CLUSTER_STAGING_ISSUER_MANIFEST" \
          && rm "$CLUSTER_STAGING_ISSUER_MANIFEST"
        return 1
fi

if [[ "$LAST_ARG" =  "install" ]] || [[ "$LAST_ARG" =  "upgrade" ]]
    then
        kubectl apply -f "$CLUSTER_STAGING_ISSUER_MANIFEST" \
          && progress_indicator short \
          && rm "$CLUSTER_STAGING_ISSUER_MANIFEST" \
          && kubectl describe ClusterIssuer letsencrypt-staging
        return 1
fi
