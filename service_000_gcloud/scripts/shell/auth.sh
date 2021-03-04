#! /bin/bash

CWD=$(pwd)

echo ...authenticating
echo $CWD

# gcloud auth activate-service-account test-service-account@google.com  --key-file=/path/key.json --project=testproject