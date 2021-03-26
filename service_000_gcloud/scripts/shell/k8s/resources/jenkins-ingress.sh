#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"

cat <<EOF > "$SCRIPTS"/k8s/resources/jenkins-ingress-resource.yml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  namespace: jenkins
  name: jenkins-ingress
  annotations:
    kubernetes.io/ingress.class: nginx
    cert-manager.io/issuer: letsencrypt-prod
spec:
  rules:
    - host: jenkins.hiramlabs.com
      http:
        paths:
          - backend:
              serviceName: jenkins
              servicePort: 8080
            path: /
  tls:
    - hosts:
        - jenkins.hiramlabs.com
      secretName: jenkins-tls-secret
EOF

if [[ "$LAST_ARG" =  "uninstall" ]]
    then
        kubectl delete -f "$SCRIPTS"/k8s/resources/jenkins-ingress-resource.yml \
          && kubectl delete secrets jenkins-tls-secret -n jenkins \
          && rm "$SCRIPTS"/k8s/resources/jenkins-ingress-resource.yml
        return 1
fi

if [[ "$LAST_ARG" =  "install" ]] || [[ "$LAST_ARG" =  "upgrade" ]]
    then
        kubectl apply -f "$SCRIPTS"/k8s/resources/jenkins-ingress-resource.yml \
          && progress_indicator short \
          && rm "$SCRIPTS"/k8s/resources/jenkins-ingress-resource.yml \
          && kubectl get ingress jenkins-ingress -n jenkins \
          && kubectl describe certificate -n jenkins
        return 1
fi
