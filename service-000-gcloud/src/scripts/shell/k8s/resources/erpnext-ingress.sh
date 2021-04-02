#!/bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"
ERPNEXT_INGRESS_MANIFEST="$SHELL_SCRIPTS"/k8s/resources/erpnext-ingress-manifest.yml

cat <<EOF > "$ERPNEXT_INGRESS_MANIFEST"
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  namespace: erpnext
  name: erpnext-ingress
  labels:
    app.kubernetes.io/instance: erpnext
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-prod
    kubernetes.io/ingress.class: nginx
    kubernetes.io/tls-acme: "true"
spec:
  rules:
    - host: erpnext.$REGISTERED_DOMAIN
      http:
        paths:
          - backend:
              serviceName: erpnext
              servicePort: 80
            path: /
  tls:
    - hosts:
        - erpnext.$REGISTERED_DOMAIN
      secretName: erpnext-tls-secret
EOF

if [ "$LAST_ARG" =  "uninstall" ]
    then
        kubectl delete -f "$ERPNEXT_INGRESS_MANIFEST" -n erpnext \
          && kubectl delete secrets erpnext-tls-secret -n erpnext \
          && rm "$ERPNEXT_INGRESS_MANIFEST"
        return 1
fi

if [ "$LAST_ARG" =  "install" ] || [ "$LAST_ARG" =  "upgrade" ]
    then
      kubectl create namespace erpnext
      kubectl apply -f "$ERPNEXT_INGRESS_MANIFEST" \
        && progress_indicator short \
        && rm "$ERPNEXT_INGRESS_MANIFEST" \
        && kubectl get ingress erpnext-ingress -n erpnext \
        && kubectl describe certificate -n erpnext
        return 1
fi
