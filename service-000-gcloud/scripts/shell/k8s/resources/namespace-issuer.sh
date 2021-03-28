#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"
NAMESPACE_ISSUER_MANIFEST="$SCRIPTS"/k8s/resources/namespace-issuer-manifest.yml

parse_general_flags "$@"
# throws error if no namespace is provided
parse_general_flags "$@"
if [ -z "$PROJECT_NAMESPACE" ] \
  || [ "$PROJECT_NAMESPACE" = "install" ] \
  || [ "$PROJECT_NAMESPACE" = "uninstall" ] \
  || [ "$PROJECT_NAMESPACE" = "upgrade" ]
    then
        chalk error 104
        exit 1
fi

cat <<EOF > "$NAMESPACE_ISSUER_MANIFEST"
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  namespace: $PROJECT_NAMESPACE
  name: letsencrypt-prod-"$PROJECT_NAMESPACE"
spec:
  acme:
    email: $LETSENCRYPT_EMAIL
    server: https://acme-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      name: $PROJECT_NAMESPACE-letsencrypt-key
    solvers:
    - http01:
        ingress:
          class: nginx
EOF

if [ "$LAST_ARG" =  "uninstall" ]
    then
      kubectl delete -f "$NAMESPACE_ISSUER_MANIFEST" -n "$PROJECT_NAMESPACE" \
        && rm "$NAMESPACE_ISSUER_MANIFEST"
      return 1
fi

if [ "$LAST_ARG" =  "install" ] || [ "$LAST_ARG" =  "upgrade" ]
    then
      kubectl create namespace "$NAMESPACE_ISSUER_MANIFEST"
      kubectl apply -f "$NAMESPACE_ISSUER_MANIFEST" \
        && progress_indicator short \
        && rm "$NAMESPACE_ISSUER_MANIFEST" \
        && kubectl describe issuer letsencrypt-prod -n "$PROJECT_NAMESPACE"
      return 1
fi
