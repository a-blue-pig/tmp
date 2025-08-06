#!/bin/bash

# === Configuration ===
TARGET_CONTENT="Delta"
FILES=("/etc/issue.net" "/etc/sshheader.net")

# === Function to check and update file ===
update_file_if_needed() {
    local file="$1"

    if [ ! -f "$file" ]; then
        return
    fi

    local current_content
    current_content=$(cat "$file")

    if [[ "$current_content" != "$TARGET_CONTENT" ]]; then
        # Optional: remove immutability
        # sudo chattr -i "$file"

        echo "$TARGET_CONTENT" > "$file"

        # Optional: reapply immutability
        # sudo chattr +i "$file"
    fi
}

# === Main Loop ===
while true; do
    for file in "${FILES[@]}"; do
        update_file_if_needed "$file"
    done
done

