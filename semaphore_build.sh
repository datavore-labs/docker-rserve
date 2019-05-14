#!/bin/bash

set -e

export EB_VERSION=`git rev-parse --short=7 HEAD`

echo "Building image..."
docker build --no-cache \
	--build-arg AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
	--build-arg AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
	-t gcr.io/datavore-dev/$IMAGE_REPO:$EB_VERSION \
	-t $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO:$EB_VERSION .
