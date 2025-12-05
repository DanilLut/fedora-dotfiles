#!/usr/bin/env bash

# Check if Telegram window exists
if swaymsg -t get_tree | grep -q '"app_id": "org.telegram.desktop"'; then
    # Focus the existing Telegram window
    swaymsg '[app_id="org.telegram.desktop"] focus'
else
    # Launch Telegram (Flatpak)
    flatpak run org.telegram.desktop &

    # Wait until window appears, then focus workspace 4
    for i in {1..10}; do
        sleep 0.5
        if swaymsg -t get_tree | grep -q '"app_id": "org.telegram.desktop"'; then
            swaymsg workspace number 4
            swaymsg '[app_id="org.telegram.desktop"] focus'
            exit 0
        fi
    done
fi

