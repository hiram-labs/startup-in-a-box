#!/bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"

VERSION=v12.19.0
ADMIN_USERNAME=Administrator
ADMIN_PASSWORD=p4ssw0rd
SITES_PVC=erpnext
SITE_NAME=erpnext.$REGISTERED_DOMAIN

ERPNEXT_ADD_SITE_WORKER_MANIFEST="$SHELL_SCRIPTS"/k8s/resources/erpnext-add-site-worker-manifest.yml
ERPNEXT_DROP_SITE_WORKER_MANIFEST="$SHELL_SCRIPTS"/k8s/resources/erpnext-drop-site-worker-manifest.yml

cat <<EOF > "$ERPNEXT_ADD_SITE_WORKER_MANIFEST"
apiVersion: batch/v1
kind: Job
metadata:
  namespace: erpnext
  name: erpnext-sites-base
spec:
  backoffLimit: 1
  template:
    spec:
      securityContext:
        supplementalGroups: [1000]
      containers:
      - name: create-site
        image: frappe/erpnext-worker:$VERSION
        args: ["new"]
        imagePullPolicy: IfNotPresent
        volumeMounts:
          - name: sites-dir
            mountPath: /home/frappe/frappe-bench/sites
        env:
          - name: "SITE_NAME"
            value: $SITE_NAME
          - name: "DB_ROOT_USER"
            value: root
          - name: "MYSQL_ROOT_PASSWORD"
            valueFrom:
              secretKeyRef:
                key: password
                name: mariadb-root-password
          - name: "ADMIN_PASSWORD"
            value: $ADMIN_PASSWORD
          - name: "INSTALL_APPS"
            value: "erpnext"
      restartPolicy: Never
      volumes:
        - name: sites-dir
          persistentVolumeClaim:
            claimName: $SITES_PVC
            readOnly: false
EOF

cat <<EOF > "$ERPNEXT_DROP_SITE_WORKER_MANIFEST"
apiVersion: batch/v1
kind: Job
metadata:
  namespace: erpnext
  name: erpnext-sites-base-drop
spec:
  backoffLimit: 1
  template:
    spec:
      securityContext:
        supplementalGroups: [1000]
      containers:
      - name: drop-site
        image: frappe/erpnext-worker:$VERSION
        args: ["drop"]
        imagePullPolicy: IfNotPresent
        volumeMounts:
          - name: sites-dir
            mountPath: /home/frappe/frappe-bench/sites
        env:
          - name: "SITE_NAME"
            value: $SITE_NAME
          - name: "DB_ROOT_USER"
            value: root
          - name: "MYSQL_ROOT_PASSWORD"
            valueFrom:
              secretKeyRef:
                key: password
                name: mariadb-root-password
      restartPolicy: Never
      volumes:
        - name: sites-dir
          persistentVolumeClaim:
            claimName: $SITES_PVC
            readOnly: false
EOF

if [ "$LAST_ARG" =  "uninstall" ]
    then
        kubectl create -f "$ERPNEXT_ADD_SITE_WORKER_MANIFEST" -n erpnext \
          && kubectl delete -f "$ERPNEXT_DROP_SITE_WORKER_MANIFEST" -n erpnext \
          && rm "$ERPNEXT_ADD_SITE_WORKER_MANIFEST" \
          && rm "$ERPNEXT_DROP_SITE_WORKER_MANIFEST"
        return 1
fi

if [ "$LAST_ARG" =  "install" ] || [ "$LAST_ARG" =  "upgrade" ]
    then
        kubectl create -f "$ERPNEXT_ADD_SITE_WORKER_MANIFEST" -n erpnext \
          && progress_indicator short \
          && rm "$ERPNEXT_ADD_SITE_WORKER_MANIFEST" \
          && rm "$ERPNEXT_DROP_SITE_WORKER_MANIFEST" \
          && echo -e "${BLUE}username:${RESET_STYLE} $ADMIN_USERNAME" \
          && echo -e "${BLUE}email:${RESET_STYLE} $ADMIN_PASSWORD" \
          && kubectl get ingress -n erpnext
        return 1
fi
