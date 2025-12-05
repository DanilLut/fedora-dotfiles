#!/usr/bin/env bash

STATE_FILE="${XDG_RUNTIME_DIR:-/tmp}/sway-recent-windows"

# Initialize
echo "" > "$STATE_FILE"

# Listen to focus events and update recent window list
swaymsg -t subscribe '["window"]' | jq --unbuffered -r \
  'select(.change=="focus").container.id' | while read -r id; do
    prev=$(head -n 1 "$STATE_FILE")
    echo -e "$id\n$prev" > "$STATE_FILE"
  done

