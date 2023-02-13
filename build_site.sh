#!/usr/bin/env bash

# Builds the site using Jekyll

# Usage examples:
#
# Specify parameters:
#   BUILD_FOLDER=_site_mainnet PUSH_REPO=git@github.com:vbtc/vbtc.github.io.git PUSH_REPO=master ./build_site.sh
#
# Use defaults:
#   ./build_site.sh

# Default settings if not provided uses signet and the gh-pages branch of the current repo
CONFIG_FILE=${CONFIG_FILE:="_config.vbtc.mainnet.yml"}
BUILD_FOLDER=${BUILD_FOLDER:="_site_mainnet"}
PUSH_REPO=${PUSH_REPO:=$(git config remote.origin.url)}
PUSH_BRANCH=${PUSH_BRANCH:="gp-pages"}

# Prepare build folder
if [[ -d ./$BUILD_FOLDER ]]
then
  (
    cd $BUILD_FOLDER || exit
    echo git fetch
    git fetch
  )
else
    # Create the folder $BUILD_FOLDER if it doesn't exist
    mkdir "$BUILD_FOLDER"
    # Shallow clone of only $BRANCH to the folder $BUILD_FOLDER
    echo git clone --depth 1 --single-branch --branch "$PUSH_BRANCH" "$PUSH_REPO" "$BUILD_FOLDER"
    git clone --depth 1 --single-branch --branch "$PUSH_BRANCH" "$PUSH_REPO" "$BUILD_FOLDER"
fi

# Set config file parameter
if [[ -n "$CONFIG_FILE" ]]; then
    CONFIG_FILE=",$CONFIG_FILE"
fi

echo bundle exec jekyll build --config "_config.yml$CONFIG_FILE"
bundle exec jekyll build --config "_config.yml$CONFIG_FILE"
