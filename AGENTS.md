# ZSF Informatik II — AGENTS.md

> AUTO-GENERATED — rules-hash:59ba7314bfe74777
>
> Quelle: `rules/*.md` (mit YAML-Frontmatter).
> Nicht direkt bearbeiten. Änderungen: `rules/*.md` editieren → `make sync-rules`.
> Drift-Check: `make check-rules`.

Kompiliertes Regelwerk für Codex / OpenAI Agents. Diese Datei ist eigenständig — sie enthält alle Projekt-Regeln für Tools, die nur `AGENTS.md` lesen.

## Source of Truth

Bei Konflikt zwischen dieser Datei und `rules/*.md` gewinnen die Quelldateien.

- `rules/00_meta.md`
- `rules/10_architecture.md`
- `rules/20_boxes.md`
- `rules/30_spacing.md`
- `rules/40_code.md`
- `rules/45_code_comments.md`
- `rules/50_chapters.md`
- `rules/60_workflow.md`
- `rules/70_github.md`

## Working Commands

- `make build`        — latexmk → `info2_fs2025_hliddal.pdf`
- `make check`        — full check (main, chapters, root, lint, rules)
- `make sync-rules`   — `rules/*.md` → alle Adapter regenerieren
- `make check-rules`  — Drift-Check über Hash-Stempel

## Operating Mode

- Wenn dies die einzige geladene KI-Regel-Datei ist, gelten die kompilierten Regeln unten als verbindlich.
- `alwaysApply: true`-Regeln sind Projekt-weit aktiv. `globs`-Scope-Regeln greifen nur bei passenden Pfaden.
- Niemals diese Datei direkt editieren — immer `rules/*.md` ändern und neu kompilieren.

## Rule Index

- `00_meta.md` — Project-wide — ZSF Informatik II — Projekt-Meta, Zweck, kritische Regeln (Sprache, Modularität, keine Inhaltsänderung ohne Befehl)
- `10_architecture.md` — Project-wide; besonders relevant für `main.tex`, `preamble.tex`, `chapters/**/*.tex`, `styles/**/*.tex` — Verzeichnis-Architektur, Verantwortlichkeiten von main/preamble/styles/chapters, Verbote in Kapiteln und Boxen
- `20_boxes.md` — Scoped; gilt bei Änderungen an `chapters/**/*.tex`, `styles/60_boxes.tex`, `styles/40_colors_structure.tex`, `styles/50_typography_semantics.tex` — Box-Umgebungen (contentbox, codebox, defbox, formulabox, statementbox, …) und Struktur-Makros (StartChapter, SubsectionBar, ZSFkeyword)
- `30_spacing.md` — Scoped; gilt bei Änderungen an `chapters/**/*.tex`, `styles/30_layout_spacing.tex`, `styles/70_document_settings.tex` — Spacing-Register (ZSFspace*), Gap-Makros (ZSFgap*), Math-Makros (C, R, F, laplace, …) — keine hardcodierten pt-Werte
- `40_code.md` — Scoped; gilt bei Änderungen an `chapters/**/*.tex`, `styles/65_code_style.tex` — Code-Listings (lstlisting + CodeExpert-Style), codebox-Verwendung, Inline-Code Konventionen
- `45_code_comments.md` — Scoped; gilt bei Änderungen an `chapters/**/*.tex`, `styles/67_code_comments.tex` — Smart Inline/Overflow Code-Kommentare: CodeLine, InlineComment, OverlineComment — automatische Platzierung rechts oder oben
- `50_chapters.md` — Scoped; gilt bei Änderungen an `chapters/**/*.tex`, `main.tex` — Kapitel-Mapping (00_titelbox bis 14_credits), Bilder (Images/, figures/, graphicspath), Antworten mit Kapitel-Referenzen
- `60_workflow.md` — Project-wide — Build-Targets (make build, check, sync-rules), Agent-Build-Pflicht nach jeder Änderung, Datei-Platzierung, Pre-commit
- `70_github.md` — Scoped; gilt bei Änderungen an `.github/**`, `Makefile`, `tests/**`, `styles/75_pdf_identity.tex`, `README.md` — Naming-Konventionen (Repo, PDF, Tags), GitHub Actions (CI Build, Release), PDF-Identity, Schwester-Projekt-Verhältnis

## Compiled Rules

### `00_meta.md`

- Quelle: `rules/00_meta.md`
- Scope: Project-wide
- Beschreibung: ZSF Informatik II — Projekt-Meta, Zweck, kritische Regeln (Sprache, Modularität, keine Inhaltsänderung ohne Befehl)
- Zuletzt aktualisiert: 2026-05-07 (loris)

