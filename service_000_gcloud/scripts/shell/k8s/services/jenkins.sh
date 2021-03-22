#! /bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\${$#}\"

if [[ "$LAST_ARG" =  "uninstall" ]]
    then
        helm uninstall jenkins -n jenkins 
        echo -e ${RED}jenkins uninstall${RESET_COLOR}
        return 1
fi

helm repo add jenkins https://charts.jenkins.io 
helm repo update 
helm install jenkins \
    -f $HELM_VALUES/jenkins.yml \
    --atomic \
    --set controller.loadBalancerIP=$JENKINS_IP \
    --create-namespace \
    --namespace jenkins \
    jenkins/jenkins 

echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
sleep 3m 
JENKINS_PASSWORD=$(kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/chart-admin-password && echo) 
echo -e "${BLUE}Admin password:${RESET_COLOR} ${JENKINS_PASSWORD}"

kubectl get svc -n jenkins