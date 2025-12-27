#!/usr/bin/env bash
# Usage:
#   ./scripts/quarto_build.sh
#     - recent だけ更新: pdf/has-manual-recent.pdf
#
#   ./scripts/quarto_build.sh --release 2.0.1
#     - recent + バージョン付き生成: pdf/has-manual-recent.pdf と pdf/has-manual-v2.0.1.pdf
#
#   ./scripts/quarto_build.sh --release --tag
#     - HEAD に付いた git tag (例: v2.0.1) からバージョンを取得して生成
#
#   ./scripts/quarto_build.sh --publish
#     - recent を gh-pages に反映して push
#
#   ./scripts/quarto_build.sh --release 2.0.1 --publish
#     - recent + バージョン付き を gh-pages に反映して push
set -euo pipefail

OUT_FILE="has-manual.pdf"          # Quarto が生成するベース名（この名前で出る想定）
RECENT_FILE="has-manual-recent.pdf" # 公開用の固定名（常に上書き）

MODE="recent"          # recent | release
USE_TAG="0"            # 1 の場合、git tag から version を取得
PUBLISH="0"            # 1 の場合、gh-pages に反映
VERSION=""             # release 時のみ必要

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
echo "ROOT: $ROOT"
QUARTO_DIR="$ROOT/quarto"
STAGE_DIR="$QUARTO_DIR/src"

# ---- worktree cleanup (publish) ----
WORKTREE_DIR="$ROOT/.worktree-gh-pages"
WORKTREE_ACTIVE="0"
cleanup_worktree() {
  if [[ "$WORKTREE_ACTIVE" == "1" ]]; then
    # worktree が残ると gh-pages checkout がブロックされるため、必ず掃除する
    git worktree remove "$WORKTREE_DIR" --force >/dev/null 2>&1 || true
    rm -rf "$WORKTREE_DIR" >/dev/null 2>&1 || true
  fi
}
# スクリプトが途中で落ちても worktree を残さない
trap cleanup_worktree EXIT INT TERM

die() {
  echo "ERROR: $*" >&2
  exit 1
}

# ---- args ----
# 受け取りたい形:
#   --release [version]
#   --release --tag
#   --publish
while [[ $# -gt 0 ]]; do
  case "$1" in
    --release)
      MODE="release"
      shift
      # 次が version の場合だけ拾う（--tag/--publish が来たら後で処理）
      if [[ ${1:-} != "" && ${1:-} != --* ]]; then
        VERSION="$1"
        shift
      fi
      ;;
    --tag)
      USE_TAG="1"
      shift
      ;;
    --publish)
      PUBLISH="1"
      shift
      ;;
    -h|--help)
      sed -n '1,40p' "$0"
      exit 0
      ;;
    *)
      # 互換: 引数が単独で渡されたら release version とみなす
      MODE="release"
      VERSION="$1"
      shift
      ;;
  esac
done

# ---- resolve version from git tag ----
if [[ "$MODE" == "release" ]]; then
  if [[ "$USE_TAG" == "1" ]]; then
    # HEAD に付いた tag を使う（lightweight/annotated どちらもOK）
    TAG="$(git describe --tags --exact-match 2>/dev/null || true)"
    [[ -n "$TAG" ]] || die "--tag を指定したが、HEAD に tag が付いてない"
    VERSION="${TAG#v}"
  fi
  [[ -n "$VERSION" ]] || die "--release には version か --tag が必要"
fi

# ---- output filenames ----
# release: has-manual-vX.Y.Z.pdf
if [[ "$MODE" == "release" ]]; then
  BASE="${OUT_FILE%.pdf}"
  VERSIONED_FILE="${BASE}-v${VERSION}.pdf"
else
  VERSIONED_FILE=""
fi

# Publish layout
PUBLISH_DIR_REL="pdf"  # gh-pages 上の配置先

# ---- sanity checks ----
command -v quarto >/dev/null 2>&1 || { echo "ERROR: quarto が見つからない"; exit 1; }
command -v git >/dev/null 2>&1 || { echo "ERROR: git が見つからない"; exit 1; }
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
# OUT_FILE で生成PDF名を固定（未指定だと main.pdf などに固定される）
quarto render "$QUARTO_DIR/main.qmd" --output "$OUT_FILE" --to pdf

# ---- collect output ----
# Quarto の出力先は main.qmd と同じディレクトリになる想定
GENERATED_PDF="$QUARTO_DIR/$(basename "${OUT_FILE}")"
if [[ ! -f "$GENERATED_PDF" ]]; then
  die "生成されたPDFが見つからない: $GENERATED_PDF"
fi

# recent は常に上書き
cp -f "$GENERATED_PDF" "$QUARTO_DIR/$RECENT_FILE"
echo "Generated (recent): $QUARTO_DIR/$RECENT_FILE"

# release の場合は versioned も作る（recent と同一内容）
if [[ "$MODE" == "release" ]]; then
  cp -f "$GENERATED_PDF" "$QUARTO_DIR/$VERSIONED_FILE"
  echo "Generated (versioned): $QUARTO_DIR/$VERSIONED_FILE"
fi

# ベースPDFは残す必要がないので消す（必要ならコメントアウト）
rm -f "$GENERATED_PDF"


# ---- publish to gh-pages (optional) ----
if [[ "$PUBLISH" == "1" ]]; then
  WORKTREE_ACTIVE="1"

  # remote 側が進んでいる（例: GitHub Actions）ケースがあるため、必ず最新を取得する
  git fetch origin gh-pages >/dev/null 2>&1 || true

  # 既存の残骸があっても掃除してから作る
  rm -rf "$WORKTREE_DIR"

  # origin/gh-pages をベースに worktree を作る（ローカルの古い gh-pages に依存しない）
  git worktree add -B gh-pages "$WORKTREE_DIR" origin/gh-pages >/dev/null

  mkdir -p "$WORKTREE_DIR/$PUBLISH_DIR_REL"

  # recent を必ず配置
  cp -f "$QUARTO_DIR/$RECENT_FILE" "$WORKTREE_DIR/$PUBLISH_DIR_REL/$RECENT_FILE"

  # release の場合は versioned も配置
  if [[ "$MODE" == "release" ]]; then
    cp -f "$QUARTO_DIR/$VERSIONED_FILE" "$WORKTREE_DIR/$PUBLISH_DIR_REL/$VERSIONED_FILE"
  fi

  cd "$WORKTREE_DIR"
  git add "$PUBLISH_DIR_REL/$RECENT_FILE"
  if [[ "$MODE" == "release" ]]; then
    git add "$PUBLISH_DIR_REL/$VERSIONED_FILE"
  fi

  if git diff --cached --quiet; then
    echo "No changes to publish."
  else
    MSG="Update PDF (${RECENT_FILE})"
    if [[ "$MODE" == "release" ]]; then
      MSG="Release PDF v${VERSION}"
    fi
    git commit -m "$MSG" >/dev/null
    git push origin gh-pages
    echo "Published to gh-pages: $PUBLISH_DIR_REL/"
  fi

  cd "$ROOT"
fi