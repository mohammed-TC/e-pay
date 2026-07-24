# Emral Pay — Architecture Document

> **Purpose:** Technical structure and conventions for the Emral Pay Flutter prototype. Read together with `product.md` (what to build) and `design.md` (how it looks). Claude Code must follow these conventions for every file it creates.

---

## 1. Tech Stack

| Concern | Choice | Notes |
|---|---|---|
| Framework | Flutter (latest stable), Dart 3.x | Single codebase, iOS + Android |
| State management | **Riverpod** (hooks_riverpod + riverpod_annotation) | Codegen providers; no setState for business logic |
| Navigation | **go_router** | Declarative, deep-linkable routes, auth redirect |
| Localization | flutter_localizations + intl, ARB files | `app_en.arb`, `app_ar.arb`; full RTL |
| Local persistence | shared_preferences (settings/session) + in-memory repos seeded from JSON assets | No real DB needed for prototype |
| Models | freezed + json_serializable | Immutable models, unions for states |
| Animations | flutter_animate + Lottie + built-in implicit animations | CRED-style motion |
| Charts (if needed) | fl_chart | Rewards/spend visuals |
| PDF viewing | Rendered mock (custom widget) or pdfx with bundled asset PDFs | Bill/policy PDFs are static assets |
| QR | qr_flutter (generate) + mobile_scanner (scan; mock fallback on simulator) | |
| Haptics | HapticFeedback (services) | On every confirm/success |
| Fonts | google_fonts | Per design.md |
| Lint | very_good_analysis or flutter_lints (strict) | |

**No backend.** Everything runs against mock repositories. Structure them behind interfaces so a real API can be swapped in later.

---

## 2. Project Structure (feature-first Clean-ish)

```
lib/
├── main.dart                     # bootstrap, ProviderScope, locale load
├── app/
│   ├── app.dart                  # MaterialApp.router, theme, locale, Directionality
│   ├── router/
│   │   ├── app_router.dart       # go_router config, auth guard
│   │   └── routes.dart           # route name/path constants
│   └── theme/                    # (details in design.md)
│       ├── app_theme.dart
│       ├── app_colors.dart
│       ├── app_typography.dart
│       └── app_spacing.dart
├── core/
│   ├── constants/                # currency code, thresholds, mock OTP
│   ├── extensions/               # context.l10n, money/date formatting
│   ├── models/                   # Money, TxnStatus, shared value objects
│   ├── utils/                    # validators, formatters (locale-aware)
│   └── widgets/                  # design-system components (see §5)
├── l10n/
│   ├── app_en.arb
│   └── app_ar.arb
├── data/
│   ├── mock/                     # JSON seed assets loaders
│   └── repositories/             # impls (in-memory) — one per domain
│       ├── auth_repository.dart
│       ├── wallet_repository.dart
│       ├── bills_repository.dart
│       ├── remittance_repository.dart
│       ├── gov_repository.dart
│       ├── insurance_repository.dart
│       ├── education_repository.dart
│       ├── rewards_repository.dart
│       └── history_repository.dart
└── features/
    ├── onboarding/               # A1–A8
    ├── home/                     # B1–B4
    ├── wallet/                   # C1–C7
    ├── remittance/               # D1–D5
    ├── bills/                    # E1–E9
    ├── government/               # F1–F5
    ├── insurance/                # G1–G3
    ├── education/                # H1–H3
    ├── rewards/                  # I1–I2
    ├── history/                  # J1–J2
    ├── profile/                  # J3–J9
    ├── ai_chat/                  # K1 — assistant chat, feature-local models/providers
    └── payment/                  # SHARED payment flow (confirm → PIN → receipt)
```

Each feature folder:
```
features/<name>/
├── models/          # feature-specific freezed models
├── providers/       # riverpod providers/notifiers
├── screens/         # one file per screen (product.md IDs in doc comments)
└── widgets/         # feature-private widgets
```

**Rule:** Screens contain layout only. All logic lives in providers. Repositories are the only place that touches mock data.

---

## 3. State & Data Flow

```
Screen (ConsumerWidget)
   │ watch
   ▼
Provider / AsyncNotifier  ── business rules, validation
   │ calls
   ▼
Repository (interface)    ── in-memory impl, seeded from assets/mock/*.json
   │ mutates
   ▼
In-memory stores (wallet ledger, txn list, points)  → notify via StreamProvider/state
```

Key global providers:

| Provider | Type | Purpose |
|---|---|---|
| `localeProvider` | Notifier<Locale> | EN/AR; persisted; drives Directionality |
| `authStateProvider` | Notifier<AuthState> | loggedOut / otpPending / needsPin / authed; go_router redirect listens to this |
| `walletProvider` | AsyncNotifier<Wallet> | balance + mini statement; single source of truth for money |
| `transactionsProvider` | AsyncNotifier<List<Txn>> | appended by every payment; History screen watches |
| `rewardsProvider` | AsyncNotifier<Rewards> | points; incremented on payment success |
| `paymentFlowProvider` | Notifier<PaymentFlowState> | shared confirm→PIN→result state machine (see §4) |
| `chatProvider` | AsyncNotifier<List<ChatMessage>> | `features/ai_chat/` conversation state; intent engine reads wallet/bills/rewards/transactions providers read-only, hands off money intents to `PaymentRequest` |

**Invariant:** any successful payment does exactly three things atomically in `PaymentService`: (1) debit wallet, (2) append transaction, (3) credit reward points. No screen implements this itself.

