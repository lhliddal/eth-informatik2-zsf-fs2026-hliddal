#!/usr/bin/env bash
# Validiert PDF-Metadaten gegen die in styles/75_pdf_identity.tex gesetzten Werte.
# Info II setzt Title/Owner/Release hartkodiert im Style-Modul (nicht via Makefile),
# daher sind die Erwartungswerte hier passend zu styles/75_pdf_identity.tex gesetzt.
#   PDF_FILE — relativer Pfad zum gebauten PDF (default: main.pdf)
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PDF_FILE_REL="${PDF_FILE:-main.pdf}"
PDF_FILE="${ROOT_DIR}/${PDF_FILE_REL}"

EXPECTED_AUTHOR="Loris Einar Kristjan Hliddal"
EXPECTED_OWNER_ID="LEKH-ZSF-2026-A1B2"
EXPECTED_TITLE="ZSF Informatik II"
EXPECTED_RELEASE_ID="R2026.04"

if [[ ! -f "$PDF_FILE" ]]; then
  echo "Identity check failed: PDF not found at $PDF_FILE"
  echo "Run 'make build' first."
  exit 1
fi

if ! command -v pdfinfo >/dev/null 2>&1; then
  echo "Identity check failed: 'pdfinfo' is required but not installed."
  exit 1
fi

pdfinfo_out="$(pdfinfo "$PDF_FILE")"

extract_field() {
  local key="$1"
  awk -F': ' -v k="$key" '$1 == k { sub(/^[[:space:]]+/, "", $2); print $2 }' <<<"$pdfinfo_out"
}

author="$(extract_field "Author")"
title="$(extract_field "Title")"
subject="$(extract_field "Subject")"
keywords="$(extract_field "Keywords")"

status=0

if [[ "$author" != "$EXPECTED_AUTHOR" ]]; then
  echo "Identity check failed: Author mismatch."
  echo "  expected: $EXPECTED_AUTHOR"
  echo "  actual:   ${author:-<empty>}"
  status=1
fi

if [[ "$title" != "$EXPECTED_TITLE" ]]; then
  echo "Identity check failed: Title mismatch."
  echo "  expected: $EXPECTED_TITLE"
  echo "  actual:   ${title:-<empty>}"
  status=1
fi

if [[ "$subject" != *"owner=${EXPECTED_OWNER_ID}"* ]] || [[ "$subject" != *"release=${EXPECTED_RELEASE_ID}"* ]]; then
  echo "Identity check failed: Subject missing owner/release markers."
  echo "  expected: owner=${EXPECTED_OWNER_ID} release=${EXPECTED_RELEASE_ID}"
  echo "  actual:   ${subject:-<empty>}"
  status=1
fi

if [[ "$keywords" != *"owner-name:${EXPECTED_AUTHOR}"* ]] \
   || [[ "$keywords" != *"owner-id:${EXPECTED_OWNER_ID}"* ]] \
   || [[ "$keywords" != *"release-id:${EXPECTED_RELEASE_ID}"* ]] \
   || [[ "$keywords" != *"build-id:"* ]]; then
  echo "Identity check failed: Keywords missing required identity tags."
  echo "  actual: ${keywords:-<empty>}"
  status=1
fi

if [[ "$status" -ne 0 ]]; then
  exit 1
fi

echo "PDF identity check passed."
