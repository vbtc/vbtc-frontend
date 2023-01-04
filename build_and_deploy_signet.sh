#!/usr/bin/env bash

# Builds and deploys the site according to the set variables

# shellcheck disable=SC2034
# The variables set in this file are used in the sourced files

CONFIG_FILE="_config.vbtc.signet.yml"
BUILD_FOLDER="_site_signet"
PUSH_REPO="git@github.com:vbtc/vbtc-frontend-beta.git"
PUSH_BRANCH="master"
SOURCE_BRANCH="signet"
# COMMIT_MESSAGE=$(date +"Build %Y-%m-%d %H.%M.%S UTC" -u)

# Make sure we are pushing from the correct branch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$SOURCE_BRANCH" != "$CURRENT_BRANCH" ]; then
    echo "You are in the wrong branch for building $SOURCE_BRANCH"
    exit
fi

# Source the build script
. ./build_site.sh

# Source the deploy script
. ./deploy_site.sh
