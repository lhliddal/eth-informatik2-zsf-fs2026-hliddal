#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CHAPTER_DIR="$ROOT_DIR/chapters"

if [[ ! -d "$CHAPTER_DIR" ]]; then
  echo "chapters directory not found: $CHAPTER_DIR"
  exit 1
fi

patterns=(
  '\\vspace\*?\{'
  '\\hspace\*?\{'
  '\\columncolor\{'
  '\\rowcolor\{'
  '\\begin\{tabular\*?\}'
  '\\begin\{tabularx\}'
  '\\begin\{(sectionbox|smallbox|bigbox)\}'
  '\\(small|med|big)break\b'
  '\\(scriptsize|footnotesize)\b'
)

messages=(
  'Use central spacing macros (\ZSFgapXS/S/M/L) instead of local \\vspace.'
  'Use a thin space (\,) or central spacing macros instead of local \\hspace.'
  'Use centralized table color macros/types; avoid direct \\columncolor in chapters.'
  'Use \ZSFrowColor (or zebra via ZSFtable*) instead of direct \\rowcolor in chapters.'
  'Use \begin{ZSFtable}/\begin{ZSFtableFlat}/\begin{ZSFtablePlain} instead of raw tabular.'
  'Use \begin{ZSFtable}/\begin{ZSFtableFlat}/\begin{ZSFtablePlain} instead of raw tabularx.'
  'Removed aliases: use contentbox/defbox/statementbox (see rules/20_boxes.md).'
  'Use \ZSFgapXS/S/M/L instead of \smallbreak/\medbreak/\bigbreak.'
  'Use semantic font macros (\ZSFfontTableDense, \ZSFfontNote) instead of direct size commands.'
)

violations=0

search_matches() {
  local pattern="$1"
  local file="$2"
  if command -v rg >/dev/null 2>&1; then
    rg -n --pcre2 "$pattern" "$file"
  else
    grep -nE "$pattern" "$file"
  fi
}

while IFS= read -r file; do
  for i in "${!patterns[@]}"; do
    if search_matches "${patterns[$i]}" "$file" >/dev/null; then
      echo "[RULE VIOLATION] $file"
      search_matches "${patterns[$i]}" "$file"
      echo "  -> ${messages[$i]}"
      violations=1
    fi
  done
done < <(find "$CHAPTER_DIR" -name '*.tex' | sort)

if [[ "$violations" -ne 0 ]]; then
  echo "Chapter rule check failed."
  exit 1
fi

echo "Chapter rule check passed."
