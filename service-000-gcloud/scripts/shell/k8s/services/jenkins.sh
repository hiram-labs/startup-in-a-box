#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"

VALUES_ENV_INJECTED="$HELM_VALUES"/jenkins-env-injected.yml
inject_env_vars_yml "$HELM_VALUES"/jenkins.yml

helm repo add jenkins https://charts.jenkins.io 
helm repo update 

if [ "$LAST_ARG" =  "uninstall" ]
    then
        helm uninstall jenkins -n jenkins \
            && kubectl delete pvc jenkins -n jenkins
        return 1
fi

if [ "$LAST_ARG" =  "upgrade" ]
    then
        helm upgrade jenkins \
            -f "$VALUES_ENV_INJECTED" \
            --atomic \
            --version 3.2.2 \
            --namespace jenkins \
            jenkins/jenkins
        return 1
fi

if [ "$LAST_ARG" =  "install" ]
    then
        helm install jenkins \
            -f "$VALUES_ENV_INJECTED" \
            --atomic \
            --version 3.2.2 \
            --create-namespace \
            --namespace jenkins \
            jenkins/jenkins \
            && progress_indicator long \
            && JENKINS_PASSWORD=$(kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/chart-admin-password && echo) \
            && echo -e "${BLUE}Admin username:${RESET_COLOR} admin" \
            && echo -e "${BLUE}Admin password:${RESET_COLOR} ${JENKINS_PASSWORD}" \
            && kubectl get svc -n jenkins
        return 1
fi