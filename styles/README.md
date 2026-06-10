# styles/

Modulare LaTeX-Style-Module. Reihenfolge in `preamble.tex` ist wichtig.

| Datei | Rolle |
|---|---|
| `00_packages.tex` | `\usepackage`-Block |
| `20_tables.tex` | `\ZSFtable`, `\ZSFheaderRow`, `\ZSFhead`, Y/Z/Q-Spaltentypen |
| `30_layout_spacing.tex` | parskip, columnsep, `\ZSFspace*`, `\ZSFgap*` |
| `40_colors_structure.tex` | Farb-Definitionen (title, subtitle, CodeExpert-Palette) |
| `50_typography_semantics.tex` | `\sectionlinesformat` (farbige Heading-Bars) |
| `60_boxes.tex` | sectionbox, smallbox, bigbox, `\hl`, `\eqbox` |
| `65_code_style.tex` | CodeExpert lstlisting style (Info-spezifisch) |
| `70_document_settings.tex` | Unicode-Fixes, Math-Macros, graphicspath, secnumdepth |
| `75_pdf_identity.tex` | PDF-Metadaten + Owner-Marker (hyperref/hyperxmp) |

## Regeln

- Kapitel **nie** `\usepackage` aufrufen — alles in `00_packages.tex`.
- Neue Spacing-Macros → `30_layout_spacing.tex`.
- Neue Farben → `40_colors_structure.tex`.
- Neue Boxen → `60_boxes.tex`.
- Code-Style-Tweaks → `65_code_style.tex`.
