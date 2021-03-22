#! /bin/sh

# set -x
# set -euo pipefail

function parse_gcloud_init_args () {
GCLOUD_INIT_REST=""
while [[ $# -gt 0 ]]
    do
    key="$1"

    case $key in
        -pn|--projectName)
        PROJECT_ID="$2"
        shift
        shift
        ;;
        -r|--region)
        PROJECT_REGION="$2"
        shift
        shift
        ;;
        -z|--zone)
        PROJECT_ZONE="$2"
        shift
        shift
        ;;
        *)
        GCLOUD_INIT_REST="${GCLOUD_INIT_REST} $1" 
        shift
        ;;
    esac
done
}