LaTeX-Zusammenfassung Informatik II (D-MAVT FS2025). Inhalt: Python, Algorithmen, Datenstrukturen, ML, Neuronale Netze. A4 Querformat, 3 Spalten, 8pt.

**Zweck:** Prüfungsvorbereitung — wird direkt in der Prüfung verwendet. Schnelle Auffindbarkeit und klare Übersicht haben höchste Priorität.

**Eigenständiges Projekt.** Inspiriert von `ZSF_Analysis_2` und `ZSF_Physik_V4`, aber mit eigenen Konventionen: Document-Class `scrartcl` statt `extarticle`, `65_code_style.tex` für Code-Listings, eigene Bild-Pfade `Images/` + `figures/`. Kein Fork, keine Laufzeit-Abhängigkeit.

##### Kritische Regeln

- **Build-Befehl:** Nach jeder Änderung ausschliesslich `make build` verwenden — keine alternativen oder abgekürzten Kommandos (`latexmk`, `pdflatex`, …).
- **Inhalte niemals ändern, kürzen oder vereinfachen** ohne expliziten Befehl.
- Keine neuen Packages oder Makros ohne explizite Anfrage hinzufügen.
- Stil und Struktur (Boxtypen, Farben, Abstände) konsistent mit bestehendem System halten.
- **Good Practice:** sauberer, lesbarer LaTeX-Code; bestehende Makros und Umgebungen nutzen statt Inline-Workarounds.
- **Modularität ist Pflicht:** Abstände, Farben, Makros, Strukturen gehören in `styles/*.tex`. Hardcodierte Werte direkt in Box-Definitionen oder Kapiteldateien sind verboten.
- **Sprache:** Inhalte auf Deutsch. Technische Begriffe auf Englisch erlaubt (Stack, Heap, Pointer). LaTeX-Labels, Befehle, Dateinamen auf Englisch.

### `10_architecture.md`

- Quelle: `rules/10_architecture.md`
- Scope: Project-wide; besonders relevant für `main.tex`, `preamble.tex`, `chapters/**/*.tex`, `styles/**/*.tex`
- Beschreibung: Verzeichnis-Architektur, Verantwortlichkeiten von main/preamble/styles/chapters, Verbote in Kapiteln und Boxen
- Zuletzt aktualisiert: 2026-05-07 (loris)

##### Architektur

- `main.tex` — nur Document-Class + `\input{preamble}` + `\input` je Kapitel
- `preamble.tex` — nur Loader für `styles/*.tex` (kein eigener Inhalt, keine Makros)
- `chapters/00..14_*.tex` — reiner Inhalt, kein `\usepackage`, kein Layout-Tweaking
- `styles/00..75_*.tex` — je eine Verantwortung (Reihenfolge: `00→20→30→40→50→55→60→65→67→75→70`)
- `rules/*.md` — Quell-Wahrheit für alle KI-Regelwerke

###### Was wo hingehört

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

###### Verboten in Kapitel-Dateien

- Abstände: `\vspace`, `\hspace`, `\medskip`, `\bigskip`, `\smallskip` → stattdessen `\ZSFgapXS/S/M/L`
- Schrift direkt: `\scriptsize`, `\small`, `\large`, `\sffamily`, `\bfseries`, `\itshape`, `\textit`, `\textbf`, `\textsf`
- Layout-Hacks: `\noindent` (außerhalb definierter Umgebungen), `\penalty`, `\columnbreak`
- Rohe Tabellen: `\begin{tabular}` / `\begin{tabularx}` → stattdessen `\ZSFtable`, `\ZSFtableFlat`, `\ZSFtablePlain`
- Tabellenfarben direkt: `\rowcolor`, `\columncolor`, `\arrayrulecolor`
- `\usepackage` → alles in `styles/00_packages.tex`
- Mengensymbole direkt: `\mathbb{C}`, `\mathbb{R}` → stattdessen `\C`, `\R`

###### Verboten in Box-Definitionen (`styles/*.tex`)

- Hardcodierte `pt`/`em`/`mm`-Werte für Abstände → immer `\ZSFspace*`-Register
- Direkte Schriftbefehle → immer `\ZSFfont*`-Makros
- Direkte Farb-Tints wie `blue!15` → immer benannte `\colorlet`

### `20_boxes.md`

- Quelle: `rules/20_boxes.md`
- Scope: Scoped; gilt bei Änderungen an `chapters/**/*.tex`, `styles/60_boxes.tex`, `styles/40_colors_structure.tex`, `styles/50_typography_semantics.tex`
- Beschreibung: Box-Umgebungen (contentbox, codebox, defbox, formulabox, statementbox, …) und Struktur-Makros (StartChapter, SubsectionBar, ZSFkeyword)
- Zuletzt aktualisiert: 2026-05-08 (loris)

