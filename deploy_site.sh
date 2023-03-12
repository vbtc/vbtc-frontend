#!/usr/bin/env bash

# Usage examples:
#
# Specify parameters:
#   BUILD_FOLDER=_site_mainnet ./deploy_site.sh
#
# Use defaults:
#   ./deploy_site.sh

# Default settings if not provided deploys signet
BUILD_FOLDER=${BUILD_FOLDER:="_site_signet"}
DOMAIN=${DOMAIN:="signet.vbtc.exchange"}

HOST="root@$DOMAIN"
CONN_INFO_FILE=.conn_info

if [ -e "$CONN_INFO_FILE" ]
then
  read -r SSH_CONN < $CONN_INFO_FILE
else
  SSH_CONN="ssh -o ControlPath=~/.ssh/master-$$ -o ControlMaster=auto -o ControlPersist=3600"
  echo "$SSH_CONN" > $CONN_INFO_FILE
fi

echo "Logging in to $DOMAIN..."
# Just a wake-up ssh command to get the output in the right order...
$SSH_CONN $HOST "echo -e ''"

echo "Syncing files..."
rsync -a "./$BUILD_FOLDER/*" --exclude=".*" --human-readable --progress --compress-choice=zstd --compress-level=9 -e "$SSH_CONN" $HOST:/var/www/html
