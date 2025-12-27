#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
echo "ROOT: $ROOT"
QUARTO_DIR="$ROOT/quarto"
STAGE_DIR="$QUARTO_DIR/src"

# ---- sanity checks ----
command -v quarto >/dev/null 2>&1 || { echo "ERROR: quarto が見つからない"; exit 1; }
[ -d "$QUARTO_DIR" ] || { echo "ERROR: $QUARTO_DIR がない"; exit 1; }
[ -f "$QUARTO_DIR/_quarto.yml" ] || { echo "ERROR: $QUARTO_DIR/_quarto.yml がない"; exit 1; }

# ---- prepare staging ----
mkdir -p "$STAGE_DIR"

# 事故防止: 毎回クリーンにしたいならON（重いならコメントアウト）
rm -rf \
  "$STAGE_DIR/docs" \
  "$STAGE_DIR/assets" \
  "$STAGE_DIR/governance" \
  "$STAGE_DIR/resources"

# ---- copy (fast, preserves structure) ----
rsync -a --delete "$ROOT/docs/"       "$STAGE_DIR/docs/"
rsync -a --delete "$ROOT/assets/"     "$STAGE_DIR/assets/"
rsync -a --delete "$ROOT/governance/" "$STAGE_DIR/governance/"
rsync -a --delete "$ROOT/resources/"  "$STAGE_DIR/resources/"

# ---- run quarto from ROOT, but target the project dir ----
cd "$ROOT"
quarto render "$QUARTO_DIR/main.qmd"