##### Box-Typen

| Umgebung | Verwendung |
|---|---|
| `\begin{contentbox}` | Generischer Inhalts-Container (Prosa, gemischter Inhalt) |
| `\begin{contentbox}[Titel]` | Mit farbigem Titelbalken |
| `\begin{contentbox}[Titel][Tag]` | Mit Titelbalken + rechts-ausgerichtetem Sprach-Tag |
| `\begin{codebox}` | Code-Snippets (zero-padding, für lstlisting) |
| `\begin{codebox}[Titel][Python]` | Code-Box mit Titelbalken und Sprach-Tag |
| `\begin{codeboxfirst}` | Split-Gruppe Anfang (oben geschlossen, unten offen) |
| `\begin{codeboxmid}` | Split-Gruppe Mitte (oben und unten offen) |
| `\begin{codeboxlast}` | Split-Gruppe Ende (oben offen, unten geschlossen) |
| `\begin{tablebox}[Titel]` | Tabellenbox mit farbigem Titel |
| `\begin{defbox}[Titel]` | Definition / hervorgehobene Faktenbox |
| `\begin{formulabox}` | Zentrierte Schlüsselformeln |
| `\begin{statementbox}[Titel]` | Aussage mit linkem Akzentstreifen |
| `\begin{procedure}[Titel]` | Schritt-für-Schritt-Verfahren mit `\ProcStep{title}{desc}` |
| `\begin{factlist}` | Faktenliste mit `\ZSFFact{lead}{desc}` |
| `\begin{propertylist}[Titel]` | Eigenschaftsliste |
| `sectionbox` | Alias für `contentbox` (backward-compat) |

##### Struktur-Makros

| Makro | Verwendung |
|---|---|
| `\StartChapter{Titel}` | Hauptkapitel mit auto-Nummerierung + Farbpalette |
| `\StartFrontChapter{Titel}` | Kapitel ohne Nummerierung |
| `\SubsectionBar{Titel}` | Nummerierter Abschnitt mit farbigem Balken |
| `\SubsectionBar*{Titel}` | Unnummerierter Abschnitt |
| `\ZSFTitleHeader{Titel}{Autor}` | Dokumenttitelbox (gleicher Stil wie Analysis/Physik) |
| `\ZSFkeyword{Begriff}` | Fachbegriff im Fliesstext (→ `\textbf`) |
| `\hl{text}` | Inline-Hervorhebung (underline + bold) |
| `\eqbox{formel}` | Inline-Formelbox mit farbigem Hintergrund |
| `\ZSFTitleTag{text}` | Rechts-ausgerichtetes Meta-Tag im Titelbalken |

##### Keyword-Hervorhebung

Fachbegriffe im Fliesstext **ausschliesslich** mit `\ZSFkeyword{...}` auszeichnen (definiert in `styles/50_typography_semantics.tex`). Kein manuelles `\textbf{...}` für Fachbegriffe — `\textbf` bleibt strukturellen Markierungen vorbehalten.

Code-Identifier inline: `\texttt{...}`. Begriffshervorhebung: `\hl{...}`.

### `30_spacing.md`

- Quelle: `rules/30_spacing.md`
- Scope: Scoped; gilt bei Änderungen an `chapters/**/*.tex`, `styles/30_layout_spacing.tex`, `styles/70_document_settings.tex`
- Beschreibung: Spacing-Register (ZSFspace*), Gap-Makros (ZSFgap*), Math-Makros (C, R, F, laplace, …) — keine hardcodierten pt-Werte
- Zuletzt aktualisiert: 2026-05-07 (loris)

##### Spacing-System

Alle Abstände zentral in `styles/30_layout_spacing.tex`. **Nie** hardcodierte `pt`-Werte in Kapiteln oder Box-Definitionen — immer Register oder Gap-Makros verwenden.

###### Spacing-Register

| Register | Wert | Verwendung |
|---|---|---|
| `\ZSFspaceXS` | 1pt | Minimaler Innenabstand |
| `\ZSFspaceS` | 3pt | Standard-Innenabstand Boxen |
| `\ZSFspaceM` | 6pt | Mittlerer Abstand |
| `\ZSFspaceL` | 9pt | Grosser Abstand, Kapitelbalken |
| `\ZSFspaceOuter` | 6pt | Aussenabstand Boxen |
| `\ZSFspaceSep` | 2.5pt | Trennlinien |
| `\ZSFbreakThreshold` | 3× baselineskip | Mindesthöhe für Spaltenbruch |
| `\ZSFtitleBarHeight` | 8.6pt | Titelbalken-Höhe |
| `\ZSFsubsectionBarBeforeSkip` | `\ZSFspaceL` | Abstand vor Abschnittsbalken |
| `\ZSFchapterBarAfterSkip` | 2pt | Abstand nach Kapitelbalken |
| `\ZSFstatementBarWidth` | 2pt | Breite linker Akzentstreifen |
| `\ZSFstatementLeftPad` | `\ZSFspaceM` | Innenabstand statement-Boxen |

