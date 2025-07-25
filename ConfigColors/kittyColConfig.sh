
#!/usr/bin/env bash
set -euo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JSON_FILE="$SCRIPT_DIR/dominant_color.json"
KITTY_CONF="$HOME/.config/kitty/kitty.conf"
dominant_hex="$(jq -r '.dominant_color' "$JSON_FILE")"
echo "🔧 Applying dominant color to Kitty: $dominant_hex"

sed -i -E \
  "s|^foreground[[:space:]]+.*|foreground $dominant_hex|" \
  "$KITTY_CONF"

echo "✅ Updated $KITTY_CONF → foreground $dominant_hex"


if pgrep -u "$USER" kitty &>/dev/null; then
  pkill -SIGUSR1 -u "$USER" kitty \
    && echo "🔄 Sent SIGUSR1 to all Kitty processes; colours reloaded"
else
  echo "⚠️ No running Kitty process found; start Kitty to apply the new config"
fi
