#!/usr/bin/env bash
set -euo pipefail

# Tag a past commit safely.
# Usage:
#   ./scripts/tag_at.sh 2.1.00 <commit>
# Example:
#   ./scripts/tag_at.sh 2.1.00 a1b2c3d

VERSION="${1:-}"
COMMIT="${2:-}"

if [[ -z "$VERSION" || -z "$COMMIT" ]]; then
  echo "Usage: $0 X.Y.ZZ <commit>"
  exit 1
fi

TAG="v${VERSION}"

if git rev-parse "$TAG" >/dev/null 2>&1; then
  echo "Tag already exists: $TAG"
  exit 1
fi

git rev-parse --verify "$COMMIT" >/dev/null 2>&1 || {
  echo "Invalid commit: $COMMIT"
  exit 1
}

git tag -a "$TAG" "$COMMIT" -m "HAS docs ${TAG} (tagged retroactively)"
echo "Tagged ${TAG} at ${COMMIT}"
echo "Next: git push --tags"