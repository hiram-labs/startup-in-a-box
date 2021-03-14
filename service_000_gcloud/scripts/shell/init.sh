#! /bin/sh

# set -x
# set -euo pipefail

RED='\033[0;31m'
BLUE='\033[0;34m'
RESET_COLOR='\033[0m' 
SECRET_KEY_PATH="../../secrets/gcloud-key.json"
PROJECT_ID=$(cat $SECRET_KEY_PATH | jq -r '.project_id')
PROJECT_REGION=europe-west2
PROJECT_ZONE=europe-west2-b 

export RED
export BLUE
export RESET_COLOR
export SECRET_KEY_PATH
export PROJECT_ID
export PROJECT_REGION
export PROJECT_ZONE

gcloud auth activate-service-account  --key-file=$SECRET_KEY_PATH 

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

# get and set static IP address for services to the current process environment
. staticIP.sh