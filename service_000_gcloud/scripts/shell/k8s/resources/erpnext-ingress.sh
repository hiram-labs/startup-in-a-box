#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"

cat <<EOF > "$SCRIPTS"/k8s/resources/erpnext-ingress-resource.yml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  namespace: erpnext
  name: erpnext-ingress
  annotations:
    kubernetes.io/ingress.class: nginx
    cert-manager.io/issuer: letsencrypt-prod
spec:
  rules:
    - host: erpnext.hiramlabs.com
      http:
        paths:
          - backend:
              serviceName: erpnext
              servicePort: 80
            path: /
  tls:
    - hosts:
        - erpnext.hiramlabs.com
      secretName: erpnext-tls-secret
EOF

if [[ "$LAST_ARG" =  "uninstall" ]]
    then
        kubectl delete -f "$SCRIPTS"/k8s/resources/erpnext-ingress-resource.yml \
          && kubectl delete secrets erpnext-tls-secret -n erpnext \
          && rm "$SCRIPTS"/k8s/resources/erpnext-ingress-resource.yml
        return 1
fi

if [[ "$LAST_ARG" =  "install" ]] || [[ "$LAST_ARG" =  "upgrade" ]]
    then
        kubectl apply -f "$SCRIPTS"/k8s/resources/erpnext-ingress-resource.yml \
          && progress_indicator short \
          && rm "$SCRIPTS"/k8s/resources/erpnext-ingress-resource.yml \
          && kubectl get ingress erpnext-ingress -n erpnext \
          && kubectl describe certificate -n erpnext
        return 1
fi
