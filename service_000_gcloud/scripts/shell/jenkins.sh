#! /bin/sh

BLUE='\033[1;34m'
RESET_COLOR='\033[0m' 

. ./connect.sh intellectual-property 

helm repo add jenkins https://charts.jenkins.io 
helm repo update 
helm install -f ../../helm/values/jenkins.yml jenkins jenkins/jenkins 
echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
sleep 3m 
export JENKINS_PASSWORD=$(kubectl exec --namespace default -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/chart-admin-password && echo) 
echo -e "${BLUE}Admin password:${RESET_COLOR} ${JENKINS_PASSWORD}" 
# kubectl create clusterrolebinding jenkins-deploy --clusterrole=cluster-admin --serviceaccount=default:jenkins
kubectl get svc