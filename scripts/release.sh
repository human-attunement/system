#!/usr/bin/env bash
set -euo pipefail

# Minimal release protocol for HAS docs
# Usage:
#   ./scripts/release.sh 2.1.00
#
# Assumptions:
# - You have tools/update_doc_control.py
# - Document Control blocks exist in target docs
# - You want annotated tags: vX.Y.ZZ

VERSION="${1:-}"
if [[ -z "$VERSION" ]]; then
  echo "Usage: $0 X.Y.ZZ"
  exit 1
fi

TAG="v${VERSION}"

# Basic sanity checks
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Not a git repository."
  exit 1
fi

if git rev-parse "$TAG" >/dev/null 2>&1; then
  echo "Tag already exists: $TAG"
  exit 1
fi

# Make sure we are on a branch (not detached HEAD)
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
if [[ "$BRANCH" == "HEAD" ]]; then
  echo "Detached HEAD. Checkout a branch first."
  exit 1
fi

echo "==> Updating Document Control blocks..."
python3 tools/update_doc_control.py --patterns "docs/**/*.md" "governance/**/*.md"

# Stage changes (only if any)
git add -A

if git diff --cached --quiet; then
  echo "No changes after doc control update."
else
  echo "==> Creating release commit..."
  git commit -m "chore(release): ${TAG}"
fi

echo "==> Creating annotated tag ${TAG}..."
git tag -a "$TAG" -m "HAS docs ${TAG}"

echo "==> Done."
echo "Next:"
echo "  git push"
echo "  git push --tags"