#!/bin/sh

# set -x
# set -euo pipefail

# shellcheck disable=SC2034

set -a
CHALK_STATUS=true

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RESET_COLOR='\033[0m'

SCRIPTS=/usr/src/service-000-gcloud/src/scripts/shell
HELM_VALUES=/usr/src/service-000-gcloud/src/values
HELM_SECRETS=/usr/src/service-000-gcloud/src/secrets
GCLOUD_SECRETS=/usr/src/service-000-gcloud/src/secrets

LETSENCRYPT_EMAIL={{maintainerEmail}}
REGISTERED_DOMAIN={{companyUrl}}
set +a
