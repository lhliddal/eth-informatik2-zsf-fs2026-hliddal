---
description: "Verzeichnis-Architektur, Verantwortlichkeiten von main/preamble/styles/chapters, Verbote in Kapiteln und Boxen"
globs:
  - "main.tex"
  - "preamble.tex"
  - "chapters/**/*.tex"
  - "styles/**/*.tex"
alwaysApply: true
decisionOwner: ai
decisionStatus: final
lastUpdatedBy: loris
lastUpdatedAt: 2026-05-07
---

## Architektur

- `main.tex` — nur Document-Class + `\input{preamble}` + `\input` je Kapitel
- `preamble.tex` — nur Loader für `styles/*.tex` (kein eigener Inhalt, keine Makros)
- `chapters/00..14_*.tex` — reiner Inhalt, kein `\usepackage`, kein Layout-Tweaking
- `styles/00..75_*.tex` — je eine Verantwortung (Reihenfolge: `00→20→30→40→50→55→60→65→67→75→70`)
- `rules/*.md` — Quell-Wahrheit für alle KI-Regelwerke

### Was wo hingehört

| Kategorie | Ort |
|---|---|
| Pakete | `styles/00_packages.tex` |
| Tabellen-Environments | `styles/20_tables.tex` |
| Abstände, Layout, multicols | `styles/30_layout_spacing.tex` |
| Farben, Kapitel-Paletten | `styles/40_colors_structure.tex` |
| Schrift / Semantik | `styles/50_typography_semantics.tex` |
| Lesbarkeit (Hyphenation/Penalties) | `styles/55_readability.tex` |
| Box-Umgebungen (tcolorbox) | `styles/60_boxes.tex` |
| Code-Listings (lstlisting, CodeExpert) | `styles/65_code_style.tex` |
| Code-Kommentare (Smart Inline/Overflow) | `styles/67_code_comments.tex` |
| Unicode-Fixes, Math-Makros, graphicspath | `styles/70_document_settings.tex` |
| PDF-Identity / Owner-Marker | `styles/75_pdf_identity.tex` |
| Inhalte | `chapters/XX_*.tex` |
| KI-Regelwerke (Quell-Wahrheit) | `rules/*.md` |

### Verboten in Kapitel-Dateien

- Abstände: `\vspace`, `\hspace`, `\medskip`, `\bigskip`, `\smallskip` → stattdessen `\ZSFgapXS/S/M/L`
- Schrift direkt: `\scriptsize`, `\small`, `\large`, `\sffamily`, `\bfseries`, `\itshape`, `\textit`, `\textbf`, `\textsf`
- Layout-Hacks: `\noindent` (außerhalb definierter Umgebungen), `\penalty`, `\columnbreak`
- Rohe Tabellen: `\begin{tabular}` / `\begin{tabularx}` → stattdessen `\ZSFtable`, `\ZSFtableFlat`, `\ZSFtablePlain`
- Tabellenfarben direkt: `\rowcolor`, `\columncolor`, `\arrayrulecolor`
- `\usepackage` → alles in `styles/00_packages.tex`
- Mengensymbole direkt: `\mathbb{C}`, `\mathbb{R}` → stattdessen `\C`, `\R`

### Verboten in Box-Definitionen (`styles/*.tex`)

- Hardcodierte `pt`/`em`/`mm`-Werte für Abstände → immer `\ZSFspace*`-Register
- Direkte Schriftbefehle → immer `\ZSFfont*`-Makros
- Direkte Farb-Tints wie `blue!15` → immer benannte `\colorlet`