###### Gap-Makros (in Kapiteln erlaubt)

| Makro | Verwendung |
|---|---|
| `\ZSFgapXS` | Minimaler Vertikalabstand (1pt) |
| `\ZSFgapS` | Kleiner Vertikalabstand (3pt) |
| `\ZSFgapM` | Mittlerer Vertikalabstand (6pt) |
| `\ZSFgapL` | Grosser Vertikalabstand (9pt) |
| `\ZSFSectionGap` | Abstand vor neuem Themenblock (= `\ZSFgapL`) |
| `\ZSFtabColGap` | Horizontaler Abstand in Tabellenspalten (1.5em) |
| `\ZSFmanualColumnBreak` | Manueller Spaltenumbruch (= `\columnbreak`) |

### `40_code.md`

- Quelle: `rules/40_code.md`
- Scope: Scoped; gilt bei Änderungen an `chapters/**/*.tex`, `styles/65_code_style.tex`
- Beschreibung: Code-Listings (lstlisting + CodeExpert-Style), codebox-Verwendung, Inline-Code Konventionen
- Zuletzt aktualisiert: 2026-05-07 (loris)

##### Code-Listings

Alle Code-Snippets immer mit `lstlisting` und dem `CodeExpert`-Style (definiert in `styles/65_code_style.tex`):

```latex
\begin{lstlisting}[style=CodeExpert]
def hello():
    return 42
\end{lstlisting}
```

Für Code mit Titelbalken:

```latex
\begin{codebox}[Quicksort][Python]
\begin{lstlisting}[style=CodeExpert]
def quicksort(arr): ...
\end{lstlisting}
\end{codebox}
```

Inline-Code: `\texttt{...}`. Begriffshervorhebung: `\hl{...}`. Kein `\textbf{...}` für Code-Identifier.

##### Code-Kommentare (Smart Inline/Overflow)

Für annotierte Code-Zeilen mit intelligenter Kommentar-Platzierung siehe **`rules/45_code_comments.md`**.

Kurz:
- `\CodeLine{code}[comment]` — Kommentar rechts (Standard) oder oben (bei Overflow)
- `\InlineComment{text}` — Immer rechts
- `\OverlineComment{text}` — Immer oben
- Nutze in `contentbox`/`defbox`, nicht in `lstlisting`

##### Math-Makros

Definiert in `styles/70_document_settings.tex`. Diese Makros statt direkter `\mathbb{}`-Notation verwenden:

| Makro | Output | Bedeutung |
|---|---|---|
| `\C` | $\mathbb{C}$ | Komplexe Zahlen |
| `\R` | $\mathbb{R}$ | Reelle Zahlen |
| `\F` | $\mathcal{F}$ | Fourier-Transformation |
| `\laplace{f}` | $\mathcal{L}[f]$ | Laplace-Transformation |
| `\unint` | $\int_{-\infty}^\infty$ | Uneigentliches Integral |
| `\imag` | $\mathrm{i}$ | Imaginäre Einheit |
| `\infin` | $\mathrm{d}$ | Differentialoperator |
| `\Arg{z}` | $\mathrm{Arg}(z)$ | Hauptargument |
| `\Log{z}` | $\mathrm{Log}(z)$ | Hauptlogarithmus |
| `\Res{f}` | $\mathrm{Res}(f)$ | Residuum |

### `45_code_comments.md`

- Quelle: `rules/45_code_comments.md`
- Scope: Scoped; gilt bei Änderungen an `chapters/**/*.tex`, `styles/67_code_comments.tex`
- Beschreibung: Smart Inline/Overflow Code-Kommentare: CodeLine, InlineComment, OverlineComment — automatische Platzierung rechts oder oben
- Zuletzt aktualisiert: 2026-05-07 (loris)

#### Code-Kommentar-System (Smart Inline/Overflow)

**Zweck:** Intelligente Positionierung von Kommentaren im Code — standardmässig rechts vom Code, automatisch in eigener Zeile davor bei Platzmangel.

**Implementierung:** `styles/67_code_comments.tex` (geladen nach `65_code_style`)

