#! /bin/sh

# set -x
# set -euo pipefail

CLUSTER_NAME=default
REST=

if [ "$#" -eq  "1" ]
    then
        CLUSTER_NAME=$1
        REST=$2
fi

gcloud container clusters get-credentials $CLUSTER_NAME $REST\
    && kubectl create clusterrolebinding cluster-admin-binding \
    --clusterrole=cluster-admin \
    --user=$(gcloud config get-value account)