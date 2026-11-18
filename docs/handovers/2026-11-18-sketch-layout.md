# Sketch layout — 2026-11-18

Rebuilt the page from the owner's paper sketch: wordmark, tagline, the app icon ringed by small cards, a rule, the download button, Marcus with a quoted line, then the screenshot.

- **Marcus.** `marcus.png` is now the owner's pixel-art portrait (purple cloak, temples behind), scaled to 480 px and palette-reduced, with `marcus.webp` beside it. The app icon (`icon-*.png`, favicon, touch icon) is unchanged: it comes from the app repo's `scripts/render-icon.swift --site`, so if the icon should change too, change it there first.
- **Icon ring.** `icon-288.png` is a scaled copy of `icon-1024.png` for the hero. The cards round it are CSS only, `aria-hidden`, static (no motion).
- **Tagline.** “Your to-do on a timeline.” from the sketch. The longer description stays in the meta tags.
- **Download.** The button reads “Download for macOS” and is ink-filled as the primary action, but has no `href` (`aria-disabled`), with “macOS 14 or later. Not available yet.” under it. Add the link when there's a release.
- **Quote.** “Now. Do the next right thing. I’ll be here. Well. The statue will.” carried over from the earlier tour panel. The app repo wasn't available, so it wasn't re-checked against `TourScript.swift`.

Checked at 1280 and 390, light and dark, with Playwright: no sideways scroll at 390.

## Follow-up the same day

- The hero's centre image is now the pixel-art Marcus, not the app icon. `icon-288.png` is gone.
- The ring of cards turns slowly (one turn every 90 s). It stops under `prefers-reduced-motion`.
- Marcus's quote cycles through all eight tour captions every 7 s, quoted exactly from `TourScript.swift` on the app repo's `feature/marcus-tour` branch. It pauses on hover and while the tab is hidden, and only fades when motion is allowed. Without JavaScript it shows the first line. The attribution line under the quote is gone.
- The screenshot caption is gone, including “Sample data”. CLAUDE.md asks for that label, so bring it back if the owner changes their mind.
- “View on GitHub” sits beside the download button and links to `DennisGrellmann/Fasti-Desktop-Mac`. Under it: “Open source, under the GPL-3.0 licence”, linking to the app's `LICENSE`. **That repo is private right now, so both links show visitors a 404 until it's made public.**

## Marcus section removed

At the owner's request, the Marcus portrait-and-quote section and its quote-cycling script are gone; the page has no JavaScript again. The hero still centres the pixel-art Marcus inside the turning ring of cards.

## Tab icon

`favicon-64.png` and `apple-touch-icon.png` (256 px) are now the pixel-art Marcus, cropped to his head so it reads at tab size. The links carry `?v=2` to get past cached icons. `icon-1024.png` is still the app's engraved icon (unused by the page).
