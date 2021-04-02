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

SCRIPTS=/usr/src/service-000-gcloud/src/.chalk/sh
set +a
