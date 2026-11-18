# Sketch layout — 2026-11-18

Rebuilt the page from the owner's paper sketch: wordmark, tagline, the app icon ringed by small cards, a rule, the download button, Marcus with a quoted line, then the screenshot.

- **Marcus.** `marcus.png` is now the owner's pixel-art portrait (purple cloak, temples behind), scaled to 480 px and palette-reduced, with `marcus.webp` beside it. The app icon (`icon-*.png`, favicon, touch icon) is unchanged: it comes from the app repo's `scripts/render-icon.swift --site`, so if the icon should change too, change it there first.
- **Icon ring.** `icon-288.png` is a scaled copy of `icon-1024.png` for the hero. The cards round it are CSS only, `aria-hidden`, static (no motion).
- **Tagline.** “Your to-do on a timeline.” from the sketch. The longer description stays in the meta tags.
- **Download.** The button reads “Download for macOS” and is ink-filled as the primary action, but has no `href` (`aria-disabled`), with “macOS 14 or later. Not available yet.” under it. Add the link when there's a release.
- **Quote.** “Now. Do the next right thing. I’ll be here. Well. The statue will.” carried over from the earlier tour panel. The app repo wasn't available, so it wasn't re-checked against `TourScript.swift`.

Checked at 1280 and 390, light and dark, with Playwright: no sideways scroll at 390.
