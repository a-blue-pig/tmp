#!/bin/bash

# === Configuration ===
HOST="10.1.20.75"
USER="angeltalker"
PASS="r=8hc1"
TARGET_FILE="/etc/issue.net"
NEW_CONTENT="Delta"  # content you want to write into the file

# === Loop forever: rewrite file every 60 seconds ===
while true; do
    echo "Connecting to $HOST and rewriting $TARGET_FILE at $(date)..."

    expect <<EOF
        log_user 1
        set timeout 10

        spawn telnet $HOST

        expect {
            "login:" {
                send "$USER\r"
                exp_continue
            }
            "Username:" {
                send "$USER\r"
                exp_continue
            }
            "Password:" {
                send "$PASS\r"
                exp_continue
            }
            ">" {
                send "echo '$NEW_CONTENT' > $TARGET_FILE\r"
                send "exit\r"
            }
            "#" {
                send "echo '$NEW_CONTENT' > $TARGET_FILE\r"
                send "exit\r"
            }
        }

        expect eof
EOF

    echo "File rewritten. "
    sleep 5
done

