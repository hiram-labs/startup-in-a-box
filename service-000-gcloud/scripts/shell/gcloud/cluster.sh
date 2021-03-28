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
    --enable-network-policy