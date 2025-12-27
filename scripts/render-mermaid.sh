#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./render-mermaid.sh                                # assets/**/*.mmd を対象（既定: PNG）
#   MERMAID_FORMAT=svg ./render-mermaid.sh             # SVGのみ生成
#   MERMAID_FORMAT=png MERMAID_WIDTH=3200 ./render-mermaid.sh  # PNG生成（幅px指定）
#   ./render-mermaid.sh path/to/file.mmd
#   ./render-mermaid.sh assets/**/*.mmd
#
# Requirements:
#   npm i -D @mermaid-js/mermaid-cli
#   (PNG出力する場合)
#     Inkscape（推奨・文字をパス化）
#       macOS: brew install --cask inkscape
#       Ubuntu: apt-get install -y inkscape
#     librsvg: rsvg-convert（フォント解決に依存）
#       macOS: brew install librsvg
#       Ubuntu: apt-get install -y librsvg2-bin

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

# Output options
#   MERMAID_CONFIG: mmdc の -c に渡す設定ファイル（既定: $ROOT/mermaid-config.json があれば使用）
#   MERMAID_FORMAT: svg | png (default: png)
#   MERMAID_WIDTH : PNGの幅(px). default: 2400
#   MERMAID_KEEP_SVG: 1 を指定すると PNG生成時も中間SVGを残す
# Mermaid config file (optional)
#   MERMAID_CONFIG: mmdc の -c に渡す設定ファイル
#   既定: $ROOT/mermaid-config.json が存在すればそれを使う（無ければ未指定）
MERMAID_CONFIG="${MERMAID_CONFIG:-}"
if [[ -z "$MERMAID_CONFIG" && -f "$ROOT/mermaid-config.json" ]]; then
  MERMAID_CONFIG="$ROOT/mermaid-config.json"
fi

MERMAID_FORMAT="${MERMAID_FORMAT:-png}"
MERMAID_WIDTH="${MERMAID_WIDTH:-2400}"
MERMAID_KEEP_SVG="${MERMAID_KEEP_SVG:-0}"

# PNG変換エンジン: inkscape | rsvg (default: inkscape)
MERMAID_PNG_ENGINE="${MERMAID_PNG_ENGINE:-inkscape}"
echo "MERMAID_CONFIG: $MERMAID_CONFIG"
echo "MERMAID_PNG_ENGINE: $MERMAID_PNG_ENGINE"
echo "MERMAID_FORMAT: $MERMAID_FORMAT"
echo "MERMAID_WIDTH: $MERMAID_WIDTH"
echo "MERMAID_KEEP_SVG: $MERMAID_KEEP_SVG"

if [[ -n "${MERMAID_CONFIG:-}" && ! -f "$MERMAID_CONFIG" ]]; then
  echo "MERMAID_CONFIG が見つからない: $MERMAID_CONFIG"
  exit 1
fi

if ! command -v npx >/dev/null 2>&1; then
  echo "npx が見つからない。Node.js/npm を入れてね。"
  exit 1
fi

# Mermaid CLI exists?
if ! npx --yes @mermaid-js/mermaid-cli --version >/dev/null 2>&1; then
  echo "@mermaid-js/mermaid-cli が使えない。プロジェクトで npm i -D @mermaid-js/mermaid-cli して。"
  exit 1
fi

# PNG出力する場合の依存チェック
if [[ "$MERMAID_FORMAT" == "png" ]]; then
  if [[ "$MERMAID_PNG_ENGINE" == "inkscape" ]]; then
    if ! command -v inkscape >/dev/null 2>&1; then
      echo "PNG出力(inkscape)には Inkscape が必要。インストールしてね。"
      echo "  macOS:  brew install --cask inkscape"
      echo "  Ubuntu: apt-get install -y inkscape"
      exit 1
    fi
  else
    if ! command -v rsvg-convert >/dev/null 2>&1; then
      echo "PNG出力(rsvg)には rsvg-convert が必要（librsvg）。インストールしてね。"
      echo "  macOS:  brew install librsvg"
      echo "  Ubuntu: apt-get install -y librsvg2-bin"
      exit 1
    fi
  fi
fi

render_one_mmd() {
  local mmd="$1"
  if [[ ! -f "$mmd" ]]; then
    echo "Skip (not found): $mmd"
    return 0
  fi
  if [[ "${mmd##*.}" != "mmd" ]]; then
    echo "Skip (not .mmd): $mmd"
    return 0
  fi

  local dir base stem svg_out png_out
  dir="$(cd "$(dirname "$mmd")" && pwd)"
  base="$(basename "$mmd")"
  stem="${base%.mmd}"

  svg_out="$dir/${stem}.svg"
  png_out="$dir/${stem}.png"

  echo "Rendering (SVG): $mmd"
  # 追加オプション例: -c mermaid-config.json など（必要なら下の npx 行に足す）
  # NOTE: Mermaidの htmlLabels が true だと <foreignObject> になり、Inkscapeで文字が落ちやすい。configで htmlLabels:false 推奨。
  local cfg_opt=()
  if [[ -n "${MERMAID_CONFIG:-}" ]]; then
    cfg_opt+=("-c" "$MERMAID_CONFIG")
  fi

  npx -p @mermaid-js/mermaid-cli mmdc -i "$mmd" -o "$svg_out" "${cfg_opt[@]}"
  echo "  -> $svg_out"

  if [[ "$MERMAID_FORMAT" == "png" ]]; then
    echo "Converting (PNG, $MERMAID_PNG_ENGINE): $svg_out"
    if [[ "$MERMAID_PNG_ENGINE" == "inkscape" ]]; then
      # Inkscape: 日本語を含むテキストをパス化してPNG化（最も安全）
      inkscape "$svg_out" \
        --export-type=png \
        --export-text-to-path \
        --export-width="$MERMAID_WIDTH" \
        --export-filename="$png_out"
    else
      # librsvg: フォント解決に依存
      rsvg-convert "$svg_out" -w "$MERMAID_WIDTH" -o "$png_out"
    fi
    echo "  -> $png_out"

    if [[ "$MERMAID_KEEP_SVG" != "1" ]]; then
      rm -f "$svg_out"
    fi
  fi
}

# 引数が指定されていない場合、assets/**/*.mmd を対象にする
if [[ $# -eq 0 ]]; then
  # find を使って assets ディレクトリ以下の .mmd ファイルを検索
  while IFS= read -r -d '' mmd; do
    render_one_mmd "$mmd"
  done < <(find "$ROOT/assets" -name "*.mmd" -type f -print0 2>/dev/null)
else
  for mmd in "$@"; do
    render_one_mmd "$mmd"
  done
fi