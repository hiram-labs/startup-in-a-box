#! /bin/sh

# RED='\033[0;31m'
# RESET_COLOR='\033[0m' 

CLUSTER_NAME=general
NUM_NODES=1

# NAME_EXISTS=$(gcloud container clusters list --filter="name:generals")

# if [ -z "$NAME_EXISTS" ]
#     then
#         echo "\$var is empty"
#     else
#         echo "\$var is NOT empty"
# fi

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
