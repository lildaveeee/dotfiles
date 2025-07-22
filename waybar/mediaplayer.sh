#!/bin/sh

# Function to escape special XML characters for Pango markup
escape_markup() {
    sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g'
}

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    artist=$(playerctl metadata artist | escape_markup)
    title=$(playerctl metadata title | escape_markup)
    echo "$artist - $title"
elif [ "$player_status" = "Paused" ]; then
    artist=$(playerctl metadata artist | escape_markup)
    title=$(playerctl metadata title | escape_markup)
    echo " $artist - $title"
fi