**Verantwortungsteilung:**

| Aspekt | Quelle |
|---|---|
| Längen (`\ZSFcodeCommentMaxWidth/Threshold/Gap`, Defaults) | `styles/30_layout_spacing.tex` |
| Schrift + Farbe (`\ZSFfontCodeComment`) | `styles/50_typography_semantics.tex` |
| Farb-Definition `ce_green` | `styles/40_colors_structure.tex` |
| Render-Logik | `styles/67_code_comments.tex` |

##### Überblick

| Makro | Verhalten | Nutzung |
|---|---|---|
| `\CodeLine{code}[comment]` | Auto: rechts wenn `Code+Kommentar+Gap ≤ Threshold`, sonst oben | Standard für annotierte Code-Zeilen |
| `\CodeLine{code}` | Nur Code (ohne Kommentar) | Code-Zeile ohne Annotation |
| `\InlineComment{text}` | Kommentar rechts, kein Auto-Layout | Manuelle Rechts-Positionierung |
| `\OverlineComment{text}` | Kommentar in eigener Zeile, dann Zeilenumbruch | Manuelle Oben-Positionierung |
| `\SetCodeCommentThreshold{length}` | Schwelle setzen, persistent bis Reset/Gruppen-Ende | Spezial-Layouts (z.B. enge Boxen) |
| `\ResetCodeCommentThreshold` | Schwelle und MaxWidth auf Default zurücksetzen | Nach Custom-Anpassung |

##### Standard-Verhalten: `\CodeLine`

Misst Code- und Kommentar-Breite und entscheidet:

- **Wenn `\wd{code} + \wd{comment} + \ZSFcodeCommentGap ≤ \ZSFcodeCommentThreshold`:** Kommentar rechts, getrennt durch `\ZSFcodeCommentGap` (= `\ZSFspaceM`, 6pt).
- **Sonst:** Kommentar in eigener Zeile davor, dann Code in der Folgezeile (`\newline`).

**Default-Schwelle:** `\columnwidth` — wird zur Render-Zeit ausgewertet (nicht beim Laden der Preamble), sodass der korrekte Spaltenbreite-Wert aus der aktiven `multicols`-Umgebung greift. Technisch: `\ZSFcodeCommentThresholdDefault = \maxdimen`; in `67_code_comments.tex` wird zur Render-Zeit `effectiveThreshold = min(\ZSFcodeCommentThreshold, \columnwidth)` berechnet. Kann per `\SetCodeCommentThreshold` auf einen kleineren Wert gesetzt werden (z.B. für enge Boxen).

###### Beispiele

```latex
% Einfacher Kommentar (passt rechts)
\CodeLine{x = 5}[Initialisierung]

% Langer Kommentar (Overflow → oben)
\CodeLine{for i in range(n):}[Schleife über alle Elemente iterieren]

% Ohne Kommentar
\CodeLine{return result}
```

###### Im Kontext (contentbox + ttfamily-Block)

Aufrufer-Konvention: jede Code-Zeile endet mit `\\` (Zeilenumbruch im
ttfamily-Block); `\CodeLine` selbst fügt **kein** abschliessendes `\\` an,
damit der Aufruf `\CodeLine{…}[…]\\` symmetrisch zu `\CodeLine{…}\\` bleibt.

```latex
\begin{contentbox}[Code mit Kommentaren]
\begin{ttfamily}
\CodeLine{def quicksort(arr):}[Eingang: unsortiertes Array]\\
\CodeLine{  if len(arr) <= 1:}[Basis-Fall]\\
\CodeLine{    return arr}[Bereits sortiert]\\
\CodeLine{  pivot = arr[0]}[Wähle erstes Element]\\
\CodeLine{  left = [...]}[Elemente < pivot]\\
\end{ttfamily}
\end{contentbox}
```

##### Manuelle Varianten

###### `\InlineComment{text}` — immer rechts

Erwartet, dass Code im selben Zeilenkontext bereits ausgegeben wurde; hängt nur den Kommentar mit `\ZSFcodeCommentGap` an.

```latex
\CodeLine{x = 5}\InlineComment{Initialisierung}
```

###### `\OverlineComment{text}` — immer oben

Gibt den Kommentar in eigener Zeile aus und beendet sie mit `\newline`.

**Nur verwenden wenn:** der Kommentar eine ganze Gruppe von Code-Zeilen beschreibt, oder mehrere `\OverlineComment` für eine Zeile nötig sind. Für einzelne Zeilen immer `\CodeLine{code}[comment]` bevorzugen — das Auto-Layout entscheidet dann selbst ob rechts oder oben.

