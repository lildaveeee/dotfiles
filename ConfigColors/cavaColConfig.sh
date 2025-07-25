
#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JSON_FILE="$SCRIPT_DIR/dominant_color.json"
CAVA_CONF="$HOME/.config/cava/config"


dominant_hex="$(jq -r '.dominant_color' "$JSON_FILE")"
echo "🔧 Applying dominant color to Cava: $dominant_hex"

sed -i -E \
  "s|^gradient_color_1[[:space:]]*=.*|gradient_color_1 = '$dominant_hex'|" \
  "$CAVA_CONF"

echo "✅ Updated $CAVA_CONF → gradient_color_1 = '$dominant_hex'"
