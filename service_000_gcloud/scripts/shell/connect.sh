#! /bin/bash

CLUSTER_NAME=product-unit

if [ "$#" -eq  "1" ]
    then
        CLUSTER_NAME=$1
fi

gcloud container clusters get-credentials $CLUSTER_NAME