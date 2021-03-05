#! /bin/bash

FILE="../../secrets/gcloud-key.json"

PROJECT_ID=$(cat $FILE | jq -r '.project_id')

gcloud auth activate-service-account  --key-file=$FILE 


if [ "$#" -eq  "0" ]
    then
        gcloud config set project $PROJECT_ID
    else
        gcloud config set project $1
fi

gcloud config set disable_prompts true
gcloud config set compute/region europe-west2
gcloud config set compute/zone europe-west2-b

gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com

gcloud config configurations list