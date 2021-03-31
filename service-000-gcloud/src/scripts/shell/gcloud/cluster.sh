#! /bin/sh

# set -x
# set -euo pipefail

CLUSTER_NAME=default

if [ -n "$1" ]
    then
        CLUSTER_NAME=$1
        shift
fi

gcloud container clusters create $CLUSTER_NAME "$@" \
    --num-nodes 2 \
    --enable-autoscaling \
    --min-nodes 1 \
    --max-nodes 5 \
    --enable-network-policy