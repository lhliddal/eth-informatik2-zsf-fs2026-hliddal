#!/bin/bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MAIN_TEX="${ROOT_DIR}/main.tex"

required_chapters=(
  "chapters/00_titelbox"
  "chapters/01_python-syntax"
  "chapters/02_classes"
  "chapters/03_dynamische-programmierung"
  "chapters/04_algorithmen"
  "chapters/05_asymptotische-laufzeit"
  "chapters/06_numpy"
  "chapters/07_pandas"
  "chapters/08_ml"
  "chapters/09_datenstrukturen"
  "chapters/10_neuronale-netzwerke"
  "chapters/11_unsupervised"
  "chapters/12_code-examples"
  "chapters/13_dp-quiz"
  "chapters/14_credits"
)

if [ ! -f "${MAIN_TEX}" ]; then
  echo "Error: main.tex not found at ${MAIN_TEX}"
  exit 1
fi

status=0
for chapter in "${required_chapters[@]}"; do
  if ! awk -v c="${chapter}" 'BEGIN { ok=0 } $0 ~ "^[[:space:]]*\\\\input\\{" c "\\}" { ok=1 } END { exit ok ? 0 : 1 }' "${MAIN_TEX}"; then
    echo "[FULL BUILD CHECK] Missing active input: \\input{${chapter}}"
    status=1
  fi
done

if [ "${status}" -ne 0 ]; then
  echo "main.tex is not in full-build mode."
  exit 1
fi

echo "main.tex full-build check passed."
