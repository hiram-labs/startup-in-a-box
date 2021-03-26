#! /bin/sh

# set -x
# set -euo pipefail

CLUSTER_STATIC_IP=$(gcloud compute addresses describe management-ip --format="value(address)")

if [[ -z "$CLUSTER_STATIC_IP" ]]
    then
        gcloud compute addresses create management-ip \
        && CLUSTER_STATIC_IP=$(gcloud compute addresses describe management-ip --format="value(address)")
fi

export CLUSTER_STATIC_IP

gcloud compute addresses list