---

## 4. Shared Payment Flow (most important component)

All 8+ payment types (bill, recharge, fine, renewal, judiciary, SPF, insurance, education, wallet send, remittance, QR pay) converge into one reusable flow:

```
PaymentRequest {type, payee, lineItems[], amount, fee, currency, meta}
        │
        ▼
ConfirmSheet (review)  →  PinScreen (4-digit / biometric mock)  →  processing
        │ success                                                     │ failure
        ▼                                                             ▼
ReceiptScreen (animated success, ref no, rewards earned, share)   ErrorSheet (retry)
```

- Implemented in `features/payment/`. Any feature builds a `PaymentRequest` and calls `context.push(Routes.paymentConfirm, extra: request)`.
- Receipt returns a `PaymentResult` so the origin screen can update.
- PIN attempts: 3 max → cooldown message (mock).

---

## 5. Design-System Widgets (`core/widgets/`)

Build once, use everywhere (visual specs in design.md):

- `NPScaffold` — themed scaffold with safe-area + RTL-aware padding
- `NPButton` (primary / secondary / ghost, loading state)
- `NPCard` — elevated neopop-style card
- `NPAmountInput` — currency-formatted, 3 dp, quick chips
- `NPTextField` — labeled input with validation states
- `NPListTile` — transaction/biller row with leading icon, trailing amount
- `NPBottomSheet` — draggable sheet wrapper
- `NPShimmer` — loading skeleton
- `NPEmptyState` / `NPErrorState`
- `NPOtpField` — 6-box OTP
- `NPPinPad` — custom numeric pad for PIN
- `NPSuccessAnimation` — confetti/check Lottie
- `NPBadge`, `NPChip`, `NPSegmentedTabs`
- `NPBalanceCard` — hide/show balance
- `NPStatusTimeline` — remittance tracker

---

## 6. Routing Map (go_router)

```
/                       → Splash
/language               → Language Select
/onboarding             → Carousel
/login                  → Login
/otp                    → OTP
/profile-setup          → Profile Setup
/pin-setup              → PIN Setup
/home                   → Shell (bottom nav)
   /home                → Dashboard (B1)
   /history             → J1
   /rewards             → I1
   /profile             → J3
/scan                   → C5 (modal, center FAB)
/wallet/...             → C1–C6
/payment/confirm        → shared flow (§4)
/payment/receipt
/remit/...              → D1–D5
/bills/...              → E1–E7
/gov/...                → F1–F5
/insurance/...          → G1–G3
/education/...          → H1–H3
/notifications          → B2
/search                 → B3
/settings/...           → J4–J9
/assistant              → K1 (AI chat — Home entry via draggable FAB + services tile)
```

Auth guard: unauthenticated users are redirected to `/login`; authed users skip onboarding routes.

---

## 7. Localization & RTL Implementation Rules

1. Strings **only** via `context.l10n.<key>`. Adding a screen = adding keys to both ARB files (Arabic can be placeholder-translated for prototype but must exist).
2. Use `EdgeInsetsDirectional`, `AlignmentDirectional`, `PositionedDirectional`, `start/end` — **never** `left/right** in layout code.
3. Icons: prefer auto-mirroring material icons; wrap custom directional icons/illustrations that must flip in RTL with `Directionality`-aware transform (`matchTextDirection: true` for images where applicable).
4. Page transitions and swipe gestures must respect text direction (go_router default + `fullscreenDialog` where noted).
5. Amount + currency formatting through one utility: `Money.format(context)` → locale-aware separator, currency symbol placement per locale.
6. Test rule: every screen must be visually verified in both `en` and `ar` before considered done. Language switch in Settings (J9) rebuilds app in place — no restart.
7. Arabic font fallback configured in theme (see design.md).

---

## 8. Mock Data Layer

- Seed JSON assets under `assets/mock/`: `billers.json`, `accounts.json`, `transactions.json`, `beneficiaries.json`, `fines.json`, `vehicles.json`, `institutions.json`, `cards.json`, `quotes.json`.
- Repositories load JSON once at startup into in-memory stores; all mutations (payments, top-ups, new beneficiaries) update memory so the demo feels live within a session.
- Artificial latency: wrap repo calls in `Future.delayed(300–800ms)` so shimmers/loaders are visible.
- Deterministic demo values: mock OTP `123456`; any 4-digit PIN accepted at setup and then enforced; bill fetch returns stable pseudo-random amounts keyed by account number.

---

## 9. Error, Loading & Empty Conventions

- Every async screen renders through `AsyncValue.when` → `NPShimmer` / content / `NPErrorState(retry)`.
- Every list has an `NPEmptyState` with illustration + CTA.
- Payment failures only occur when explicitly triggered (e.g., amount > balance → insufficient funds sheet with Top-up CTA).

---

## 10. Conventions & Quality Bar

- File naming: `snake_case.dart`; one screen per file; screen doc comment references product.md ID (e.g., `/// Screen E5 — Bill Detail`).
- No business logic in widgets; no repository access from widgets.
- Const constructors wherever possible; extract widgets > 60 lines.
- Commit-sized tasks: build feature-by-feature in the order: theme/core widgets → onboarding → home shell → wallet + shared payment flow → bills → government → remittance → rewards → remaining modules → polish pass (animations, haptics, RTL audit).
- Definition of done per screen: EN + AR verified, loading/empty/error present, navigation wired, mock data realistic.
