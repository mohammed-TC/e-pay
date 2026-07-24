# CLAUDE.md — Emral Pay Flutter Prototype

## What this project is
A client-demo Flutter prototype of **Emral Pay**, an all-in-one e-wallet + bill payment super-app. Fully offline — every data interaction goes through mock in-memory repositories seeded from JSON assets. English + Arabic with full LTR/RTL.

Package id: `com.turbocode.epay`.

## Read these before writing code
1. `docs/product.md` — scope, modules, screen IDs (A1–J9), mock data requirements, demo script
2. `docs/architecture.md` — stack (Riverpod, go_router, freezed), folder structure, shared payment flow, RTL implementation rules
3. `docs/design.md` — tokens, NeoPop Plate physics, motion spec, component specs
4. `docs/tasks.md` — build order. **Always work on the current phase's tasks in order; check items off as completed.**

## Non-negotiable rules
- No hardcoded strings — every user-facing string in `app_en.arb` + `app_ar.arb`
- No `left`/`right` in layouts — directional widgets only (`EdgeInsetsDirectional`, `start`/`end`)
- No business logic in widgets — providers only; repositories are the only data access
- Every payment goes through the shared payment flow (`features/payment/`) — never inline a confirm/PIN/receipt
- Every async screen: shimmer / content / error / empty states
- Every screen doc-commented with its product.md ID (e.g. `/// Screen E5 — Bill Detail`)
- Tappables use NPButton/NPCard plate physics — no Material ripple/elevation
- App must build and run after every phase in tasks.md — never leave the app broken between phases

## Commands
- Run: `flutter run`
- Codegen (after model/provider changes): `dart run build_runner build --delete-conflicting-outputs`
- Analyze: `flutter analyze` (zero warnings before marking a task done)
- L10n regen: `flutter gen-l10n`

## Demo constants
- Mock OTP: `123456` (any mobile number accepted)
- Seed wallet balance: 250.000 OMR
- Rewards: 1 pt per 1 OMR; redemption threshold 500 pts (seed 320)
- Currency: `OMR`, 3 decimal places

## Definition of done (per screen)
Builds clean → EN verified → AR/RTL verified → loading/empty/error present → navigation wired → mock data realistic → task checked off in docs/tasks.md

## gstack
- Skip `/office-hours` and `/plan-ceo-review` — product decisions are final in `docs/`.
- Run `/review` after completing each phase; `/qa` from Phase 3 onward.
- After Phase 3: `/freeze features/payment/` and `core/` — payment flow and design system are locked; changes require explicit user approval.
- `/retro` after Phase 9.
