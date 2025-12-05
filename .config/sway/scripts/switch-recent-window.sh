#!/usr/bin/env bash

# Store last two focused container IDs
STATE_FILE="${XDG_RUNTIME_DIR:-/tmp}/sway-recent-windows"

if [ ! -f "$STATE_FILE" ]; then
  echo "" > "$STATE_FILE"
fi

# Get the last two focused windows
ids=($(cat "$STATE_FILE"))
if [ ${#ids[@]} -lt 2 ]; then
  exit 0
fi

# Focus the previously focused window (2nd in list)
target=${ids[1]}
swaymsg "[con_id=$target]" focus >/dev/null 2>&1

