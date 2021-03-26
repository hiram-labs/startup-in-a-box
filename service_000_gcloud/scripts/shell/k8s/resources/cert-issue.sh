#! /bin/sh

# set -x
# set -euo pipefail

parse_general_flags "$@"
eval LAST_ARG=\"\$\{$#\}\"

CERT_NAMESPACE=${PROJECT_NAMESPACE:-"default"}

cat <<EOF > "$SCRIPTS"/k8s/resources/cert-issue-resource.yml
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  namespace: "$CERT_NAMESPACE"
  name: letsencrypt-prod
spec:
  acme:
    email: hiram.labs@gmail.com
    server: https://acme-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      name: letsencrypt-prod
    solvers:
    - http01:
        ingress:
          class: nginx
EOF

if [[ "$LAST_ARG" =  "uninstall" ]]
    then
        kubectl delete -f "$SCRIPTS"/k8s/resources/cert-issue-resource.yml \
          && kubectl delete secrets letsencrypt-prod -n "$CERT_NAMESPACE" \
          && rm "$SCRIPTS"/k8s/resources/cert-issue-resource.yml
        return 1
fi

if [[ "$LAST_ARG" =  "install" ]] || [[ "$LAST_ARG" =  "upgrade" ]]
    then
        kubectl apply -f "$SCRIPTS"/k8s/resources/cert-issue-resource.yml \
          && progress_indicator short \
          && rm "$SCRIPTS"/k8s/resources/cert-issue-resource.yml \
          && kubectl describe issuer letsencrypt-prod -n "$CERT_NAMESPACE"
        return 1
fi
