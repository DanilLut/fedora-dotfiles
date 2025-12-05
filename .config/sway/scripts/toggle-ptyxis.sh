#!/usr/bin/env bash

# Check if Telegram window exists
if swaymsg -t get_tree | grep -q '"app_id": "org.gnome.Ptyxis"'; then
    # Focus the existing Telegram window
    swaymsg '[app_id="org.gnome.Ptyxis"] focus'
else
    # Launch Telegram (Flatpak)
    ptyxis &

    # Wait until window appears, then focus workspace 4
    for i in {1..10}; do
        sleep 0.5
        if swaymsg -t get_tree | grep -q '"app_id": "org.gnome.Ptyxis"'; then
            swaymsg workspace number 3
            swaymsg '[app_id="org.gnome.Ptyxis"] focus'
            exit 0
        fi
    done
fi


