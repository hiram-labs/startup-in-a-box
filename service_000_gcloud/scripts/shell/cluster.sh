#! /bin/bash

# RED='\033[0;31m'
# RESET_COLOR='\033[0m' 

CLUSTER_NAME=product-unit

# NAME_EXISTS=$(gcloud container clusters list --filter="name:product-units")

# if [ -z "$NAME_EXISTS" ]
#     then
#         echo "\$var is empty"
#     else
#         echo "\$var is NOT empty"
# fi

if [ "$#" -eq  "1" ]
    then
        CLUSTER_NAME=$1
fi

gcloud container clusters create $CLUSTER_NAME \
    --disk-size=32 \
    --machine-type=e2-small \
    --num-nodes=2