**Anti-Pattern (falsch):**
```latex
\OverlineComment{Gesamtspeicher in Bytes}
\CodeLine{a.nbytes}\\
```
**Korrekt:**
```latex
\CodeLine{a.nbytes}[Gesamtspeicher in Bytes]\\
```

**Legitimer Einsatz** (ein Kommentar für mehrere Zeilen):
```latex
\OverlineComment{Basisfälle: F(0) = F(1) = 1}
\CodeLine{F[0] = 1}\\
\CodeLine{F[1] = 1}\\
```

##### Anpassung für spezielle Layouts

`\SetCodeCommentThreshold` greift **persistent** bis zum nächsten `\ResetCodeCommentThreshold` oder zum Gruppen-Ende:

```latex
\begin{contentbox}[Kompakter Code]
\SetCodeCommentThreshold{1.8cm}  % Kleinere Schwelle in dieser Box
\CodeLine{x = 5}[Kurzer Kommentar]
\CodeLine{for i in range(n):}[Längerer Kommentar wird oben]
\ResetCodeCommentThreshold      % Optional, end-of-group setzt sowieso zurueck
\end{contentbox}
```

##### Technische Details

- **Schrift + Farbe:** Kommentare werden über `\ZSFfontCodeComment` gerendert (`\ttfamily\color{ce_green}`) — gleiche Schriftgrösse wie der Code, damit Code und Kommentar auf einer Zeile optisch ausgerichtet bleiben. Niemals inline `\textcolor{ce_green}` o.ä. — Style gehört nach `50_typography_semantics.tex`.
- **`#`-Präfix automatisch:** `\CodeLine`, `\InlineComment`, `\OverlineComment` setzen ein `# ` (Python-Kommentar-Stil) vor den übergebenen Text. Im Quelltext also `\CodeLine{x = 5}[Initialisierung]` schreiben — *nicht* `[# Initialisierung]`.
- **Verbatim-Rendering:** Code-Argument wird via `\detokenize` cat-12-isiert, sodass `#`, `_`, `%`, `&` literal erscheinen. Optional-Arg-Parsing ist davon nicht betroffen, weil das `[…]` nach dem schliessenden `}` des Code-Arguments steht.
- **Keine Doppelumbrüche:** `\CodeLine` fügt kein abschliessendes `\\` an. `\OverlineComment` beendet selbst mit `\newline`, daher folgt im Aufrufer keine zusätzliche `\\`.
- **Inkompatibel mit `lstlisting`:** `\CodeLine` funktioniert nur ausserhalb von `lstlisting`. Für native Listings: native Python-Kommentare (`# …`) verwenden.

##### Workflow

1. **Einfache Code-Schnipsel:** Native Python-Kommentare in `lstlisting`
   ```latex
   \begin{codebox}[Quicksort][Python]
   \begin{lstlisting}[style=CodeExpert]
   def quicksort(arr):
       # Initialisierung
       if len(arr) <= 1:
           return arr
   \end{lstlisting}
   \end{codebox}
   ```

2. **Annotierte Code-Zeilen:** `\CodeLine` in `contentbox`
   ```latex
   \begin{contentbox}[Algorithmus mit Erklärung]
   \begin{ttfamily}
   \CodeLine{def quicksort(arr):}[Funktion definieren]\\
   \CodeLine{  if len(arr) <= 1:}[Basis-Fall: 0 oder 1 Elemente]\\
   \end{ttfamily}
   \end{contentbox}
   ```

3. **Gemischte Layouts:** Kombiniere beide
   ```latex
   \begin{contentbox}[Hybrid-Darstellung]
   Native Implementierung:
   \begin{lstlisting}[style=CodeExpert]
   def quicksort(arr):
       return arr  # Vereinfacht
   \end{lstlisting}

   Mit Erklärung:\\
   \begin{ttfamily}
   \CodeLine{def quicksort(arr):}[Funktion definieren]\\
   \end{ttfamily}
   \end{contentbox}
   ```

##### Register & Macros (intern → extern)

| Symbol | Definiert in | Zweck |
|---|---|---|
| `\ZSFcodeCommentMaxWidth` | `30_layout_spacing.tex` | "Lebende" max. Breite des rechts-stehenden Kommentars |
| `\ZSFcodeCommentThreshold` | `30_layout_spacing.tex` | "Lebende" Overflow-Schwelle |
| `\ZSFcodeCommentMaxWidthDefault` | `30_layout_spacing.tex` | Immutabler Default für Reset |
| `\ZSFcodeCommentThresholdDefault` | `30_layout_spacing.tex` | Immutabler Default für Reset |
| `\ZSFcodeCommentGap` | `30_layout_spacing.tex` | Mindest-Gap zwischen Code und Kommentar (`= \ZSFspaceM`) |
| `\ZSFfontCodeComment` | `50_typography_semantics.tex` | Schrift + Farbe für Kommentare |

