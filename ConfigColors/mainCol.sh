
#!/usr/bin/env bash
set -euo pipefail

IMAGE_PATH="/home/daveee/Coding/spotify-Wallpaper/images/albumArt.jpg"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JSON_FILE="${SCRIPT_DIR}/dominant_color.json"

histogram=$(
  magick "$IMAGE_PATH" \
    -resize 200x200\! \
    -colors 16 \
    -format %c \
    histogram:info:-
)

threshold=60
dominant_hex=""

while IFS= read -r line; do
  if [[ "$line" =~ \#([A-Fa-f0-9]{6}) ]]; then
    hex="#${BASH_REMATCH[1]}"
    r=$((16#${BASH_REMATCH[1]:0:2}))
    g=$((16#${BASH_REMATCH[1]:2:2}))
    b=$((16#${BASH_REMATCH[1]:4:2}))
    lum=$(awk -v R=$r -v G=$g -v B=$b 'BEGIN { printf("%.0f",0.2126*R + 0.7152*G + 0.0722*B) }')
    if (( lum > threshold )); then
      dominant_hex="$hex"
      break
    fi
  fi
done < <(printf '%s\n' "$histogram" | sort -nr)


if [[ -z "$dominant_hex" ]]; then
  dominant_hex=$(
    printf '%s\n' "$histogram" \
    | sort -nr \
    | head -1 \
    | sed -n 's/.*#\([A-Fa-f0-9]\{6\}\).*/#\1/p'
  )
fi

cat > "$JSON_FILE" <<EOF
{
  "dominant_color": "$dominant_hex"
}
EOF

echo "Wrote $JSON_FILE → $dominant_hex"

. /home/daveee/Coding/languages/shell/ConfigColors/waybarColConfig.sh
. /home/daveee/Coding/languages/shell/ConfigColors/alacrittyColConfig.sh
. /home/daveee/Coding/languages/shell/ConfigColors/hyprColConfig.sh
. /home/daveee/Coding/languages/shell/ConfigColors/yaziColConfig.sh
. /home/daveee/Coding/languages/shell/ConfigColors/cavaColConfig.sh
. /home/daveee/Coding/languages/shell/ConfigColors/kittyColConfig.sh
