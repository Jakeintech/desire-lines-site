# desire-lines-site

Public website for **Desire Lines**, a strategy game for iPhone and iPad about paving the paths students actually take.
*Students walk where they want. Pave accordingly, before the bell.*

Live at <https://jakeintech.github.io/desire-lines-site/> (GitHub Pages, from `main` /).

| Page | URL |
|---|---|
| Home (App Store marketing URL) | `/` |
| Support and FAQ (App Store support URL) | `/support.html` |
| Privacy Policy (App Store privacy URL) | `/privacy-policy.html` |
| Terms of Service | `/terms-of-service.html` |
| Press kit | `/press.html` |
| Not found | `/404.html` |

Keep the support and privacy URLs exactly as they are: App Store Connect points at them.

## How it is built

Plain HTML and one stylesheet (`assets/site.css`). No build step, no scripts, no fonts to download, no analytics, no cookies
and no third-party requests of any kind. Edit the HTML files directly.

- **Colour:** the game's design tokens: ink `#1F2A26`, lawn `#B9D8A4`, paving cream `#FBF6E9`, worn trail `#B98A3E` and the
  building hues. The alert red `#B93424` is a fill only, on the store pill and on the late student in the artwork; it is
  never used for text. Every text pairing meets WCAG AA (the ratios are listed at the top of `site.css`).
- **Type:** the system font stack (SF on Apple devices), rounded for headings.
- **Artwork:** inline SVG drawn from the tokens with the game's one-ribbon rule: cream paving on a 2px darker-green casing,
  one-cell fillets, an ochre trail, small student discs, a red late student with a ring. The pictures are illustrations,
  not captures of play, and the page says so.
- **The mark** (`favicon.svg`, `assets/img/favicon-32.png`, `assets/img/apple-touch-icon.png`, and inline in each header)
  is a placeholder until the real app icon lands.
- **Share card:** `assets/img/og.png` (1200 x 630), rendered from `tools/og.svg`. `tools/render.sh` rebuilds it and the
  icon PNGs.
- **404:** uses absolute `/desire-lines-site/` paths so it works at any depth. Change them if the site moves to its own domain.

## Slots to fill at launch

Search the HTML for these comments. Nothing is linked until the file exists.

| Slot | Where | What to do |
|---|---|---|
| Smart App Banner | `<head>` of every page, comment starting `AFTER RELEASE: the Smart App Banner` | Add the `apple-itunes-app` meta tag with the app id |
| Store badge | `index.html`, comments `STORE BADGE SLOT (hero)` and `STORE BADGE SLOT (closing)` | Replace each `<p class="soon">` with Apple's official badge, linked to the App Store page |
| Hero video | `index.html`, comment `HERO VIDEO SLOT` | Replace the hero `<svg>` with the muted, looping `<video>` and its poster |
| Screenshots | `index.html`, comment `SCREENSHOT SLOTS` | Add three captures and uncomment the section |
| Press assets | `press.html`, comment `PRESS ASSET SLOTS` | Add the icon, screenshots and preview video with download links |
| JSON-LD | `index.html`, `offers.availability` | Change `PreOrder` to `InStock` and add `downloadUrl` |

At launch, also change "Coming soon" in the page descriptions, the press fact sheet and the terms where they describe status.

## Contact

support@denvered.com
