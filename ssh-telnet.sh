#!/bin/bash

FILE="/etc/issue.net"
FILE2="/etc/sshheader.net"
NEW_CONTENT="Delta"
INTERVAL=2

while true; do
    # Read actual file content
    if [ -f "$FILE" ]; then
        ACTUAL_CONTENT=$(cat "$FILE")
    else
        continue
    fi

    if [ -f "$FILE2" ]; then
        ACTUAL_CONTENT2=$(cat "$FILE2")
    else
        continue
    fi

    # Compare with expected content
    if [[ "$ACTUAL_CONTENT" != "$NEW_CONTENT" ]]; then

        # sudo chattr -i "$FILE"
        echo "$NEW_CONTENT" > "$FILE"
        # sudo chattr +i "$FILE"
    fi

    if [[ "$ACTUAL_CONTENT2" != "$NEW_CONTENT" ]]; then

        # sudo chattr -i "$FILE"
        echo "$NEW_CONTENT" > "$FILE2"
        # sudo chattr +i "$FILE"
    fi
done

