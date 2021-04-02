#!/bin/sh

# set -x
# set -euo pipefail

set -a
CHALK_STATUS=true

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RESET_COLOR='\033[0m' 

SCRIPTS=/usr/src/service-000-gcloud/src/scripts/shell
HELM_VALUES=/usr/src/service-000-gcloud/src/values
HELM_SECRETS=/usr/src/service-000-gcloud/src/secrets
GCLOUD_SECRETS=/usr/src/service-000-gcloud/src/secrets

LETSENCRYPT_EMAIL=hiram.labs@gmail.com
REGISTERED_DOMAIN=hiramlabs.com

export CHALK_STATUS

export RED
export BLUE
export GREEN
export RESET_COLOR

export SCRIPTS
export HELM_VALUES
export HELM_SECRETS
export GCLOUD_SECRETS

export LETSENCRYPT_EMAIL
export REGISTERED_DOMAIN
set +a
