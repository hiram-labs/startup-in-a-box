#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"
ERPNEXT_SECRETS_MANIFEST="$SCRIPTS"/k8s/resources/erpnext-db-secrets-manifest.yml

create_db_secrets_manifest () {
cat <<EOF > "$ERPNEXT_SECRETS_MANIFEST"
apiVersion: v1
data:
  password: "c3VwZXJfc2VjcmV0X3Bhc3N3b3Jk"
kind: Secret
metadata:
  name: mariadb-root-password
type: Opaque
EOF
}

cleanup_db_secrets_manifest () {
    rm "$ERPNEXT_SECRETS_MANIFEST"
}

helm repo add frappe https://helm.erpnext.com
helm repo update

if [ "$LAST_ARG" =  "uninstall" ]
    then
        helm uninstall erpnext -n erpnext \
            && create_db_secrets_manifest \
            && kubectl delete -n erpnext -f "$ERPNEXT_SECRETS_MANIFEST" \
            && cleanup_db_secrets_manifest
        return 1
fi

if [ "$LAST_ARG" =  "upgrade" ]
    then
        helm upgrade erpnext \
            -f "$HELM_VALUES"/erpnext.yml \
            --atomic \
            --version 2.1.8 \
            --namespace erpnext \
            frappe/erpnext
        return 1
fi

if [ "$LAST_ARG" =  "install" ]
    then
        helm install erpnext \
            -f "$HELM_VALUES"/erpnext.yml \
            --atomic \
            --version 2.1.8 \
            --create-namespace \
            --namespace erpnext \
            frappe/erpnext \
            && progress_indicator long \
            && create_db_secrets_manifest \
            && kubectl create -n erpnext -f "$ERPNEXT_SECRETS_MANIFEST" \
            && cleanup_db_secrets_manifest \
            && kubectl get svc -n erpnext
        return 1
fi
