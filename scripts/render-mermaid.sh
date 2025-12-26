#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./render-mermaid.sh                    # assets/**/*.mmd を対象
#   ./render-mermaid.sh path/to/file.mmd
#   ./render-mermaid.sh assets/**/*.mmd
#
# Requirements:
#   npm i -D @mermaid-js/mermaid-cli

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

if ! command -v npx >/dev/null 2>&1; then
  echo "npx が見つからない。Node.js/npm を入れてね。"
  exit 1
fi

# Mermaid CLI exists?
if ! npx --yes @mermaid-js/mermaid-cli --version >/dev/null 2>&1; then
  echo "@mermaid-js/mermaid-cli が使えない。プロジェクトで npm i -D @mermaid-js/mermaid-cli して。"
  exit 1
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

  local dir base stem out
  dir="$(cd "$(dirname "$mmd")" && pwd)"
  base="$(basename "$mmd")"
  stem="${base%.mmd}"
  out="$dir/${stem}.svg"

  echo "Rendering: $mmd"
  # Add any extra mmdc options here if you want (e.g. -c mermaid-config.json)
  npx -p @mermaid-js/mermaid-cli mmdc -i "$mmd" -o "$out"
  echo "  -> $out"
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