##### Regeln für Autoren

- **Keine hardcodierten `pt`/`em`/`cm`-Werte** in `\CodeLine`-Aufrufen oder in `styles/67_code_comments.tex` selbst. Längen kommen aus `30_layout_spacing.tex`, Stil aus `50_typography_semantics.tex`.
- **Custom-Schwelle:** `\SetCodeCommentThreshold{…}` statt manuellem `\setlength`.
- **Comments knapp halten** (1–2 Worte ideal; längere Erklärungen → Prosa neben dem Code).
- **Standard ist `\CodeLine{code}[comment]`:** Auto-Layout bestimmt selbst ob rechts oder oben. `\OverlineComment` nur für Gruppenheader (ein Kommentar über mehrere Zeilen) oder wenn zwei Kommentare für eine Zeile nötig sind.

### `50_chapters.md`

- Quelle: `rules/50_chapters.md`
- Scope: Scoped; gilt bei Änderungen an `chapters/**/*.tex`, `main.tex`
- Beschreibung: Kapitel-Mapping (00_titelbox bis 14_credits), Bilder (Images/, figures/, graphicspath), Antworten mit Kapitel-Referenzen
- Zuletzt aktualisiert: 2026-05-07 (loris)

##### Kapitelstruktur

| Datei | Inhalt |
|---|---|
| `chapters/00_titelbox.tex` | Titelbox (`\ZSFTitleHeader`) |
| `chapters/01_python-syntax.tex` | Python-Grundlagen, Syntax |
| `chapters/02_classes.tex` | OOP, Klassen, Vererbung |
| `chapters/03_dynamische-programmierung.tex` | Dynamische Programmierung |
| `chapters/04_algorithmen.tex` | Sortier- und Suchalgorithmen |
| `chapters/05_asymptotische-laufzeit.tex` | Landau-Notation, Komplexitätsklassen |
| `chapters/06_numpy.tex` | NumPy |
| `chapters/07_pandas.tex` | Pandas |
| `chapters/08_ml.tex` | Machine Learning |
| `chapters/09_datenstrukturen.tex` | Datenstrukturen (Stack, Queue, Heap, …) |
| `chapters/10_neuronale-netzwerke.tex` | Neuronale Netze |
| `chapters/11_unsupervised.tex` | Unüberwachtes Lernen |
| `chapters/12_code-examples.tex` | Code-Beispiele |
| `chapters/13_dp-quiz.tex` | DP-Quiz |
| `chapters/14_credits.tex` | Credits |

Neue Kapitel nur nach Rücksprache. Neue Datei `chapters/XX_name.tex` anlegen, dann `\input` in `main.tex` ergänzen.

##### Bilder

- Primärer Ordner: `Images/`
- Thematisch gegliedert: `figures/algorithms/`, `figures/data-structures/`, `figures/neural-networks/`
- `\graphicspath` in `styles/70_document_settings.tex` kennt alle Ordner → `\includegraphics{name}` ohne Pfad reicht
- Keine neuen Top-Level-Bildordner anlegen

##### Referenzen in Antworten

Inhalte immer mit genauem Kapitel referenzieren — z.B. `chapters/04_algorithmen.tex` (Thema "Quicksort Average Case"). Bei ML: `chapters/08_ml.tex` ("Logistic Regression").

### `60_workflow.md`

- Quelle: `rules/60_workflow.md`
- Scope: Project-wide
- Beschreibung: Build-Targets (make build, check, sync-rules), Agent-Build-Pflicht nach jeder Änderung, Datei-Platzierung, Pre-commit
- Zuletzt aktualisiert: 2026-05-08 (loris)

##### Workflow

```bash
make build                  # latexmk → build/main.pdf → info2_fs2025_hliddal.pdf
make check                  # check-main-full + check-chapters + check-root-clean + lint + check-rule-authorship + check-rules
make sync-rules             # rules/*.md → CLAUDE.md, AGENTS.md, .github/copilot-instructions.md, .cursor/rules/*.mdc
make check-rules            # Drift-Check (Hash-Stempel) gegen rules/*.md
make check-rule-authorship  # Pflicht-Frontmatter (description, alwaysApply, lastUpdatedAt) prüfen
make release-proof          # SHA256 von build/main.pdf → build/main.pdf.sha256
make clean                  # build/ + aux entfernen
```

