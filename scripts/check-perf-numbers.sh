#!/usr/bin/env bash
# ============================================================================
# check-perf-numbers.sh — 官网侧的数字一致性闸门（gox-website 仓库用）
#
# 官网不放 bench-results，也不该有第二份数字。本脚本：
#   1) 取主仓 golden（docs/perf-numbers.json）—— 优先用环境变量 GOLDEN_PATH
#      （主仓 checkout 在旁边时最省事），否则走 GOLDEN_URL（默认 GitHub raw）；
#   2) 跑 gen-perf-numbers.py --check，逐字比对两页里的数字块；
#   3) 不一致就红，输出「哪一块 / 怎么修」。
#
# 为什么要它：官网曾经手抄主仓的参数快照（247ms / 1.22×），而主仓 README 与
# docs 已经走到下一批数字 —— 同一套宣传材料三个出口各说各话。渲染层的
# `--check` 是唯一能保证「三处一致」的机制；没有它，生成器只是一次性的搬运工。
#
# 用法：
#   ./scripts/check-perf-numbers.sh          # 校验（CI 与本地都跑这一条）
#   GOLDEN_PATH=../Gox/docs/perf-numbers.json ./scripts/check-perf-numbers.sh
#   ./scripts/check-perf-numbers.sh --write  # 本机把最新 golden 渲染进页面（改数字时用）
# ============================================================================
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
GEN="$ROOT/scripts/gen-perf-numbers.py"
MAIN_REPO_URL="${GOLDEN_URL:-https://raw.githubusercontent.com/14752222/Gox/main/docs/perf-numbers.json}"
FILES=(guide/performance.md en/guide/performance.md)

if [[ ! -f "$GEN" ]]; then
  echo "::error::缺少 scripts/gen-perf-numbers.py —— 官网数字生成器必须与本脚本一起提交" >&2
  exit 2
fi

ARGS=(--root "$ROOT" --files "${FILES[@]}")
if [[ -n "${GOLDEN_PATH:-}" ]]; then
  if [[ ! -f "$GOLDEN_PATH" ]]; then
    echo "::error::GOLDEN_PATH 指向的文件不存在：$GOLDEN_PATH" >&2
    exit 2
  fi
  ARGS+=(--golden "$GOLDEN_PATH")
else
  # 拿不到本地 golden 时回退拉取主仓那一份；两种方式读的是**同一个文件**。
  ARGS+=(--golden "$ROOT/.perf-numbers.json" --golden-url "$MAIN_REPO_URL")
fi

case "${1:-}" in
  --write)
    python3 "$GEN" "${ARGS[@]}" --write
    python3 "$GEN" "${ARGS[@]}" --check
    ;;
  "" )
    if ! python3 "$GEN" "${ARGS[@]}" --check; then
      cat >&2 <<'EOF'

官网性能数字与主仓 golden 不一致。
怎么修：
  1) 在主仓跑基准（./scripts/bench-all.sh --runs 5），再 ./scripts/perf-numbers.sh
  2) 回到本仓：GOLDEN_PATH=<主仓>/docs/perf-numbers.json ./scripts/check-perf-numbers.sh --write
  3) 提交本仓改动（页面里的数字块由生成器产出，**不要手改**）
EOF
      exit 1
    fi
    ;;
  * )
    echo "未知参数：$1（可用 --write）" >&2
    exit 2
    ;;
esac
