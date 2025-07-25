
#!/usr/bin/env bash
set -euo pipefail

# 1) Locate files
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JSON_FILE="$SCRIPT_DIR/dominant_color.json"
TOML_FILE="$HOME/.config/alacritty/alacritty.toml"

# 2) Preconditions
if ! command -v jq &>/dev/null; then
  echo "Error: jq is required. Install it and try again."
  exit 1
fi

if [[ ! -f "$JSON_FILE" ]]; then
  echo "Error: $JSON_FILE not found."
  exit 1
fi

if [[ ! -f "$TOML_FILE" ]]; then
  echo "Error: Alacritty config not found at $TOML_FILE."
  exit 1
fi

# 3) Extract dominant hex (e.g. "#5F6DCA")
dominant_hex="$(jq -r '.dominant_color' "$JSON_FILE")"
echo "Applying dominant color to Alacritty: $dominant_hex"

# 4) In‐place edit: update the [colors.primary] → foreground line
sed -i -E \
  "s|^[[:space:]]*foreground[[:space:]]*=.*|foreground = \"${dominant_hex}\"|" \
  "$TOML_FILE"

echo "✅ Updated $TOML_FILE"
echo "→ New [colors.primary] foreground = \"$dominant_hex\""
echo "Restart Alacritty to apply the new color."
