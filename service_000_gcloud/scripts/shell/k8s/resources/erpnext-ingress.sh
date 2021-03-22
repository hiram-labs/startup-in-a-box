# #! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\${$#}\"

cat <<EOF > $SCRIPTS/k8s/resources/erpnext-ingress-resource.yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  namespace: erpnext
  name: erpnext-ingress
  annotations:
    kubernetes.io/ingress.class: nginx
spec:
  rules:
    - host: "erpnext.hiramlabs.com"
      http:
        paths:
          - backend:
              serviceName: erpnext
              servicePort: 80
            path: /
EOF

if [[ "$LAST_ARG" =  "uninstall" ]]
    then
        kubectl delete -f $SCRIPTS/k8s/resources/erpnext-ingress-resource.yaml
        rm $SCRIPTS/k8s/resources/erpnext-ingress-resource.yaml
        return 1
fi

kubectl apply -f $SCRIPTS/k8s/resources/erpnext-ingress-resource.yaml
rm $SCRIPTS/k8s/resources/erpnext-ingress-resource.yaml
kubectl get ingress erpnext-ingress -n erpnext

# # This section is only required if TLS is to be enabled for the Ingress
# tls:
#     - hosts:
#         - www.example.com
#       secretName: example-tls
# # If TLS is enabled for the Ingress, a Secret containing the certificate and key must also be provided:

#   apiVersion: v1
#   kind: Secret
#   metadata:
#     name: example-tls
#     namespace: foo
#   data:
#     tls.crt: <base64 encoded cert>
#     tls.key: <base64 encoded key>
#   type: kubernetes.io/tls

# kubectl create namespace ingress
# kubectl apply -f /usr/src/service_000_gcloud/ingress/erpnext.yml