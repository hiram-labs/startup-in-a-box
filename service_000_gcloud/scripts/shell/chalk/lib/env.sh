#! /bin/sh

# set -x
# set -euo pipefail

set -a
CHALK_STATUS=true

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RESET_COLOR='\033[0m' 

HELM_SECRETS=/usr/src/service_000_gcloud/helm/secrets
HELM_CHARTS=/usr/src/service_000_gcloud/helm/charts
HELM_VALUES=/usr/src/service_000_gcloud/helm/values

SCRIPTS=/usr/src/service_000_gcloud/scripts/shell
GCLOUD_SECRET_KEY=/usr/src/service_000_gcloud/secrets

export CHALK_STATUS

export RED
export BLUE
export GREEN
export RESET_COLOR

export HELM_SECRETS
export HELM_CHARTS
export HELM_VALUES

export SCRIPTS
export GCLOUD_SECRET_KEY
set +a