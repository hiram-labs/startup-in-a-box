#! /bin/sh

# set -x
# set -euo pipefail

gcloud container clusters get-credentials "${1:-"default"}" \
    && kubectl create clusterrolebinding cluster-admin-binding \
    --clusterrole=cluster-admin \
    --user="$(gcloud config get-value account)"
