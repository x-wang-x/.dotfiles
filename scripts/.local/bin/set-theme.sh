#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/wallpaper.jpg"
    exit 1
fi

WP_PATH=$(realpath "$1")
#set wallpaper
awww img "$WP_PATH" --transition-type wipe --transition-angle 30
#generate color
matugen image "$WP_PATH"
#restart waybar
source restart-waybar.sh
#restart swaync
swaync-client -R
swaync-client -rs
