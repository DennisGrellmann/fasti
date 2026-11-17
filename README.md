# Fasti for Mac — website

The website for **Fasti for Mac**, a native Mac app that puts a timeline above a task board so you can see when work is due and where it stands.

Live at **https://dennisgrellmann.github.io/fasti/**, served by GitHub Pages from the root of `main`.

## Run locally

It's plain HTML and CSS with no build step.

```sh
python3 -m http.server 8765
```

Then open [localhost:8765](http://localhost:8765).

To check a layout without a browser, render it with WebKit:

```sh
swift scripts/snapshot.swift http://127.0.0.1:8765/ 1280 out.png light
swift scripts/snapshot.swift http://127.0.0.1:8765/ 390 phone.png dark
```

## Layout

| Path | What |
| --- | --- |
| `index.html` | The page |
| `assets/css/site.css` | All styles. Tokens at the top mirror the app's palette |
| `assets/fonts/` | IBM Plex Mono 400/500/600 and its licence (OFL) |
| `assets/img/` | App screenshots, the Marcus Aurelius bust, icons |
| `scripts/snapshot.swift` | WebKit page renderer for checking layouts |
| `docs/handovers/` | Handover notes between work sessions |

## Design

The site follows the app's classical restyle: one monospaced family, uppercase tracked labels, square corners, 1px ink rules, a monochrome palette with point colours only as small squares. The rules are in [CLAUDE.md](CLAUDE.md).

## Fonts

IBM Plex Mono is © IBM Corp., used under the [SIL Open Font License 1.1](assets/fonts/OFL.txt).
