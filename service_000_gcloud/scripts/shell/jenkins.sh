#! /bin/sh

# set -x
set -euo pipefail

. connect.sh intellectual-property 

helm repo add jenkins https://charts.jenkins.io 
helm repo update 
helm install -f ../../helm/values/jenkins.yml --set controller.loadBalancerIP=$JENKINS_IP jenkins jenkins/jenkins 

echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
sleep 3m 
export JENKINS_PASSWORD=$(kubectl exec --namespace default -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/chart-admin-password && echo) 
echo -e "${BLUE}Admin password:${RESET_COLOR} ${JENKINS_PASSWORD}" 
export SERVICE_IP=$(kubectl get svc --namespace default jenkins --template "{{ range (index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}")
echo -e "${BLUE}Service IP:${RESET_COLOR} ${SERVICE_IP}"
# kubectl create clusterrolebinding jenkins-deploy --clusterrole=cluster-admin --serviceaccount=default:jenkins
kubectl get svc