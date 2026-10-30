#!/usr/bin/env bash
# 사용법 (작업 폴더에서): bash sk-hynix/setup.sh
set -e
SRC="$(cd "$(dirname "$0")" && pwd)"
cp "$SRC/AGENTS.md" ./AGENTS.md
mkdir -p templates docs
cp "$SRC"/templates/* ./templates/
echo "harness ready: AGENTS.md, templates/, docs/"
