#!/bin/bash

USER="mcserver"
RUN_SCRIPT="/home/mcserver/serverfiles/run.sh"
SUDOERS_LINE="$USER ALL=(root) NOPASSWD: $RUN_SCRIPT"

# Check if line already exists
if sudo grep -Fxq "$SUDOERS_LINE" /etc/sudoers; then
    echo "Sudoers entry already exists."
    exit 0
fi

echo "Adding sudoers entry for $RUN_SCRIPT ..."

# Append safely using visudo and tee
printf "%s\n" "$SUDOERS_LINE" | sudo EDITOR='tee -a' visudo >/dev/null

echo "Done! Sudoers entry installed."
