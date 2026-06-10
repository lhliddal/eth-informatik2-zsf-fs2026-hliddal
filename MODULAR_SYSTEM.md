# Modulares System — ZSF Informatik II

Ziel: Inhalt, Layout und Tooling sauber getrennt.

## Eigenständigkeit

Dieses Projekt ist **unabhängig** von den Schwesterprojekten `ZSF_Analysis_2` und `ZSF_Physik_V3`. Es übernimmt deren modulare Architektur als Good-Practice-Vorlage (Trennung `chapters/` ↔ `styles/`, Loader-Preamble, atomare Style-Module), implementiert sie aber Info-spezifisch:

- **Eigene Document-Class:** `scrartcl` mit `landscape` (Schwesterprojekte: `extarticle`).
- **Eigenes Style-Modul `65_code_style.tex`** für Python-`lstlisting` mit CodeExpert-Palette — existiert in keinem anderen Projekt.
- **Reduzierter Style-Modul-Satz:** Info hat keine `10_math.tex` / `55_readability.tex` (nicht benötigt).
- **Eigene Bild-Konvention:** `Images/` + thematisch gegliederte `figures/{algorithms,...}/` (Schwesterprojekte: `graphics/`).
- **Eigene Inhaltsdomäne:** Python, Algorithmen, ML — kein Mathe-Theorem-System, keine Physik-Boxen.

Synchronisiert wird zwischen den drei Projekten über `scripts/sync_agent_rules.py` ausschließlich projekt-unabhängige **Infrastruktur** (`.gitattributes`, `.latexindent.yaml`). Inhaltliche Regeln (`rules/*.md` und alle daraus generierten Adapter `CLAUDE.md`, `AGENTS.md`, `.github/copilot-instructions.md`, `.cursor/rules/*.mdc`) bleiben pro Projekt eigenständig — Compiler in `tools/sync-agent-rules.mjs`.

## Datei-Layout

```
ZSF_Informatik2/
├── main.tex                  # nur \input-Calls + multicols
├── preamble.tex              # nur \input{styles/*}
├── Makefile                  # build / check / format / clean
├── chapters/                 # 00_titelbox..14_credits
├── styles/                   # modulare LaTeX-Style-Module
│   ├── 00_packages.tex
│   ├── 20_tables.tex         # \ZSFtable, \ZSFheaderRow, \ZSFhead
│   ├── 30_layout_spacing.tex # \ZSFgapXS/S/M/L
│   ├── 40_colors_structure.tex
│   ├── 50_typography_semantics.tex
│   ├── 60_boxes.tex          # sectionbox, smallbox, bigbox, \hl, \eqbox
│   ├── 65_code_style.tex     # CodeExpert-Listing-Style (Info-spezifisch)
│   ├── 70_document_settings.tex
│   └── 75_pdf_identity.tex   # PDF-Metadaten + Owner-Marker
├── tests/                    # check_main_full, check_root_clean, run_test
├── scripts/                  # optimize_graphics, sync_agent_rules (cross-project infra)
├── tools/                    # sync-agent-rules.mjs, check-rule-authorship.mjs (Node)
├── rules/                    # KI-Regelquellen (Markdown + YAML-Frontmatter)
├── Images/                   # primärer Bild-Ordner
└── figures/{algorithms,data-structures,neural-networks}
```

## Regeln

1. **Root ist tabu für neue Dateien** — siehe `tests/check_root_clean.sh`.
2. **Kein direktes `\vspace`/`\hspace` in Chapters** — nutze `\ZSFgapXS/S/M/L` aus `30_layout_spacing.tex`.
3. **Tabellen nur via `\ZSFtable`/`\ZSFtableFlat`** — keine rohen `tabular`/`tabularx`.
4. **Code-Listings via `lstlisting` mit `style=CodeExpert`** (definiert in `65_code_style.tex`).
5. **Preamble.tex nur für `\input{styles/*}`** — keine Macros darin.

## Style-Modul-Reihenfolge (preamble)

`00 → 20 → 30 → 40 → 50 → 60 → 65 → 75 → 70`
(75_pdf_identity vor 70_document_settings, da Letzteres `secnumdepth` setzt das nach hyperref kommen muss.)

## Code-Listings

```latex
\begin{lstlisting}[style=CodeExpert]
def hello():
    return 42
\end{lstlisting}
```

Style ist definiert in `styles/65_code_style.tex` mit Python-Keywords, ColorExpert-Farbpalette und Unicode-Replacements (→, ä, ö etc.).

## Bild-Pfade

`graphicspath` ist definiert in `styles/70_document_settings.tex` und umfasst `Images/` plus drei Unter-`figures/`-Ordner (algorithms, data-structures, neural-networks). Verwaiste Bilder können via Stage-3-Skript automatisch nach `_orphan_images/` verschoben werden.

## Agent-Sync

`scripts/sync_agent_rules.py` synchronisiert ausschliesslich projekt-unabhängige **Infrastruktur** (`.gitattributes`, `.latexindent.yaml`) zwischen den drei Projekten. Inhaltliche Regeln in `rules/*.md` und alle generierten KI-Adapter (`CLAUDE.md`, `AGENTS.md`, `.github/copilot-instructions.md`, `.cursor/rules/*.mdc`) bleiben pro Projekt eigenständig und werden bewusst NICHT cross-projekt synchronisiert. Innerhalb eines Projekts werden die Adapter via `tools/sync-agent-rules.mjs` aus `rules/*.md` regeneriert (`make sync-rules`). Cross-Project-Aufruf: `python3 scripts/sync_agent_rules.py --from ../ZSF_Physik_V3 [--dry-run]`.

## EHA — Exam Hliddal Addition

Inhalte, die nachträglich als Lernhilfe ergänzt wurden und **nicht** Teil des ursprünglichen Kursmaterials sind, werden mit dem Tag `[EHA]` gekennzeichnet.

**Zweck:** Grosse, optionale Ergänzungen schnell auffindbar und in einem Schritt entfernbar halten.

### Konvention

| Ort | Markierung |
|---|---|
| LaTeX-Quelle (Kommentar) | `% [EHA] Exam Hliddal Addition` — direkt vor dem Block |
| LaTeX-Quelle (Titel) | `[EHA]` im `\subsection{}`- oder `\subsubsection{}`-Titel |
| PDF (sichtbar) | `[EHA]` erscheint im farbigen Heading-Banner |

### Suchen und Entfernen

```bash
# Alle EHA-Blöcke in der Quelle finden
grep -rn '\[EHA\]' chapters/

# Einen ganzen EHA-Abschnitt entfernen:
# Alles zwischen '% [EHA] Exam Hliddal Addition' und dem nächsten
# gleichrangigen Abschnitt ('% ===' oder \subsection) löschen.
```

### Aktuell markierte EHA-Bereiche

- `chapters/03_dynamische-programmierung.tex` — Mustererkennung-Tabelle, Kapazitäts-DP, Zwei-Index-DP, Intervall-DP, House-Robber-Beispiel

## Build-Pflicht für KI

Nach **jeder** inhaltlichen Änderung sofort `make build`, damit `info2_fs2025_hliddal.pdf` aktuell bleibt und Fehler früh sichtbar sind.
