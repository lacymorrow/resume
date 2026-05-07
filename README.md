# Resume — Lacy Morrow

> **This repo is the single source of truth for all resume data.** Edit here; do not maintain separate copies downstream.

## Ecosystem

| Layer | URL | Role |
|-------|-----|------|
| **Source** | [github.com/lacymorrow/resume](https://github.com/lacymorrow/resume) | This repo — authoritative data source |
| **Viewer** | [resume.lacy.sh](https://resume.lacy.sh) | Consumes `resume.json`; adds multi-flavor rendering support |
| **Entry point** | [lacymorrow.com](https://lacymorrow.com) | Redirects to resume.lacy.sh for resume viewing |
| **Gist mirror** | [gist.github.com/lacymorrow/20d5679...](https://gist.github.com/lacymorrow/20d5679018e388cfb1a6fa3d76c02ce3) | Auto-synced from this repo on push; mirrors `resume.json` verbatim |

The `resume-app` (deployed as resume.lacy.sh) reads `resume.json` from the gist and builds multi-flavor views on top of it. `lacymorrow.com` redirects to resume.lacy.sh for the resume viewer. Neither downstream maintains its own resume data — this repo is the edit point.

---

Source files for my resume in two formats:

- **`resume.typ`** — [Typst](https://typst.app/) source (primary, CLI-editable)
- **`resume.json`** — [JSON Resume](https://jsonresume.org/) schema (auto-synced to [gist](https://gist.github.com/lacymorrow/20d5679018e388cfb1a6fa3d76c02ce3) on push)

## Quick Start

```bash
# Install Typst (macOS)
brew install typst

# Build complete (5-page) resume
make complete

# Build concise (2-page) resume
make concise

# Build both
make all

# Live preview while editing
make watch
```

## Versions

The Typst source supports two versions controlled by a single boolean at the top of `resume.typ`:

| Version | Pages | Toggle | Contents |
|---------|-------|--------|----------|
| **Complete** | 5 | `#let complete = true` | Full history + open source + agency + hardware |
| **Concise** | 2 | `#let complete = false` | Recent developer experience only |

## Outputs

| File | Description |
|------|-------------|
| `resume-complete.pdf` | Full 5-page resume |
| `resume-concise.pdf` | Trimmed 2-page resume |

## JSON Resume

The `resume.json` follows the [JSON Resume v1.0.0 schema](https://jsonresume.org/schema). On push, a GitHub Action syncs it to the gist, which is hosted at:

https://registry.jsonresume.org/lacymorrow

## Editing

Edit `resume.typ` directly -- it's plain text with a markup syntax similar to Markdown. Run `make watch` for live PDF preview. After editing, keep `resume.json` in sync with any content changes.

## Links

- Portfolio: [lacymorrow.com](https://lacymorrow.com)
- Resume viewer: [resume.lacy.sh](https://resume.lacy.sh)
- JSON Resume Registry: [registry.jsonresume.org/lacymorrow](https://registry.jsonresume.org/lacymorrow)
- Gist: [gist.github.com/lacymorrow/20d5679...](https://gist.github.com/lacymorrow/20d5679018e388cfb1a6fa3d76c02ce3)