Der Compiler liegt in `tools/sync-agent-rules.mjs` (Node 18+). Quellen sind `rules/*.md` mit YAML-Frontmatter (`description`, `globs`, `alwaysApply`, `lastUpdatedBy`, `lastUpdatedAt`).

###### Agent-Build-Pflicht

Nach **jeder** inhaltlichen oder Layout-Änderung sofort den sauberen Build-Command `make build` ausführen, damit `info2_fs2025_hliddal.pdf` aktuell bleibt und Fehler früh sichtbar werden. Der Build-Befehl ist dabei immer genau dieser Command; keine alternativen oder abgekürzten Build-Kommandos verwenden. Agent-Edits triggern LaTeX Workshop Auto-Build nicht — manuell bauen ist Pflicht.

###### Datei-Platzierung

**Root ist tabu für neue Dateien.** Erlaubt im Root:

| Erlaubt | Typ |
|---|---|
| `main.tex`, `preamble.tex`, `Makefile` | Kerndateien |
| `.gitignore`, `.pre-commit-config.yaml` | Config |
| `CLAUDE.md`, `AGENTS.md`, `MODULAR_SYSTEM.md`, `README.md` | Doku (KI-Adapter sind auto-generiert) |
| `info2_fs2025_hliddal.pdf` (+ `.synctex.gz`) | Output |

Alles andere gehört in:
- `chapters/` — Inhaltsdateien
- `styles/` — Style-Module
- `tests/` — Check-Skripte
- `scripts/` — Helfer-Skripte (Bash/Python, z.B. Graphics-Optimierung, Cross-Project-Infra-Sync)
- `tools/` — Node-basierte Tools (Rule-Compiler, Authorship-Check)
- `rules/` — KI-Regelquellen (Quell-Wahrheit, mit Frontmatter)
- `Images/`, `figures/` — Bilder
- `_scratch/` — temporäres (gitignored)

`tests/check_root_clean.sh` blockt Verstösse (läuft auch via pre-commit).

###### Pre-commit

`tests/check_root_clean.sh` läuft bei jedem Commit. Whitelist in der Datei pflegen, nie umgehen.

### `70_github.md`

- Quelle: `rules/70_github.md`
- Scope: Scoped; gilt bei Änderungen an `.github/**`, `Makefile`, `tests/**`, `styles/75_pdf_identity.tex`, `README.md`
- Beschreibung: Naming-Konventionen (Repo, PDF, Tags), GitHub Actions (CI Build, Release), PDF-Identity, Schwester-Projekt-Verhältnis
- Zuletzt aktualisiert: 2026-05-08 (loris)

##### GitHub & Release

###### Namenskonventionen

- **Repository:** `eth-info2-zsf-fs2025-hliddal` (Muster: `eth-<fach>-zsf-<semester>-hliddal`)
- **PDF:** `info2_fs2025_hliddal.pdf` (Muster: `fach_semester_hliddal.pdf`)
- **Semesterformat:** `fsYYYY` oder `hsYYYY`
- **Release-Tags:** Semantic Versioning `vMAJOR.MINOR.PATCH`

###### GitHub Actions

- **Workflow `CI Build`** (push/PR auf `main`): `make check` + `make build`, PDF als Artifact
- **Workflow `Release PDF`** (push auf Tag `v*`): `make check` + `make build` + `make release-proof`; GitHub Release mit `info2_fs2025_hliddal.pdf` + `build/main.pdf.sha256`

###### Agent-Regeln für GitHub-Änderungen

Änderungen an Naming-Patterns immer konsistent in:
- `Makefile`
- `tests/check_root_clean.sh`
- `styles/75_pdf_identity.tex`
- `README.md`
- `.github/workflows/*.yml`
- `rules/70_github.md` (diese Datei)

Release-Flow nie auf manuelle Uploads zurückbauen.

###### Authentizität / PDF-Identity

`styles/75_pdf_identity.tex` ist Single Source of Truth für:
- `\ZSFOwnerNameASCII` (PDF-Author)
- `\ZSFOwnerID`, `\ZSFReleaseID`, `\ZSFBuildID`
- Title, Subject, Keywords (via `hypersetup`)

`tests/check_pdf_identity.sh` prüft Metadaten nach Build (Teil von `make check`).

###### Verhältnis zu Schwester-Projekten

`ZSF_Analysis_2` und `ZSF_Physik_V4` sind ähnlich strukturiert (modulare Styles, `chapters/`, `tests/`). Infrastruktur-Dateien (`.gitattributes`, `.latexindent.yaml`) bei Bedarf manuell synchronisieren. **Inhaltliche Regeln** (`rules/*.md`, `MODULAR_SYSTEM.md`) sind projekt-spezifisch — nicht auto-synced.

