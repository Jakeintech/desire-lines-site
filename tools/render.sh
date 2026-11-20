#!/bin/sh
# Rebuilds the share card and the icons from their SVG sources. Needs Google Chrome and Python 3 with Pillow.
#   tools/og.svg           -> assets/img/og.png               (1200 x 630)
#   tools/icon-square.svg  -> assets/img/apple-touch-icon.png (180, square: iOS rounds it)
#                          -> assets/img/favicon-32.png       (32, rounded like favicon.svg)
# The mark is a placeholder. When the real app icon lands, replace favicon.svg and the two PNGs with it.
set -e
cd "$(dirname "$0")/.."
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
TMP="$(mktemp -d)"
shot() { "$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 --user-data-dir="$TMP/p" --window-size="$2" --screenshot="$3" "file://$PWD/$1" >/dev/null 2>&1 || true; test -s "$3"; }
shot tools/og.svg 1200,630 assets/img/og.png
shot tools/icon-square.svg 720,720 "$TMP/icon.png"
python3 - "$TMP/icon.png" <<'PY'
import sys
from PIL import Image, ImageDraw
im = Image.open(sys.argv[1]).convert('RGB')
assert im.size == (720, 720), im.size
im.resize((180, 180), Image.LANCZOS).save('assets/img/apple-touch-icon.png', optimize=True)
mask = Image.new('L', im.size, 0)
ImageDraw.Draw(mask).rounded_rectangle((0, 0, 719, 719), radius=158, fill=255)
rgba = im.convert('RGBA'); rgba.putalpha(mask)
rgba.resize((32, 32), Image.LANCZOS).save('assets/img/favicon-32.png', optimize=True)
og = Image.open('assets/img/og.png').convert('RGB'); assert og.size == (1200, 630), og.size
og.save('assets/img/og.png', optimize=True)
print('og', og.size)
PY
rm -rf "$TMP"
