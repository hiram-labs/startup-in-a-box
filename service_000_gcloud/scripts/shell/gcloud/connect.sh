#! /bin/sh

# set -x
# set -euo pipefail

CLUSTER_NAME=default
REST=

if [[ -n "$1" ]]
    then
        CLUSTER_NAME=$1
        shift
        REST="$@"
fi

gcloud container clusters get-credentials $CLUSTER_NAME $REST \
    || . $SCRIPTS/gcloud/cluster.sh $CLUSTER_NAME \
    && kubectl create clusterrolebinding cluster-admin-binding \
    --clusterrole=cluster-admin \
    --user=$(gcloud config get-value account)