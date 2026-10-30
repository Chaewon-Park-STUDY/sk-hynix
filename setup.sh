#!/usr/bin/env bash
# 사용법 (작업 폴더에서): bash sk-hynix/setup.sh
# 기존 파일은 절대 덮어쓰지 않는다. (과제가 제공한 AGENTS.md·템플릿 보호)
set -e
SRC="$(cd "$(dirname "$0")" && pwd)"

if [ -e ./AGENTS.md ]; then
  echo "[건너뜀] 작업 폴더에 AGENTS.md가 이미 있습니다. 과제 제공 파일을 우선합니다."
  echo "        필요하면 $SRC/AGENTS.md 내용을 참고만 하세요."
else
  cp "$SRC/AGENTS.md" ./AGENTS.md
  echo "[복사] AGENTS.md"
fi

mkdir -p templates docs
for f in "$SRC"/templates/*; do
  name="$(basename "$f")"
  if [ -e "templates/$name" ]; then
    echo "[건너뜀] templates/$name (이미 있음)"
  else
    cp "$f" "templates/$name"
    echo "[복사] templates/$name"
  fi
done
echo "harness ready"
echo "→ 요청 문구: 에디터에서 $(basename "$SRC")/PROMPTS.md 열기"
echo "→ 지금 codex를 시작하세요 (이미 켜져 있었다면 종료 후 다시 실행)"
