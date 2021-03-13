#! /bin/sh

# set -x
# set -euo pipefail

. connect.sh codebase 

helm repo add jenkins https://charts.jenkins.io 
helm repo update 
helm install -f ../../helm/values/jenkins.yml \
    --set controller.loadBalancerIP=$JENKINS_IP \
    --create-namespace \
    jenkins jenkins/jenkins 

echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
sleep 3m 
export JENKINS_PASSWORD=$(kubectl exec --namespace default -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/chart-admin-password && echo) 
echo -e "${BLUE}Admin password:${RESET_COLOR} ${JENKINS_PASSWORD}"
# kubectl create clusterrolebinding jenkins-deploy --clusterrole=cluster-admin --serviceaccount=default:jenkins
kubectl get svc