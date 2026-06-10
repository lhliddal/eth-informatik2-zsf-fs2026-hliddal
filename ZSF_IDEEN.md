# ZSF-Ideen (Scan-Design)

> Kompaktes Inventar: was diese ZSF für Scannbarkeit/Übersichtlichkeit tut.
> Neue Ideen unten eintragen. „Spezifisch" = Übernahme-Kandidaten fürs Template.

## Standard (alle ZSF)

- **Fett-Anker** (aus Analysis): `\ZSFkeyword` dicht als primäre Scan-Anker — hier noch kaum genutzt (1×), stattdessen 251× rohes `\textbf`; bei Gelegenheit migrieren.
- **Querverweise** (aus LinAlg): `\ZSFref{label}` → „(→ 6.6)" in Zielkapitel-Farbe. Label via `\label{sec:...}` nach `\section`/`\subsection`.

## Spezifisch (Template-Kandidaten)

- 3 statt 4 Spalten: mehr Breite, damit Code-Zeilen nicht umbrechen.
- `codebox` mit Titelbalken + Sprach-Tag (122×) + Syntax-Highlighting (`lstlisting`/CodeExpert).
- Split-Gruppen `codeboxfirst`/`mid`/`last`: lange Listings über Spaltengrenzen optisch zusammenhängend.
- `\CodeLine{code}[comment]` (87×): Smart-Kommentar automatisch rechts neben der Code-Zeile, bei Platzmangel darüber (→ im Template als Opt-in `67_code_comments` vorhanden).
- Hervorhebungs-Duo: `\textbf` für Konzepte vs. `\texttt` für Code-Identifier; `\hl` für Spitzen-Hervorhebung.
- Anwendungs-Kapitel (Code-Beispiele, DP-Quiz) als praktischer Lookup-Teil.

## Ideen / TODO

- _(frei eintragen)_
