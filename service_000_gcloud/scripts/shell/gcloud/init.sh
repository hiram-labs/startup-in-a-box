#! /bin/sh

# set -x
# set -euo pipefail

parse_general_flags "$@"

PROJECT_ZONE=${PROJECT_ZONE:-"europe-west2-b"}
PROJECT_REGION=${PROJECT_REGION:-"europe-west2"}
PROJECT_ID=${PROJECT_ID:-$(jq -r '.project_id' < "${GCLOUD_SECRET_KEY}"/gcloud-key.json)}

gcloud auth activate-service-account  --key-file="${GCLOUD_SECRET_KEY}"/gcloud-key.json

gcloud config set disable_prompts true
gcloud config set project "$PROJECT_ID"
gcloud config set compute/region "$PROJECT_REGION"
gcloud config set compute/zone "$PROJECT_ZONE"

gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com
# gcloud services enable cloudbuild.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com

gcloud config configurations list

# get and set static IP address for services to the current process environment
. "$SCRIPTS"/gcloud/static-ip.sh

