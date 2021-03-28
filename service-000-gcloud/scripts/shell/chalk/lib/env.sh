#! /bin/sh

# set -x
# set -euo pipefail

set -a
CHALK_STATUS=true

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RESET_COLOR='\033[0m' 

HELM_CHARTS=/usr/src/service-000-gcloud/helm/charts
HELM_VALUES=/usr/src/service-000-gcloud/helm/values
HELM_SECRETS=/usr/src/service-000-gcloud/helm/secrets
INGRESS_RESOURCES=/usr/src/service-000-gcloud/ingress

SCRIPTS=/usr/src/service-000-gcloud/scripts/shell
GCLOUD_SECRET_KEY=/usr/src/service-000-gcloud/secrets

LETSENCRYPT_EMAIL=hiram.labs@gmail.com
REGISTERED_DOMAIN=hiramlabs.com

export CHALK_STATUS

export RED
export BLUE
export GREEN
export RESET_COLOR

export HELM_CHARTS
export HELM_VALUES
export HELM_SECRETS
export INGRESS_RESOURCES

export SCRIPTS
export GCLOUD_SECRET_KEY

export LETSENCRYPT_EMAIL
export REGISTERED_DOMAIN
set +a