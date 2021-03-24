# #! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\${$#}\"

cat <<EOF > $SCRIPTS/k8s/resources/erpnext-worker-resource.yml
apiVersion: batch/v1
kind: Job
metadata:
  namespace: erpnext
  name: erpnext-worker
spec:
  backoffLimit: 1
  template:
    spec:
      securityContext:
        supplementalGroups: [1000]
      containers:
        - name: erpnext-site-worker
          image: frappe/erpnext-worker:latest
          args: ["new"]
          imagePullPolicy: IfNotPresent
          volumeMounts:
            - name: sites-dir
              mountPath: /home/frappe/frappe-bench/sites
          env:
            - name: "SITE_NAME"
              value: "erpnext.hiramlabs.com"
            - name: "DB_ROOT_USER"
              value: root
            - name: "MYSQL_ROOT_PASSWORD"
              valueFrom:
                secretKeyRef:
                  key: password
                  name: mariadb-root-password
            - name: "ADMIN_PASSWORD"
              value: "p4ssw0rd"
            - name: "INSTALL_APPS"
              value: "erpnext"
      restartPolicy: Never
      volumes:
        - name: sites-dir
          persistentVolumeClaim:
            claimName: erpnext
            readOnly: false
EOF

if [[ "$LAST_ARG" =  "uninstall" ]]
    then
        kubectl delete -f $SCRIPTS/k8s/resources/erpnext-worker-resource.yml
        rm $SCRIPTS/k8s/resources/erpnext-worker-resource.yml
        return 1
fi

kubectl create -f $SCRIPTS/k8s/resources/erpnext-worker-resource.yml
rm $SCRIPTS/k8s/resources/erpnext-worker-resource.yml
kubectl get ingress erpnext-worker -n erpnext