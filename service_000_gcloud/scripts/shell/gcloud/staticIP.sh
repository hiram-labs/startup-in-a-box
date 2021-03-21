#! /bin/sh

# set -x
# set -euo pipefail

JENKINS_IP=$(gcloud compute addresses describe jenkins-ip --format="value(address)")
GITEA_HTTP_IP=$(gcloud compute addresses describe giteahttp-ip --format="value(address)")
GITEA_SSH_IP=$(gcloud compute addresses describe giteassh-ip --format="value(address)")

if [[ -z "$JENKINS_IP" ]]
    then
        gcloud compute addresses create jenkins-ip \
        && JENKINS_IP=$(gcloud compute addresses describe jenkins-ip --format="value(address)")
fi

if [[ -z "$GITEA_HTTP_IP" ]]
    then
        gcloud compute addresses create giteahttp-ip \
        && GITEA_HTTP_IP=$(gcloud compute addresses describe giteahttp-ip --format="value(address)")
fi

if [[ -z "$GITEA_SSH_IP" ]]
    then
        gcloud compute addresses create giteassh-ip \
        && GITEA_SSH_IP=$(gcloud compute addresses describe giteassh-ip --format="value(address)")
fi

export JENKINS_IP
export GITEA_HTTP_IP
export GITEA_SSH_IP

gcloud compute addresses list