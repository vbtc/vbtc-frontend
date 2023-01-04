#!/usr/bin/env bash

# Builds and deploys the site according to the set variables

# shellcheck disable=SC2034
# The variables set in this file are used in the sourced files

CONFIG_FILE="_config.vbtc.mainnet.yml"
BUILD_FOLDER="_site_mainnet"
REPO="git@github.com:vbtc/vbtc.github.io.git"
BRANCH="master"
# COMMIT_MESSAGE=$(date +"Build %Y-%m-%d %H.%M.%S UTC" -u)

# Source the build script
. ./build_site.sh

# Source the deploy script
. ./deploy_site.sh
