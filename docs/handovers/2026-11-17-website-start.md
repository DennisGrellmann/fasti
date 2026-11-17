# Website start — 2026-11-17

## What exists

- A one-page site for Fasti for Mac (`index.html`, `assets/css/site.css`) built on the app's classical restyle: Plex Mono, the app's light and dark tokens, toolbar-style top bar, board-column feature list, Marcus caption panel, keyboard table, and a download section.
- Assets copied from the app repo at commit `631554e`: the three Plex Mono weights and `OFL.txt`, `docs/images/timeline-and-board.png` and `compact-timeline.png` (light, `tagged` UI fixture), the bust (`marcus.png`), app icons, and `tour-dark.png` (a UI-test capture of the tour in the main window, dark mode, tour sample data).
- Checked with `scripts/snapshot.swift` at 1280 and 390, light and dark. No sideways scrolling at 390.
- GitHub Pages: deploys from `main`, root folder.

## Decisions already made by the owner

- The site is **Mac app only**. The web timeline (`Fasti-Timeline`) is not covered.
- Repo is public and named `fasti`, so the site is at `/fasti/`.

## Open items, in rough priority

1. **Better screenshots.** The hero and compact shots use the UI fixture, so cards read “FIXTURE POINT 0006”. Re-shoot with realistic data in both light and dark. The tour's sample workspace (`TourSample` in the app's `FastiMac/Features/Tour/TourScript.swift`) has good titles. The app's UI tests can capture windows (see `FastiMacUITests.swift`, `screenshot(_:)`, and how `testFirstLaunchTourPlaysInTheMainWindow` saves `first-launch-tour`). Serve dark captures with `<picture>` and `prefers-color-scheme`. Captures must be unedited.
2. **Download.** The app repo is private and has no releases, so the download button says “coming soon” and is disabled. How Fasti will be distributed (signed and notarised DMG, GitHub Releases on a public repo, App Store) is the owner's call. Don't invent a link.
3. **Open Graph.** `og:image` is relative; social sites need an absolute URL (`https://dennisgrellmann.github.io/fasti/assets/img/...`). A purpose-made 1200×630 share image in the site's style would be better than the raw screenshot.
4. **Performance.** Fonts are TTF (~135 KB each) and screenshots are 2560px PNGs (~400 KB). Consider WOFF2 subsets and responsive `srcset` sizes. Keep originals unedited.
5. **Accessibility pass.** Keyboard order, focus styles, alt text, heading order, contrast in dark mode.
6. **Polish.** Section rhythm, the hero headline wrap at mid widths, maybe a small timeline motif as the section nav, but only if it does a job.
7. **Not decided:** a licence for the site's own code and copy, and a custom domain. Ask the owner.
