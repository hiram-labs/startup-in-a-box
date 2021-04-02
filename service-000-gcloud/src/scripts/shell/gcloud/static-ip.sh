#!/bin/sh

# set -x
# set -euo pipefail

STATIC_IP_01=$(gcloud compute addresses describe static-ip-01 --format="value(address)")

if [ -z "$STATIC_IP_01" ]
    then
        gcloud compute addresses create static-ip-01 \
        && STATIC_IP_01=$(gcloud compute addresses describe static-ip-01 --format="value(address)")
fi

export STATIC_IP_01

gcloud compute addresses list
