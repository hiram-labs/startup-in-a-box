#! /bin/sh

# set -x
# set -euo pipefail

# handles flags
parse_general_flags () {
    while [[ $# -gt 0 ]]
        do
        key="$1"

        case $key in
            -ns|--namespace)
            export PROJECT_NAMESPACE="$2"
            shift
            shift
            ;;
            -pn|--projectName)
            export PROJECT_ID="$2"
            shift
            shift
            ;;
            -r|--region)
            export PROJECT_REGION="$2"
            shift
            shift
            ;;
            -z|--zone)
            export PROJECT_ZONE="$2"
            shift
            shift
            ;;
            *)
            . "$SCRIPTS"/chalk/config/errors.sh -error 101
            exit 1
            ;;
        esac
    done
}