#! /bin/sh

# set -x
set -euo pipefail

CLUSTER_NAME=default
NUM_NODES=2

if [[ -n "$1" ]]
    then
        CLUSTER_NAME=$1
fi

if [[ -n "$2" ]]
    then
        NUM_NODES=$2
fi

gcloud container clusters create $CLUSTER_NAME \
    --disk-size=32 \
    --machine-type=e2-small \
    --num-nodes=$NUM_NODES
