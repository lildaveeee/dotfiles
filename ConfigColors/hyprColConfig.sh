
#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JSON_FILE="$SCRIPT_DIR/dominant_color.json"
CONF_FILE="$HOME/.config/hypr/hyprland/general.conf"
dominant_hex="$(jq -r '.dominant_color' "$JSON_FILE")"
hex_no_hash="${dominant_hex#\#}" 
	alpha="99"                      
rgba_hex="${hex_no_hash}${alpha}" 


sed -i -E \
  -e "s|^([[:space:]]*)col\.active_border[[:space:]]*=.*|\1col.active_border = rgba(${rgba_hex})|" \
  -e "s|^([[:space:]]*)col\.inactive_border[[:space:]]*=.*|\1col.inactive_border = rgba(${rgba_hex})|" \
  "$CONF_FILE"

echo "col.active_border   = rgba(${rgba_hex})"
echo "col.inactive_border = rgba(${rgba_hex})"
