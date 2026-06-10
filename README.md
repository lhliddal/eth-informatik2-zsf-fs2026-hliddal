# ZSF Informatik II — D-MAVT FS2026

Zusammenfassung Informatik II (Python, Algorithmen, Datenstrukturen, ML, Neuronale Netze).

## Build

```bash
make build      # PDF nach info2_fs2026_hliddal.pdf
make check      # strukturelle Checks + chktex
make format     # latexindent über alle .tex
make clean      # build/ aufräumen
```

## Architektur

ZSF_Informatik2 ist ein **eigenständiges Projekt**. Das modulare Setup ist von den Schwesterprojekten [`ZSF_Physik_V3`](../ZSF_Physik_V3) und [`ZSF_Analysis_2`](../ZSF_Analysis_2) als Good-Practice-Vorlage **inspiriert**, aber Info hat eigene Konventionen, eigene Style-Module (z.B. `65_code_style.tex` für Python-Listings) und eine andere Document-Class (`scrartcl` statt `extarticle`). Kein Fork, keine Code-Duplikation zur Laufzeit.

- `main.tex` — Einstiegspunkt (Document-Class + Chapter-Inputs)
- `preamble.tex` — Loader für Style-Module
- `styles/` — Layout, Farben, Boxen, Code-Listings (00..75)
- `chapters/` — Inhaltsdateien (00..14)
- `tests/` — strukturelle Checks
- `scripts/` — Helfer (Bild-Optimierung, Agent-Sync)
- `Images/`, `figures/` — Bilddateien

Details siehe [`MODULAR_SYSTEM.md`](MODULAR_SYSTEM.md).

## Lizenz

Persönliche ETH-Prüfungs-Zusammenfassung. Verwendung auf eigenes Risiko.
