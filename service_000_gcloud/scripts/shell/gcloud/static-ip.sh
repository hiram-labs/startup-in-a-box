#! /bin/sh

# set -x
# set -euo pipefail

MANAGEMENT_IP=$(gcloud compute addresses describe management-ip --format="value(address)")

if [[ -z "$MANAGEMENT_IP" ]]
    then
        gcloud compute addresses create management-ip \
        && MANAGEMENT_IP=$(gcloud compute addresses describe management-ip --format="value(address)")
fi

export MANAGEMENT_IP

gcloud compute addresses list