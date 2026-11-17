# CLAUDE.md

The marketing site for **Fasti for Mac**. Static HTML/CSS, no build step, hosted on GitHub Pages from the root of `main` at `https://dennisgrellmann.github.io/fasti/`. Every path must be relative (the site lives under `/fasti/`, not `/`).

The app's source is the sibling repo `../Fasti Desktop Mac` (private on GitHub). It is the source of truth for design and for what the app does. Read it; don't edit it from here.

- Design spec: `../Fasti Desktop Mac/docs/handovers/2026-11-10-classical-restyle-design.md`
- Tokens: `FastiMac/Shared/FastiPalette.swift`, type: `FastiMac/Shared/FastiType.swift`, controls: `FastiMac/Shared/FastiControls.swift`
- Features and shortcuts: the app's `README.md`
- Tour: `FastiMac/Features/Tour/` and `docs/handovers/2026-11-10-marcus-tour.md`

## Design rules

Match the app. If the site and the app disagree, the app wins.

- **One family:** IBM Plex Mono 400/500/600, self-hosted in `assets/fonts/`. No other webfonts. Keycaps (`kbd`) use the system face because Plex lacks ⎋ and ⌫, as in the app.
- **Case:** headings, labels and buttons are uppercase with wide tracking, done in CSS (`text-transform`), so the HTML keeps sentence case for screen readers. Body copy is sentence case.
- **Tracking (em):** wordmark 0.32, h2 0.28, column headers 0.16, buttons and eyebrows 0.12, card titles 0.07. h1 uses 0.12 because it's large.
- **Shape:** square corners everywhere (`border-radius: 0`, except round status markers), 1px `--ink` borders and rules, no shadows, no gradients, no glass, no rounded cards.
- **Colour:** monochrome tokens only (`--paper`, `--board`, `--card`, `--bar`, `--ink`, `--muted`, `--bar-muted`, `--hover`). Point colours (`--lavender` etc.) appear only as the 7px square on a card. Light and dark both follow `prefers-color-scheme`, with the app's dark values.
- **Components** reuse the app's: toolbar-style top bar, `FastiButtonStyle` buttons (30px, ink border; only the primary action is ink-filled), board columns with a grey header bar and “quoted” uppercase names plus “(count)”, cards with a colour square, boxed `#TAG` chips, ink status markers (hollow / half / filled), Marcus's caption panel.
- **No decoration without a job.** The app's brief deliberately dropped laurels, Latin mottos and ornament. The bust appears only with the tour. Don't add stock illustrations, icons for their own sake, or animation that doesn't explain something. Respect `prefers-reduced-motion` if you add any motion.
- **Screenshots** are real app captures in a plain 1px ink frame with an uppercase caption, never mocked up or edited. Say “Sample data” when they show it.

## Writing

Plain and specific, like the app's README. Short sentences, Australian English, no hype words (“seamless”, “powerful”, “unlock”), no exclamation marks. Marcus's lines are quoted exactly from `TourScript.swift`.

## Checking work

- Serve with `python3 -m http.server 8765` and render with `swift scripts/snapshot.swift <url> <width> <out.png> <light|dark> [max-height]`. Check 1280 and 390 widths in light and dark before pushing. Nothing may scroll sideways at 390.
- Contrast: body and muted text at least 4.5:1 on their backgrounds.
- Keep the page working without JavaScript.

## Publishing

Pushing to `main` deploys the site (GitHub Pages, “Deploy from a branch”, `main` / root). `.nojekyll` stays so files are served as-is. Write a short note in `docs/handovers/` when you finish a chunk of work.
