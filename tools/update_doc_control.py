#!/usr/bin/env python3
from __future__ import annotations

import argparse
import subprocess
from dataclasses import dataclass
from pathlib import Path
import re
from typing import Iterable

START = "<!-- DOCCTRL:START -->"
END = "<!-- DOCCTRL:END -->"

BLOCK_RE = re.compile(
    r"<!-- DOCCTRL:START -->.*?<!-- DOCCTRL:END -->",
    re.DOTALL,
)

@dataclass(frozen=True)
class GitInfo:
    repo_version: str
    last_modified: str
    commit: str
    author: str

def run(cmd: list[str], cwd: Path) -> str:
    out = subprocess.check_output(cmd, cwd=str(cwd), stderr=subprocess.STDOUT)
    return out.decode("utf-8").strip()

def git_info(repo_root: Path, file_path: Path) -> GitInfo:
    # Repo version (tag-based). Falls back to short sha if no tags.
    repo_version = run(
        ["git", "describe", "--tags", "--always", "--dirty", "--abbrev=8"],
        repo_root,
    )

    # Last commit touching this file
    # %cs: committer date (YYYY-MM-DD), %h short sha, %an author name
    fmt = "%cs|%h|%an"
    raw = run(
        ["git", "log", "-1", f"--format={fmt}", "--", str(file_path)],
        repo_root,
    )
    if not raw:
        # Untracked file etc.
        return GitInfo(repo_version=repo_version, last_modified="N/A", commit="N/A", author="N/A")

    last_modified, commit, author = raw.split("|", 2)
    return GitInfo(repo_version=repo_version, last_modified=last_modified, commit=commit, author=author)

def render_block(info: GitInfo) -> str:
    # Minimal, factual, low-maintenance
    lines = [
        START,
        "## Document Control",
        f"- **Repo Version:** {info.repo_version}",
        f"- **Last Modified:** {info.last_modified}",
        f"- **Commit:** {info.commit}",
        f"- **Author:** {info.author}",
        END,
    ]
    return "\n".join(lines)

def update_file(repo_root: Path, md_path: Path) -> bool:
    text = md_path.read_text(encoding="utf-8")
    if START not in text or END not in text:
        return False  # no block; skip

    info = git_info(repo_root, md_path)
    new_block = render_block(info)

    if not BLOCK_RE.search(text):
        raise RuntimeError(f"Malformed doc control block in {md_path}")

    new_text = BLOCK_RE.sub(new_block, text, count=1)

    if new_text != text:
        md_path.write_text(new_text, encoding="utf-8")
        return True
    return False

def iter_targets(repo_root: Path, patterns: Iterable[str]) -> list[Path]:
    out: list[Path] = []
    for pat in patterns:
        out.extend(repo_root.glob(pat))
    # only files
    return [p for p in out if p.is_file()]

def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--root", default=".", help="repo root")
    ap.add_argument("--patterns", nargs="+", default=["docs/**/*.md", "governance/**/*.md"], help="glob patterns")
    args = ap.parse_args()

    repo_root = Path(args.root).resolve()
    targets = iter_targets(repo_root, args.patterns)

    changed = 0
    for p in targets:
        try:
            if update_file(repo_root, p):
                changed += 1
        except Exception as e:
            raise SystemExit(f"ERROR: {p}: {e}") from e

    print(f"Updated {changed} file(s).")

if __name__ == "__main__":
    main()