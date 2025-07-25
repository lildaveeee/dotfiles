

#!/usr/bin/env bash
set -euo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JSON_FILE="$SCRIPT_DIR/dominant_color.json"
THEME_FILE="$HOME/.config/yazi/theme.toml"


command -v jq >/dev/null 2>&1 \
  || { echo "✘ Please install 'jq' and retry." >&2; exit 1; }

[[ -f "$JSON_FILE" ]] \
  || { echo "✘ Missing JSON file: $JSON_FILE" >&2; exit 1; }

[[ -f "$THEME_FILE" ]] \
  || { echo "✘ Missing theme file: $THEME_FILE" >&2; exit 1; }


dominant_hex="$(jq -r '.dominant_color' "$JSON_FILE")"
echo "🔧 Applying dominant color: $dominant_hex"


sed -i -E \
  "s|^border_style[[:space:]]*=[[:space:]]*\{[^}]*\}|border_style = { fg = \"$dominant_hex\" }|" \
  "$THEME_FILE"


sed -i -E \
  "s|(\{[[:space:]]*name[[:space:]]*=\ *\"\\*\\/\"[[:space:]]*,[[:space:]]*fg[[:space:]]*=\ *\")[^\"]*(\"[[:space:]]*\})|\1$dominant_hex\2|" \
  "$THEME_FILE"

echo "✅ Updated $THEME_FILE with new dominant color."
