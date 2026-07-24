# Emral Pay — Design System (design.md)

> **Purpose:** Visual + interaction spec for the Emral Pay Flutter prototype. CRED-inspired premium tactility, translated to a **light-first** identity with an **emerald/teal** money-trust accent and **full-flair motion**. Read with `product.md` (scope) and `architecture.md` (where tokens/widgets live: `app/theme/`, `core/widgets/`).

---

## 1. Design Direction

**Concept: "The Mint Ledger."** A precision financial instrument that feels crafted, not templated. Where CRED achieves premium through darkness, Emral Pay achieves it through *paper-and-ink clarity*: bright porcelain surfaces, deep ink typography, and one disciplined emerald accent — with CRED's signature physicality (raised plates, hard shadows, chunky pressable buttons, celebration moments) fully intact.

**Signature element:** the **NeoPop Plate** — every interactive card/button is a flat surface lifted off the page by a *hard, non-blurred offset shadow* (no soft material elevation). Pressing it visually "pushes the plate down" (shadow collapses, plate translates 2–3px toward the shadow) with a haptic tick. This one device carries the entire premium feel; everything else stays quiet.

**Restraint rule:** emerald appears only on: primary CTAs, active states, money-positive values, and the success moment. Never as decoration, backgrounds of full screens, or body text.

---

## 2. Color Tokens

### 2.1 Light (default)

| Token | Hex | Use |
|---|---|---|
| `surface.page` | `#FBFCFA` | App background (crisp porcelain) |
| `surface.card` | `#FFFFFF` | Cards, sheets |
| `surface.sunken` | `#EEF1ED` | Input fills, inactive chips |
| `ink.primary` | `#0B140F` | Headlines, amounts (near-black with green undertone) |
| `ink.secondary` | `#4A564F` | Body, labels |
| `ink.tertiary` | `#8A968F` | Captions, placeholders |
| `accent.primary` | `#00A868` | Deep Jewel Emerald — CTAs, active, positive money |
| `accent.deep` | `#00703F` | Pressed CTA, emphasis text on light |
| `accent.tint` | `#C9F2DE` | Accent-tinted fills (reward chips, success bg) |
| `plate.shadow` | `#0B140F` @ 100% | Hard offset shadow of the NeoPop Plate |
| `semantic.danger` | `#D64545` | Fines, overdue, errors |
| `semantic.warning` | `#C9902A` | Due-soon |
| `semantic.info` | `#2563EB` | Informational only (rare) |
| `gold.reward` | `#C9A24B` | Rewards points accents only |

### 2.2 Dark

| Token | Hex |
|---|---|
| `surface.page` | `#0C110E` |
| `surface.card` | `#151B17` |
| `surface.sunken` | `#1D2420` |
| `ink.primary` | `#F2F5F3` |
| `ink.secondary` | `#A9B4AE` |
| `ink.tertiary` | `#6C7671` |
| `accent.primary` | `#29D999` (brightened for contrast) |
| `accent.deep` | `#00A868` |
| `accent.tint` | `#0E3A2A` |
| `plate.shadow` | `#000000` @ 100% |
| Semantic | danger `#F87171`, warning `#E0B45C`, gold `#D9B45F` |

**Rules:** contrast ≥ 4.5:1 for all text; theme switch in Settings (system default honored). Both modes ship in the prototype; light is what the demo opens in.

---

## 3. Typography

| Role | Face (google_fonts) | Usage |
|---|---|---|
| Display | **Space Grotesk** | Screen titles, balance amounts, receipt totals. SemiBold/Bold, tight tracking (-1%) |
| Body/UI | **Inter** | Everything else. Tabular figures ON for all money and lists (`FontFeature.tabularFigures()`) |
| Arabic | **IBM Plex Sans Arabic** | Replaces *both* roles in `ar` locale; weights mapped 1:1 |

Type scale (sp): `display-xl 40/44` (balance), `display 28/34` (screen titles, totals), `title 20/26`, `body 16/24`, `label 14/20`, `caption 12/16`, `mono-amount 18/24 tabular`.

**Money display rule:** amount in Display face, currency code in `caption` `ink.tertiary` beside it (e.g., **250.000** OMR). Decimals at 3 dp always; decimals rendered at 70% size of integers on balance cards.

