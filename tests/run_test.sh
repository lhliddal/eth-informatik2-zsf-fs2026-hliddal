#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
"$DIR/check_main_full.sh"
"$DIR/check_chapter_rules.sh"
"$DIR/check_root_clean.sh"
echo "All checks passed."
