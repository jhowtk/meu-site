#!/usr/bin/env bash
set -euo pipefail

mkdir -p dist
cp index.html dist/index.html

date_value="$(TZ=America/Sao_Paulo date '+%d/%m/%Y às %H:%M')"
commit_sha="${CF_PAGES_COMMIT_SHA:-unknown}"
commit_short="${commit_sha:0:7}"
author="$(git log -1 --format='%an' 2>/dev/null || printf 'jhowtk')"

sed -i -e "s|__DATA__|${date_value}|g" -e "s|__COMMIT__|${commit_short}|g" -e "s|__AUTOR__|${author}|g" dist/index.html
