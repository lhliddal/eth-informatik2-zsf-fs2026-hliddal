#!/usr/bin/env bash
set -euo pipefail

# Nicht-failender Report: Design-System-Adoption pro Kapitel.
# Fortschrittsmetrik fuer das Design-Rework — kein Teil von `make check`.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CHAPTER_DIR="$ROOT_DIR/chapters"
BUILD_LOG="$ROOT_DIR/build/main.log"

if [[ ! -d "$CHAPTER_DIR" ]]; then
  echo "chapters directory not found: $CHAPTER_DIR"
  exit 1
fi

count() {
  # grep liefert exit 1 bei 0 Treffern — wegen pipefail abfangen
  { grep -o "$1" "$2" 2>/dev/null || true; } | wc -l | tr -d ' '
}

printf '%-38s %7s %8s %7s %7s %6s %6s %6s\n' \
  "Kapitel" "textbf" "keyword" "itemize" "factls" "proc" "defbox" "frmbox"
printf '%.0s-' {1..96}; printf '\n'

total_textbf=0
while IFS= read -r file; do
  name="$(basename "$file")"
  n_textbf=$(count '\\textbf{' "$file")
  n_keyword=$(count '\\ZSFkeyword{' "$file")
  n_itemize=$(count 'begin{itemize}' "$file")
  n_factlist=$(count 'begin{factlist}' "$file")
  n_proc=$(count 'begin{procedure}' "$file")
  n_defbox=$(count 'begin{defbox}' "$file")
  n_formula=$(count 'begin{formulabox}' "$file")
  total_textbf=$((total_textbf + n_textbf))
  printf '%-38s %7s %8s %7s %7s %6s %6s %6s\n' \
    "$name" "$n_textbf" "$n_keyword" "$n_itemize" "$n_factlist" "$n_proc" "$n_defbox" "$n_formula"
done < <(find "$CHAPTER_DIR" -name '*.tex' | sort)

printf '%.0s-' {1..96}; printf '\n'
echo "Total \\textbf in chapters: $total_textbf"

for env in statementbox propertylist tablebox; do
  n=$(cat "$CHAPTER_DIR"/*.tex | { grep -o "begin{$env}" || true; } | wc -l | tr -d ' ')
  echo "Total $env: $n"
done
n_ref=$(cat "$CHAPTER_DIR"/*.tex | { grep -o '\\ZSFref{' || true; } | wc -l | tr -d ' ')
echo "Total \\ZSFref: $n_ref"

if [[ -f "$BUILD_LOG" ]]; then
  n_overfull=$(grep -c "Overfull" "$BUILD_LOG" || true)
  echo "Overfull-Warnungen (build/main.log): $n_overfull"
else
  echo "Kein build/main.log gefunden — erst 'make build' ausfuehren."
fi
