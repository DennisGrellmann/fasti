# Website pass 1 — 2026-11-17

Worked through open items 1, 3, 4, 5 and 6 from `2026-11-17-website-start.md`. Items 2 (download) and 7 (licence, domain) are still the owner's call; the download button still says “coming soon” and links nowhere.

## What changed

- **Screenshots (1).** The fixture shots (“FIXTURE POINT 0006”, `#COMP3851`) are gone. New captures, light and dark, are in `assets/img/shots/`:
  - `board`: hero, with Build prototype selected so it's outlined on the timeline and the board.
  - `compact`: the same workspace with the timeline collapsed.
  - `tour`: the tour at step III (timeline lit, Marcus on countdowns), on the tour's own sample data.
  Each is AVIF at 1280 and 2560 wide plus a 1280 PNG fallback, served through `<picture>` with a `prefers-color-scheme: dark` source. Captures are unedited apart from scaling and re-encoding. CSS masks the desktop that shows behind the window's rounded corners.
- **Open Graph (3).** `assets/img/og-image.png` (1200 × 630) is rendered from `scripts/og-image.html` around the real light capture; rebuild steps are in that file. Absolute `og:image` and `og:url`, image size and alt text, `canonical`, and a `summary_large_image` Twitter card.
- **Performance (4).** Fonts are IBM's own Latin1 WOFF2 subsets from `@ibm/plex-mono` 2.5.0 (`fonts/split/woff2`), unmodified, about 18 KB each instead of about 137 KB TTFs. Using IBM's files rather than making our own subsets avoids the OFL Reserved Font Name (“Plex”) question. Everything set in Plex is inside Latin1; keycaps use the system face. Screenshots are 33–83 KB AVIF; the hero loads with `fetchpriority="high"`, the rest lazily.
- **Accessibility (5).** Card titles are `h4` under their column's `h3`. Curly quotes, column counts and the Roman step count are hidden from screen readers, as the app does; the panel reads “Step 8 of 8”. Keycap symbols have spoken names, with “or” between alternatives. The table is labelled by its heading. `main` takes focus from the skip link. Contrast for every token pair, light and dark: muted text is at least 5.4:1, bar-muted on the bar 6.3:1.
- **Polish (6).** Keycap chords no longer break across lines at phone width. The hero headline already wraps evenly from 390 to 1280 thanks to `text-wrap: balance`, so I left it. I didn't add a timeline motif nav: the page is short and the top bar already links each section, so it would be decoration.

## How the captures were made

Nothing in the app repo was changed or committed. In a temporary detached worktree of the app (`git worktree add --detach`, removed afterwards):

1. `project.yml`: added the `FastiDomain` and `FastiData` package products to the `FastiMacUITests` target, then `xcodegen generate`.
2. `FastiMacUITests.swift`: added `testWebsiteShots`, which writes a SwiftData store straight into the fixture root before launch (ten points with the same titles, colours, offsets, statuses and tags as `TourSample`), launches with `--ui-seed empty --ui-now 2026-11-17T01:00:00Z` (an existing store isn't reseeded), and saves `screenshot(...)` for board, selected and collapsed, once with `--ui-appearance light` and once with `dark`. `testWebsiteTourShotsLight`/`Dark` launch with `--ui-tour` and capture each step.
3. Ran each with the `xcodebuild … test -only-testing:` command from the brief and exported attachments with `xcrun xcresulttool export attachments`. Afterwards the app's own `scripts/cleanup-ui-fixtures.py --session <id>` removed the three fixture folders and preference suites those runs made.

## What I checked

- `scripts/snapshot.swift` at 1280 and 390, light and dark, before each push, plus 600, 768, 900 and 1024 for the headline wrap.
- A WebKit probe: `scrollWidth` equals the viewport at 390 and 1280 in both modes, with no element past the right edge; all three font weights load; the right AVIF is picked per width and mode (2560 for the hero at 1280, 1280 elsewhere, dark files in dark mode).
- Heading outline and focus order with the same probe.
- Images carry no personal metadata (checked for user and path strings).
- Live: after the last push, `https://dennisgrellmann.github.io/fasti/` served the new HTML. The share image, WOFF2 (`font/woff2`) and AVIF (`image/avif`) return 200, and the live page loads fonts and images in WebKit.

## What's left

- **Download (2)** and **licence / custom domain (7)**: owner decisions, unchanged.
- No real-browser check outside WebKit (no Chrome or Firefox here). AVIF and WOFF2 are fine in all current browsers; the PNG fallback covers old ones.
- Link previews not tested on actual social sites. The tags follow the Open Graph spec; a validator check after the next push would confirm it.

## App-repo changes that would help (not made)

- **A realistic fixture seed.** Add `--ui-seed sample` to `UIFixture` (`FastiMac/App/UIFixture.swift`), seeding the `TourSample` rows relative to `--ui-now`, and a `testWebsiteShots` UI test that captures board, selected, collapsed and tour in both appearances. Then the site's shots can be re-shot with the app's own test script, without linking `FastiData` into the UI test target. The app's own `docs/images/*.png` still show the fixture data and could use the same seed.
- **Possible tour issue, not confirmed.** In step VII the editor sheet is open, and the test's click on the panel's Next button didn't advance the tour, so the panel seemed blocked by the modal sheet. The tour may still move on by itself when the clip ends, but I didn't wait long enough to check. Worth a look in the app.
