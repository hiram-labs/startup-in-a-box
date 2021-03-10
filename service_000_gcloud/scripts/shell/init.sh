#! /bin/sh

FILE="../../secrets/gcloud-key.json"

readonly PROJECT_ID=$(cat $FILE | jq -r '.project_id')
readonly PROJECT_REGION=europe-west2
readonly PROJECT_ZONE=europe-west2-b 

export PROJECT_ID
export PROJECT_REGION
export PROJECT_ZONE

gcloud auth activate-service-account  --key-file=$FILE 


if [ "$#" -eq  "0" ]
    then
        gcloud config set project $PROJECT_ID
    else
        gcloud config set project $1
fi

gcloud config set disable_prompts true
gcloud config set compute/region $PROJECT_REGION
gcloud config set compute/zone $PROJECT_ZONE

gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com
# gcloud services enable cloudbuild.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com

gcloud config configurations list