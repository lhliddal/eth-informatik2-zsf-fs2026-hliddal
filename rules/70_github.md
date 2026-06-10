---
description: "Naming-Konventionen (Repo, PDF, Tags), GitHub Actions (CI Build, Release), PDF-Identity, Schwester-Projekt-Verhältnis"
globs:
  - ".github/**"
  - "Makefile"
  - "tests/**"
  - "styles/75_pdf_identity.tex"
  - "README.md"
alwaysApply: false
decisionOwner: ai
decisionStatus: final
lastUpdatedBy: loris
lastUpdatedAt: 2026-05-08
---

## GitHub & Release

### Namenskonventionen

- **Repository:** `eth-info2-zsf-fs2026-hliddal` (Muster: `eth-<fach>-zsf-<semester>-hliddal`)
- **PDF:** `info2_fs2026_hliddal.pdf` (Muster: `fach_semester_hliddal.pdf`)
- **Semesterformat:** `fsYYYY` oder `hsYYYY`
- **Release-Tags:** Semantic Versioning `vMAJOR.MINOR.PATCH`

### GitHub Actions

- **Workflow `CI Build`** (push/PR auf `main`): `make check` + `make build`, PDF als Artifact
- **Workflow `Release PDF`** (push auf Tag `v*`): `make check` + `make build` + `make release-proof`; GitHub Release mit `info2_fs2026_hliddal.pdf` + `build/main.pdf.sha256`

### Agent-Regeln für GitHub-Änderungen

Änderungen an Naming-Patterns immer konsistent in:
- `Makefile`
- `tests/check_root_clean.sh`
- `styles/75_pdf_identity.tex`
- `README.md`
- `.github/workflows/*.yml`
- `rules/70_github.md` (diese Datei)

Release-Flow nie auf manuelle Uploads zurückbauen.

### Authentizität / PDF-Identity

`styles/75_pdf_identity.tex` ist Single Source of Truth für:
- `\ZSFOwnerNameASCII` (PDF-Author)
- `\ZSFOwnerID`, `\ZSFReleaseID`, `\ZSFBuildID`
- Title, Subject, Keywords (via `hypersetup`)

`tests/check_pdf_identity.sh` prüft Metadaten nach Build (Teil von `make check`).

### Verhältnis zu Schwester-Projekten

`ZSF_Analysis_2` und `ZSF_Physik_V4` sind ähnlich strukturiert (modulare Styles, `chapters/`, `tests/`). Infrastruktur-Dateien (`.gitattributes`, `.latexindent.yaml`) bei Bedarf manuell synchronisieren. **Inhaltliche Regeln** (`rules/*.md`, `MODULAR_SYSTEM.md`) sind projekt-spezifisch — nicht auto-synced.
