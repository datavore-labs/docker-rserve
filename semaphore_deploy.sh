#!/bin/bash

set -e

echo "Pushing image"
export EB_VERSION=`git rev-parse --short=7 HEAD`

echo "to ecr"
$(aws ecr get-login --region us-east-1 --no-include-email)
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO:$EB_VERSION

echo "to gke"
./gke-tools-setup
./gke-auth
docker push gcr.io/datavore-dev/$IMAGE_REPO:$EB_VERSION
