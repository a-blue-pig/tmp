#!/bin/bash

FILE="/home/spuderman/Documents/scripts/tmp/banner.txt"
NEW_CONTENT="Delta"
INTERVAL=2

while true; do
    # Read actual file content
    if [ -f "$FILE" ]; then
        ACTUAL_CONTENT=$(cat "$FILE")
    else
        sleep "$INTERVAL"
        continue
    fi

    # Compare with expected content
    if [[ "$ACTUAL_CONTENT" != "$NEW_CONTENT" ]]; then

        sudo chattr -i "$FILE"
        echo "$NEW_CONTENT" > "$FILE"
        sudo chattr +i "$FILE"
    fi

    sleep "$INTERVAL"
done

# /etc/systemd/system/
# sudo systemctl daemon-reexec
# sudo systemctl daemon-reload
# sudo systemctl enable immutable-writer.service
# sudo systemctl start immutable-writer.service
