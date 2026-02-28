#!/bin/bash

# A script to handle backing up bitwarden backups to s3 via cron
# Be sure you set the following variables in the crontab:
# PATH, BITWARDEN_BACKUPS_DIR, BITWARDEN_BACKUPS_BUCKET, LOG_FILE

echo 'Initiating backup to s3' >> ${LOG_FILE}

echo "$(date)" >> ${LOG_FILE}

aws s3 sync ${BITWARDEN_BACKUPS_DIR} s3://${BITWARDEN_BACKUPS_BUCKET} --include "db-*" >> ${LOG_FILE} 2>&1

echo 'Cron Complete' >> ${LOG_FILE}