---

## 4. Shape, Space, Depth

- **Spacing scale:** 4 / 8 / 12 / 16 / 24 / 32 / 48. Screen gutter **20**. Section gap **32**. Generous whitespace is part of the identity — when unsure, add space.
- **Radius:** cards **20**, buttons **14**, chips **999**, sheets top **28**, inputs **14**.
- **NeoPop Plate (signature):**
  - Resting: card fill `surface.card`, 1px border `ink.primary @ 8%`, hard shadow `plate.shadow` offset **(4, 4)** blur **0**.
  - Pressed: translate **(3, 3)**, shadow offset **(1, 1)**, 80ms, `HapticFeedback.selectionClick`.
  - **RTL:** shadow offset flips to **(-4, 4)**; press translates **(-3, 3)**. Implement via `Directionality` check inside `NPCard`/`NPButton` — this is mandatory, not optional.
  - Primary CTA plate: fill `accent.primary`, label white, shadow `accent.deep`.
- Non-interactive cards (receipts, info) use a *soft* shadow (`ink.primary @ 6%`, blur 24, y 8) — depth hierarchy: hard = tappable, soft = static. Never mix.

---

## 5. Motion & Haptics (Full CRED)

Global: curve `Curves.easeOutCubic` default; springs (`Curves.easeOutBack`) for celebratory pops. Durations: micro 120ms, standard 240ms, entrance 400ms, celebration 900ms. **Respect `MediaQuery.disableAnimations`** — reduce all to fades.

| Moment | Spec |
|---|---|
| Screen entrance | Staggered rise: children fade + translateY 16→0, 60ms stagger (flutter_animate) |
| Balance card | Count-up animation on load (0 → value, 600ms); hide/show flips with 3D rotateX |
| Plate press | §4 press physics + selection haptic on every tappable plate |
| Payment PIN | Each digit fills with a pop (scale 0.8→1); wrong PIN shakes horizontally + `heavyImpact` |
| Processing | Emerald orbital loader (custom), min display 800ms |
| **Success (hero moment)** | Full-screen takeover: plate slams in with `heavyImpact`, animated emerald check draws itself, **confetti burst** (confetti/Lottie), amount counts up, rewards chip flies into the points total. This is the demo's money shot — over-invest here |
| Rewards unlock | Progress bar fills with shimmer; threshold crossed → gold particle burst |
| Remittance tracker | Timeline nodes light sequentially with connecting line draw |
| Pull-to-refresh | Custom emerald coin-spin indicator |
| Tab switch | Icon morph + soft `lightImpact` |
| Number pads | `selectionClick` per key |

**Discipline:** confetti appears in exactly two places (payment success, reward redemption). Lists never animate beyond entrance stagger. Motion celebrates *outcomes*, not navigation.

---

## 6. Component Specs (`core/widgets/`)

| Widget | Spec |
|---|---|
| `NPButton` | Plate physics; heights 56 (primary) / 44 (secondary); ghost = borderless emerald text; loading = label swaps to 3-dot bounce |
| `NPCard` | Plate (interactive) or soft (static) variant flag |
| `NPBalanceCard` | Ink-primary fill in light mode (inverted card — deep green-black `#101914` with white amount, emerald tint chip); the single dark object on the light home screen = focal point |
| `NPAmountInput` | Display-face digits, grows with value, quick chips as mini-plates |
| `NPTextField` | `surface.sunken` fill, no border; focus = 2px emerald underline slide-in |
| `NPListTile` | 56px min, leading 40px icon tile (`surface.sunken`, radius 12), trailing tabular amount (positive = accent, negative = ink) |
| `NPBottomSheet` | Radius-28 top, grab handle, background scrim `ink.primary @ 40%` |
| `NPPinPad` | 3×4 plates, 64px keys |
| `NPStatusTimeline` | 12px nodes, active = emerald with pulse ring |
| `NPShimmer` | `surface.sunken` base, subtle sweep |
| `NPEmptyState` | Line illustration (2px ink strokes, single emerald accent shape), title + one-line body + CTA plate |
| `NPBadge/NPChip` | Tint fills (`accent.tint` / gold @ 12%), never solid |

