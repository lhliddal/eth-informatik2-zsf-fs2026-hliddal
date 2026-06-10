#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

allowed_files=(
  "main.tex" "main.pdf" "main.synctex.gz"
  "info2_fs2025_hliddal.pdf" "info2_fs2025_hliddal.synctex.gz"
  "preamble.tex" "Makefile"
  ".gitignore" ".pre-commit-config.yaml"
  "CLAUDE.md" "AGENTS.md" "MODULAR_SYSTEM.md" "README.md"
)
allowed_dirs=(
  "chapters" "styles" "tests" "scripts" "tools" "rules"
  "Images" "figures"
  "build" "_scratch"
  ".git" ".github" ".vscode" ".cursor" ".claude"
)

is_in() { local n="$1"; shift; for x in "$@"; do [[ "$x" == "$n" ]] && return 0; done; return 1; }

violations=0
shopt -s dotglob nullglob
for entry in "$ROOT_DIR"/*; do
  name="$(basename "$entry")"
  if [[ -d "$entry" ]]; then
    is_in "$name" "${allowed_dirs[@]}" || { echo "[ROOT CLEAN] Unerwarteter Ordner: $name/"; violations=1; }
  else
    is_in "$name" "${allowed_files[@]}" || { echo "[ROOT CLEAN] Unerwartete Datei: $name"; violations=1; }
  fi
done
shopt -u dotglob nullglob

[[ $violations -eq 0 ]] || { echo "Root darf nur Whitelist-Einträge enthalten."; exit 1; }
echo "Root clean check passed."
