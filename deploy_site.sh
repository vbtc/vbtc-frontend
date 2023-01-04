#!/usr/bin/env bash

# Usage examples:
#
# Specify parameters:
#   BUILD_FOLDER=_site_mainnet COMMIT_MESSAGE="My commit" ./deploy_site.sh
#
# Use defaults:
#   ./deploy_site.sh

# Default settings if not provided deploys mainnet to the gh-pages branch of the current repo
BUILD_FOLDER=${BUILD_FOLDER:="_site_mainnet"}

# Set commit message to 'Build <DATE> <TIME> UTC' unless provided
COMMIT_MESSAGE=${COMMIT_MESSAGE:=$(date +"Build %Y-%m-%d %H.%M.%S UTC" -u)}

# Commit and push
cd $BUILD_FOLDER || exit
git add .
git commit -m "$COMMIT_MESSAGE"
git push

echo "Done pushing to gh-pages. Remember to checkout/pull gh-pages in the original repo."
