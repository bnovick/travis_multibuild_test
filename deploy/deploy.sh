#! /bin/bash

set -o errexit -o pipefail -o nounset -o xtrace # Exit on error

aws configure set aws_access_key_id $1
aws configure set aws_secret_access_key $2

if [ $TRAVIS_BRANCH == "develop" ]; then
    # deploy
    make deploy-dev
elif [ $TRAVIS_BRANCH == "test" ]; then
    # deploy
    make deploy-test
elif [ $TRAVIS_BRANCH == "master" ]; then
    # deploy
    echo "hi"
else
  echo 'builds executed for develop and master branches only'
fi