#! /bin/sh

BLUE='\033[1;34m'
RESET_COLOR='\033[0m' 

JENKINS_IP=$(gcloud compute addresses describe jenkins-ip --format="value(address)")
GITEAHTTP_IP=$(gcloud compute addresses describe giteahttp-ip --format="value(address)")
GITEASSH_IP=$(gcloud compute addresses describe giteassh-ip --format="value(address)")

if [[ -z "$JENKINS_IP" ]]
    then
        gcloud compute addresses create jenkins-ip \
        && JENKINS_IP=$(gcloud compute addresses describe jenkins-ip --format="value(address)")
fi

if [[ -z "$GITEAHTTP_IP" ]]
    then
        gcloud compute addresses create giteahttp-ip \
        && GITEAHTTP_IP=$(gcloud compute addresses describe giteahttp-ip --format="value(address)")
fi

if [[ -z "$GITEASSH_IP" ]]
    then
        gcloud compute addresses create giteassh-ip \
        && GITEASSH_IP=$(gcloud compute addresses describe giteassh-ip --format="value(address)")
fi

export JENKINS_IP
export GITEAHTTP_IP
export GITEASSH_IP

gcloud compute addresses list