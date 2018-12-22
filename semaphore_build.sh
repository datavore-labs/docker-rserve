!/bin/bash

set -e

echo "Building image..."
export EB_VERSION=`git rev-parse --short=7 HEAD`

echo "Building server"
docker build -t $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO:$EB_VERSION .
