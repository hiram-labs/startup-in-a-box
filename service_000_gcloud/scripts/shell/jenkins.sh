#! /bin/sh

RED='\033[1;34m'
RESET_COLOR='\033[0m' 

. ./cluster.sh ci-cd
. ./connect.sh ci-cd

helm repo add jenkins https://charts.jenkins.io
helm repo update
helm install -f ../../helm/values/jenkins.yml jenkins jenkins/jenkins

echo -e "${RED}Please wait for 3 mins!${RESET_COLOR}" 
sleep 3m 
echo -e "${RED}Admin password:${RESET_COLOR}"
kubectl exec --namespace default -it svc/jenkinsci -c jenkins -- /bin/cat /run/secrets/chart-admin-password && echo 
# kubectl create clusterrolebinding jenkins-deploy --clusterrole=cluster-admin --serviceaccount=default:jenkins
kubectl get svc