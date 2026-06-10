---
description: "ZSF Informatik II — Projekt-Meta, Zweck, kritische Regeln (Sprache, Modularität, keine Inhaltsänderung ohne Befehl)"
globs: []
alwaysApply: true
decisionOwner: ai
decisionStatus: final
lastUpdatedBy: loris
lastUpdatedAt: 2026-05-07
---

LaTeX-Zusammenfassung Informatik II (D-MAVT FS2025). Inhalt: Python, Algorithmen, Datenstrukturen, ML, Neuronale Netze. A4 Querformat, 3 Spalten, 8pt.

**Zweck:** Prüfungsvorbereitung — wird direkt in der Prüfung verwendet. Schnelle Auffindbarkeit und klare Übersicht haben höchste Priorität.

**Eigenständiges Projekt.** Inspiriert von `ZSF_Analysis_2` und `ZSF_Physik_V4`, aber mit eigenen Konventionen: Document-Class `scrartcl` statt `extarticle`, `65_code_style.tex` für Code-Listings, eigene Bild-Pfade `Images/` + `figures/`. Kein Fork, keine Laufzeit-Abhängigkeit.

## Kritische Regeln

- **Build-Befehl:** Nach jeder Änderung ausschliesslich `make build` verwenden — keine alternativen oder abgekürzten Kommandos (`latexmk`, `pdflatex`, …).
- **Inhalte niemals ändern, kürzen oder vereinfachen** ohne expliziten Befehl.
- Keine neuen Packages oder Makros ohne explizite Anfrage hinzufügen.
- Stil und Struktur (Boxtypen, Farben, Abstände) konsistent mit bestehendem System halten.
- **Good Practice:** sauberer, lesbarer LaTeX-Code; bestehende Makros und Umgebungen nutzen statt Inline-Workarounds.
- **Modularität ist Pflicht:** Abstände, Farben, Makros, Strukturen gehören in `styles/*.tex`. Hardcodierte Werte direkt in Box-Definitionen oder Kapiteldateien sind verboten.
- **Sprache:** Inhalte auf Deutsch. Technische Begriffe auf Englisch erlaubt (Stack, Heap, Pointer). LaTeX-Labels, Befehle, Dateinamen auf Englisch.
