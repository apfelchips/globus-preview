#!/bin/sh
# doc: https://docs.travis-ci.com/user/running-build-in-debug-mode/#restarting-a-job-in-debug-mode-via-api

if [ -z "${1:-$TRAVIS_JOB_ID}" ]; then
    echo "please provide a job id"
    echo "howto: https://docs.travis-ci.com/user/running-build-in-debug-mode/#finding-the-job-id"
    exit 1
fi

if [ -z "${2:-$TRAVIS_TOKEN}" ]; then
    echo "please provide an authorization token"
    echo "https://travis-ci.org/account/preferences"
    exit 1
fi

curl -s -X POST \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -H "Travis-API-Version: 3" \
    -H "Authorization: token ${2:-$TRAVIS_TOKEN} \
    -d "{\"quiet\": true}" \
    https://api.travis-ci.org/job/${1:-$TRAVIS_JOB_ID}/debug