Icons: **lucide** style (2px stroke, rounded) via `lucide_icons` or `flutter_svg`; ink.secondary default, emerald when active. No filled/duotone icons.

---

## 7. Screen-Level Art Direction (key screens)

- **Home (B1):** porcelain page; dark `NPBalanceCard` hero at top (the one dark object); quick actions = 4 square plates; services grid = 2-row plates with tinted icon tiles; promo carousel uses accent.tint cards, not photos.
- **Bill Detail (E5):** receipt metaphor — soft card with perforated top edge (dashed divider), amount in display-xl, due date as warning chip if < 5 days.
- **Receipt (E9/C7):** success takeover (§5), then a shareable receipt card styled like a minted ticket: reference number in mono spacing, dashed divider, rewards chip.
- **Traffic Fines (F2):** each fine = plate with checkbox; selected total sticks to bottom in an emerald summary bar.
- **Rewards (I1):** gold accents allowed here only; points counter in display-xl; progress ring around balance.
- **Onboarding (A3):** 3 slides, oversized display typography (one emerald word per headline), abstract geometric line illustrations — no stock-style people.
- **Settings language switch (J9):** the live LTR→RTL flip is itself a demo moment — animate with a quick crossfade.

---

## 8. RTL / Arabic Design Rules

1. Full mirror: layout, plate shadows (§4), progress direction, timelines, back navigation, carousels.
2. IBM Plex Sans Arabic sizes bump +1sp at `label` and below (Arabic legibility).
3. Numerals stay Western (0-9) in both locales; currency symbol placement locale-aware.
4. Never mirror: brand logo, numeric keypads, clock/time icons, media controls, checkmarks.
5. Every screen screenshot-verified in `ar` before done (per architecture.md §7).

## 9. Copy Voice

Sentence case everywhere. Plain verbs: "Pay bill", "Send money", "Add card" — the button names the outcome, and the same word follows through to the toast ("Paid", "Sent"). Errors state what happened + the fix, no apologies ("Balance too low. Top up to continue."). Empty states invite action ("No saved accounts yet. Add one to pay in two taps."). No exclamation marks except the success screen ("Paid!").

## 11. AI Assistant Chat ("Ask Emral" — K1)

- **Bubbles:** assistant = `surface.card` soft-shadow (static, not tappable) pill, radius 20, `AlignmentDirectional.centerStart`; user = `accent.tint` fill, `AlignmentDirectional.centerEnd`. Entrance: same fade+translateY stagger as any list (design.md §5), never a bespoke motion.
- **Rich cards** (bill reminder, wallet summary, rewards, payment shortcut) are `NPCard` (soft/static variant) embedded inside the assistant bubble column — never a new card primitive.
- **Typing indicator:** 3-dot bounce, reuse `NPButton`'s `_BouncingDots` motion spec (900ms loop) in `ink.tertiary`.
- **Quick-reply chips:** `NPChip` row, horizontally scrollable, sits above the input bar.
- **Assistant Blob FAB (Home-only):** circular plate (56px), `accent.primary` fill, `accent.deep` hard shadow — same shadow-flip rule as every other plate (§4). Two motion layers, both respecting `MediaQuery.disableAnimations` (freeze to static if on):
  1. **Idle "blob" wobble:** continuous ~1600ms `easeInOut` loop, scale 1.0↔1.06 + a few degrees of skew — organic breathing, not a spin.
  2. **Highlight pulse:** soft `accent.primary` glow ring behind the circle, opacity 0↔0.4 loop — draws the eye without adding a second accent color.
  - **Draggable:** free-drag anywhere within the Home safe area; releases with an `easeOutBack` snap to the nearest horizontal edge. Default spawn corner is bottom-**end** (flips with RTL, never hardcoded bottom-right). Selection haptic on drag-start, `heavyImpact` on snap.
  - Tap → push `/assistant` (K1).

## 12. Don'ts

- No gradients (single exception: subtle emerald sheen permitted on the dark balance card).
- No soft Material elevation on tappables; no ripple — plate physics replaces both (`splashFactory: NoSplash`).
- No photos/stock imagery; illustration = geometric line style only.
- No more than one dark surface per light-mode screen.
- No emerald text on emerald tint; no full-emerald screens.
- No third accent color, ever. Gold is rewards-only, danger is fines/errors-only.
