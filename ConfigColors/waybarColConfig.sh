#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JSON_FILE="$SCRIPT_DIR/dominant_color.json"
STYLE_FILE="$HOME/.config/waybar/style.css"

hex="$(jq -r '.dominant_color' "$JSON_FILE")"
hex="${hex#\#}"
r=$((16#${hex:0:2}))
g=$((16#${hex:2:2}))
b=$((16#${hex:4:2}))

echo "Applying dominant color: #${hex} -> RGB($r,$g,$b)"


sed -i -E "/^window#waybar/,/^\}/ s|border-bottom:.*|    border-bottom: 1px solid rgba($r, $g, $b, 0.7);|" "$STYLE_FILE"
sed -i -E "/^#custom-spotify/,/^\}/ s|color:.*|    color: rgba($r, $g, $b, 0.9);|" "$STYLE_FILE"

echo "✅ Updated $STYLE_FILE"


pkill waybar
waybar &

