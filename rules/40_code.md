---
description: "Code-Listings (lstlisting + CodeExpert-Style), codebox-Verwendung, Inline-Code Konventionen"
globs:
  - "chapters/**/*.tex"
  - "styles/65_code_style.tex"
alwaysApply: false
decisionOwner: ai
decisionStatus: final
lastUpdatedBy: claude
lastUpdatedAt: 2026-06-11
---

## Code-Listings

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

## Code-Kommentare (Smart Inline/Overflow)

Für annotierte Code-Zeilen mit intelligenter Kommentar-Platzierung siehe **`rules/45_code_comments.md`**.

Kurz:
- `\CodeLine{code}[comment]` — Kommentar rechts (Standard) oder oben (bei Overflow)
- `\InlineComment{text}` — Immer rechts
- `\OverlineComment{text}` — Immer oben
- Nutze in `contentbox`/`defbox`, nicht in `lstlisting`

## Overfull-Fixes (Katalog sicherer Operationen)

Bei `Overfull \hbox`-Warnungen nur bedeutungserhaltende Fixes:

1. **Lange Python-Zeilen in `lstlisting`:** innerhalb von Klammern oder nach Kommas umbrechen (implizite Continuation — semantisch identisch). Nie in String-Literalen brechen.
2. **Zu breite `\CodeLine`-Paare:** lokal `\SetCodeCommentThreshold{...}`/`\ResetCodeCommentThreshold` (Kommentar wandert nach oben) oder Code-Zeile wie in 1 brechen. Kommentar-Wortlaut nicht kürzen.
3. **Breite Tabellen:** Spaltenfaktoren in `ZSFtable*` anpassen (`Y{..}`-Proportionen); keine Spalte entfernen, nichts abkürzen.
4. **Lange Boxen / schlechte Spaltenumbrüche:** Box an semantischer Grenze teilen; für Code `codeboxfirst`/`codeboxmid`/`codeboxlast`.
5. Rest-Overfulls ≤2pt sind akzeptabel. Kein Micro-Spacing in Kapiteln (verboten per `30_spacing`).

## Math-Makros

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
