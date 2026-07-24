# RTL & Localization

Source: `docs/architecture.md` §7, `docs/design.md` §8.

1. **No hardcoded strings.** Every user-facing string goes through `context.l10n.<key>`, defined in both `lib/l10n/app_en.arb` and `app_ar.arb`. Adding a screen = adding keys to both files (Arabic may be placeholder-translated but must exist).
2. **Directional widgets only** — `EdgeInsetsDirectional`, `AlignmentDirectional`, `PositionedDirectional`, `start`/`end`. Never `left`/`right` in layout code.
3. **Plate shadow flip in RTL is mandatory**: NeoPop Plate shadow offset flips `(4,4)` → `(-4,4)`, press translate `(3,3)` → `(-3,3)`. Implemented via `Directionality` check inside `NPCard`/`NPButton` — do not skip.
4. Icons: prefer auto-mirroring Material icons; wrap custom directional icons/illustrations needing flip with `matchTextDirection: true`.
5. Never mirror: brand logo, numeric keypads, clock/time icons, media controls, checkmarks.
6. Amounts/currency through one utility: `Money.format(context)` — locale-aware separator + symbol placement. Numerals stay Western (0-9) in both locales.
7. **Definition of done gate**: every screen must be visually verified in both `en` and `ar` (RTL) before it is checked off in `docs/tasks.md`.
