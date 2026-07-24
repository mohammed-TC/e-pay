# Design Tokens & NeoPop Physics

Source: `docs/design.md` §2–§6.

- **Tokens live in `lib/app/theme/`** (`app_colors.dart`, `app_typography.dart`, `app_spacing.dart`, `app_theme.dart`). Reference tokens by name (`surface.page`, `accent.primary`, `ink.primary`, `gold.reward`, etc.) — never hardcode hex values in feature code.
- **NeoPop Plate is the signature device**: resting = hard offset shadow `plate.shadow` `(4,4)` blur 0, 1px border `ink.primary @ 8%`; pressed = translate `(3,3)`, shadow `(1,1)`, 80ms, `HapticFeedback.selectionClick`. RTL flips to `(-4,4)`/`(-3,3)` — see [[rtl-localization]].
- **Non-interactive cards use soft shadow** (`ink.primary @ 6%`, blur 24, y 8) — never mix hard (tappable) and soft (static) shadows on the same element.
- **Motion durations**: micro 120ms, standard 240ms, entrance 400ms, celebration 900ms. Curve `Curves.easeOutCubic` default, `Curves.easeOutBack` for celebratory pops. Respect `MediaQuery.disableAnimations`.
- **NPButton / NPCard mandatory** for all tappables — never raw `ElevatedButton`/`Material`/`InkWell` ripple. `splashFactory: NoSplash` everywhere.
- **Emerald discipline**: `accent.primary` only on primary CTAs, active states, positive money values, and the success moment. Never as decoration, full-screen background, or body text. No third accent color, ever.
- **Gold discipline**: `gold.reward` is rewards-screen only (I1/I2). Never elsewhere.
- Spacing scale: 4/8/12/16/24/32/48. Screen gutter 20. Radius: cards 20, buttons 14, chips 999, sheets 28, inputs 14.
