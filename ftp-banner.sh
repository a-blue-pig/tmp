#!/bin/bash

# === Configuration ===
FTP_HOST="10.1.20.9"
LOCAL_FILE="banner.txt"
REMOTE_FILE="banner.txt"         # name on the FTP server
REMOTE_DIR=""      # optional, leave empty if not needed

# === Loop forever: upload every 60 seconds ===
while true; do
    echo "Uploading $LOCAL_FILE to $FTP_HOST at $(date)..."

    ftp -inv $FTP_HOST <<EOF
user anonymous anonymous@
put $LOCAL_FILE $REMOTE_FILE
bye
EOF

    echo "Upload complete."
done

