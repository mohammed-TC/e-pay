# Emral Pay

Flutter prototype of **Emral Pay** — an all-in-one e-wallet + bill payment super-app (client demo). Fully offline: every data interaction runs through mock in-memory repositories seeded from JSON assets. English + Arabic, full LTR/RTL.

- **Package id:** `com.turbocode.epay`
- **Design language:** CRED-inspired premium minimalism — light-first, NeoPop Plate physics, emerald accent.

## Docs

Read these before touching code — they're the source of truth, not this file:

| Doc | Covers |
|---|---|
| `docs/product.md` | Scope, modules, screen IDs (A1–J9), mock data requirements, demo script |
| `docs/architecture.md` | Stack, folder structure, shared payment flow, RTL rules |
| `docs/design.md` | Design tokens, NeoPop Plate physics, motion spec, component specs |
| `docs/tasks.md` | Build order by phase — current progress tracked here |
| `CLAUDE.md` | Non-negotiable rules for AI-assisted contributions |

## Stack

Flutter 3.44+ / Dart 3.12+ · Riverpod (codegen) · go_router · freezed + json_serializable · flutter_localizations + intl · shared_preferences · flutter_animate + Lottie · google_fonts.

## Prerequisites

- Flutter SDK (stable channel, 3.44+): `flutter --version`
- Xcode (iOS) and/or Android Studio + SDK (Android)
- Run `flutter doctor` and resolve any `✗` before continuing

## Getting started

```bash
git clone <repo-url> e-pay && cd e-pay
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # generates *.freezed.dart, *.g.dart
flutter gen-l10n                                            # generates lib/l10n/app_localizations*.dart
```

## Running

List available devices/emulators:

```bash
flutter devices
flutter emulators
```

**Android emulator:**

```bash
flutter emulators --launch <emulator_id>   # e.g. Pixel_10_Pro_XL
flutter run
```

**iOS simulator** (first time only, downloads a runtime if none installed):

```bash
xcodebuild -downloadPlatform iOS
open -a Simulator
flutter run
```

`flutter run` auto-attaches to whichever device is running. Hot reload with `r`, hot restart with `R`.

## Common commands

| Task | Command |
|---|---|
| Run app | `flutter run` |
| Static analysis (must be zero issues) | `flutter analyze` |
| Regenerate freezed/riverpod/json codegen | `dart run build_runner build --delete-conflicting-outputs` |
| Watch codegen during active development | `dart run build_runner watch --delete-conflicting-outputs` |
| Regenerate localizations after ARB edits | `flutter gen-l10n` |
| Run tests | `flutter test` |

## Project structure

```
lib/
├── main.dart              # bootstrap: load persisted locale, runApp
├── app/                    # MaterialApp.router, theme, go_router config
├── core/                   # Money, constants, extensions, design-system widgets
├── l10n/                   # app_en.arb / app_ar.arb + generated AppLocalizations
├── data/                   # mock JSON assets + in-memory repositories
└── features/               # one folder per module (onboarding, wallet, bills, ...)
    └── <name>/{models,providers,screens,widgets}/
```

Each feature: screens are layout-only, all logic lives in Riverpod providers, repositories are the only data access. See `docs/architecture.md` §2–§3 for the full contract.

## Localization

- All user-facing strings live in `lib/l10n/app_en.arb` + `lib/l10n/app_ar.arb` — never hardcode strings in widgets.
- Access via `context.l10n.<key>` (extension in `core/extensions/build_context_l10n.dart`).
- After adding/editing keys: `flutter gen-l10n`.
- No `left`/`right` in layout — use `EdgeInsetsDirectional` / `start`/`end` so Arabic RTL mirrors correctly.

## Demo constants

- Mock OTP: `123456` (any mobile number accepted)
- Seed wallet balance: `250.000 OMR`
- Rewards: 1 pt per 1 OMR spent; redemption threshold 500 pts (seed 320)
- Currency: `OMR`, always 3 decimal places (`core/models/money.dart`)

## Build status

Foundation (Phase 0) is complete — theme, l10n, `Money` value object, go_router skeleton, app boots to a placeholder Splash. See `docs/tasks.md` for what's next and current checklist state.
