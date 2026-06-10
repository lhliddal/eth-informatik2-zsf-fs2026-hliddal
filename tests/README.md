# tests/

Strukturelle Checks für ZSF Informatik II.

- `check_main_full.sh` — verifiziert, dass alle Chapter-Inputs in `main.tex` aktiv sind
- `check_root_clean.sh` — blockt unerwartete Dateien im Projekt-Root
- `run_test.sh` — ruft alle Checks sequentiell auf

Aufruf via `make check` (siehe `../Makefile`).
