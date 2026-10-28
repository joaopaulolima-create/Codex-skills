#!/usr/bin/env bash

set -euo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
test_root=$(mktemp -d)
trap 'rm -rf "$test_root"' EXIT

printf 'dentistas em Campinas, SP\n' > "$test_root/queries.txt"

bash "$script_dir/run-local.sh" \
  --queries "$test_root/queries.txt" \
  --output-dir "$test_root/output" \
  --depth 1 \
  --dry-run >/dev/null

if bash "$script_dir/run-local.sh" \
  --queries "$test_root/queries.txt" \
  --output-dir "$test_root/output" \
  --depth 2 \
  --dry-run >/dev/null 2>&1; then
  echo "run-local.sh accepted depth above 1" >&2
  exit 1
fi

if bash "$script_dir/run-local.sh" \
  --queries "$test_root/queries.txt" \
  --output-dir "$test_root/output" \
  --proxy-file "$test_root/proxy.txt" \
  --dry-run >/dev/null 2>&1; then
  echo "run-local.sh accepted proxy mode" >&2
  exit 1
fi

printf 'one\ntwo\nthree\nfour\n' > "$test_root/too-many-queries.txt"
if bash "$script_dir/run-local.sh" \
  --queries "$test_root/too-many-queries.txt" \
  --output-dir "$test_root/output" \
  --dry-run >/dev/null 2>&1; then
  echo "run-local.sh accepted more than three queries" >&2
  exit 1
fi

echo "run-local.sh targeted-mode tests passed"
