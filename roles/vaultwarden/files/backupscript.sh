#!/bin/bash

# Define variables
WORK_DIR="<remoteFolder>"
BACKUP_DIR="vw-data"
DESTINATION="/share/backup/"
REMOTE_USER="<remoteUser>"
REMOTE_SERVER="<remoteIp>"

# Get current date in YY-MM-DD format
DATE=$(date +'%y-%m-%d')

# Define the zip file name
ZIP_FILE="${DATE}-bak.zip"

# Create the ZIP archive
cd "${WORK_DIR}"
zip -r "/tmp/${ZIP_FILE}" "$BACKUP_DIR"

# Secure copy to the remote server
scp "/tmp/${ZIP_FILE}" "${REMOTE_USER}@${REMOTE_SERVER}:${DESTINATION}"

# Optional: Remove the local zip file after transfer
rm "/tmp/${ZIP_FILE}"
