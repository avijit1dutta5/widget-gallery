#!/usr/bin/env bash
# Flip README screenshot/demo links from the .svg placeholders to your
# real .png / .gif captures, but only for files that actually exist.
set -euo pipefail
cd "$(dirname "$0")/.."

swap() { # $1 = path without extension, $2 = real extension
  if [[ -f "$1.$2" ]]; then
    sed -i '' "s#$1\.svg#$1.$2#g" README.md 2>/dev/null \
      || sed -i "s#$1\.svg#$1.$2#g" README.md
    echo "linked $1.$2"
  else
    echo "skip   $1.$2 (not found — capture it first)"
  fi
}

swap docs/screenshots/home png
swap docs/screenshots/detail png
swap docs/screenshots/settings png
swap docs/screenshots/themes png
swap docs/demo/walkthrough gif

echo "Done. Review README.md, then: git add -A && git commit && git push"
