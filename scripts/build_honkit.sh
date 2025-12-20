#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="honkit"
OUT="$ROOT/$SRC/src"

# 1) clean
rm -rf "$OUT"
mkdir -p "$OUT"

# 2) copy honkit control files (SUMMARY/README etc.)
# ここはあなたの運用に合わせて。honkit/ を正としてコピー。
cp -R "$ROOT/$SRC/README.md" "$OUT/"
cp -R "$ROOT/$SRC/SUMMARY.md" "$OUT/"
# cp -R "$ROOT/honkit/book.json" "$OUT/"
# cp -R "$ROOT/honkit/" "$OUT/"

# 3) copy source docs into OUT keeping original structure
#   - 必要な範囲だけ。最初は雑でOK。
mkdir -p $OUT
cp -aR "$ROOT/docs" "$OUT/"
cp -aR "$ROOT/governance" "$OUT/"
cp -aR "$ROOT/resources" "$OUT/"
# cp -aR "$ROOT/README.md" "$OUT/"

# rsync -a --delete \
#   --exclude ".git/" \
#   --exclude "honkit/" \
#   --exclude "honkit/src/" \
#   --exclude "node_modules/" \
#   "$ROOT/docs" "$ROOT/governance" "$ROOT/resources" "$ROOT/README.md" \
#   "$OUT/src/"

# README.md を Honkitルートに置く（必須）
# OUT/README.md が無いと死ぬので確実に置く
# if [ ! -f "$OUT/README.md" ]; then
#   ln -sf "src/README.md" "$OUT/README.md" 2>/dev/null || cp "$OUT/src/README.md" "$OUT/README.md"
# fi

# 4) rewrite links in generated markdown
# ルール: (../docs/xxx.md) -> (src/docs/xxx.md) のように prefix する
# 必要に応じて増やす
rewrite_file() {
  local f="$1"

  # f は honkit/src 配下の .md を想定
  # 例: /.../honkit/src/docs/foo.md
  local rel="${f#*honkit/src/}"        # docs/foo.md のようにする（環境により調整してOK）
  local dir
  dir="$(dirname "$rel")"              # docs とか resources/patterns/state とか

  # src ルートからの深さぶん ../ を作る
  local depth=0
  if [ "$dir" != "." ]; then
    # "a/b/c" -> 3
    depth=$(awk -F'/' '{print NF}' <<< "$dir")
  fi

  local prefix=""
  for ((i=0; i<depth; i++)); do
    prefix+="../"
  done

  # いったん docs/governance/resources を「book-root相対」とみなして prefix を付け直す
  # - (./docs/xxx.md) も (../docs/xxx.md) も (docs/xxx.md) も全部そろえる
  perl -0777 -i -pe "
    s!\\((?:\\./|\\.\\./)+docs/!(${prefix}docs/!g;
    s!\\((?:\\./|\\.\\./)+governance/!(${prefix}governance/!g;
    s!\\((?:\\./|\\.\\./)+resources/!(${prefix}resources/!g;

    s!\\(docs/!(${prefix}docs/!g;
    s!\\(governance/!(${prefix}governance/!g;
    s!\\(resources/!(${prefix}resources/!g;
  " "$f"
}

export -f rewrite_file

# 対象: 生成された src 配下の .md
find "$OUT" -name "*.md" -print0 | while IFS= read -r -d '' f; do
  rewrite_file "$f"
done

echo "OK: generated Honkit sources at: $OUT"
echo "Run: (cd $SRC && honkit serve)"