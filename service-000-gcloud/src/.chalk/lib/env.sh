#!/bin/sh

# set -x
# set -euo pipefail

# shellcheck disable=SC2034

set -a
CHALK_STATUS=true

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
ORANGE='\033[0;33m'

DIM_FONT='\033[2m'
BOLD_FONT='\033[1m'
BLINK_FONT='\033[5m'
ITALICS_FONT='\033[3m'
UNDERLINE_FONT='\033[4m'

RESET_STYLE='\033[0m'

SCRIPTS=/usr/src/service-000-gcloud/src/scripts/shell
HELM_VALUES=/usr/src/service-000-gcloud/src/values
HELM_SECRETS=/usr/src/service-000-gcloud/src/secrets
GCLOUD_SECRETS=/usr/src/service-000-gcloud/src/secrets

LETSENCRYPT_EMAIL=hiram.labs@gmail.com
REGISTERED_DOMAIN=hiramlabs.com
set +a
# find ./ -type f -exec sed -i '' -e "s/RESET_STYLE/RESET_STYLE/g" {} \;
