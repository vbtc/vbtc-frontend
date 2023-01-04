#!/usr/bin/env bash

# Builds and runs the site locally

# Usage examples:
#
# Specify parameters:
#   CONFIG_FILE=_config.vbtc.mainnet.yml BUILD_FOLDER=_site_mainnet ./run_site.sh
#
# Use defaults:
#   ./run_site.sh

# Default settings if not provided uses _site_localhost and no additional config files
CONFIG_FILE=${CONFIG_FILE:=""}
BUILD_FOLDER=${BUILD_FOLDER:="_site_localhost"}

# Prepare build folder
if ! [[ -d ./$BUILD_FOLDER ]]
then
    # Create the folder $BUILD_FOLDER if it doesn't exist
    mkdir "$BUILD_FOLDER"
fi

# Set config file parameter
if [[ -n "$CONFIG_FILE" ]]; then
    CONFIG_FILE=",$CONFIG_FILE"
fi

echo bundle exec jekyll serve --config "_config.yml$CONFIG_FILE"
bundle exec jekyll serve --config "_config.yml$CONFIG_FILE"
