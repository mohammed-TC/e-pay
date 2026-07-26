# tasks.md — Emral Pay Build Order

> Prioritized so the app **runs end-to-end on mock data as early as possible** (Phases 0–3 = runnable demo core). Work strictly top-down. Check off with `[x]`. App must compile and run at the end of every phase.

---

## Phase 0 — Foundation (app boots)
- [x] Flutter project init, packages from architecture.md §1, strict lints
- [x] Folder structure per architecture.md §2
- [x] Theme: `app_colors.dart`, `app_typography.dart`, `app_spacing.dart`, light + dark `ThemeData` (design.md §2–§4)
- [x] L10n setup: `app_en.arb`, `app_ar.arb`, `context.l10n` extension, `localeProvider` (persisted)
- [x] `Money` value object + locale-aware formatter (3 dp)
- [x] go_router skeleton with all route constants + auth redirect stub
- [x] App runs → shows placeholder Splash

## Phase 1 — Mock Data Layer (everything has data)
- [x] All seed JSON assets in `assets/mock/` per product.md §6: billers, accounts, transactions (30), beneficiaries, fines, vehicles, institutions, cards, quotes
- [x] Freezed models for every domain entity + codegen
- [x] All 9 repositories (architecture.md §2) as in-memory stores loading seeds, 300–800ms artificial latency
- [x] Global providers: `authStateProvider`, `walletProvider`, `transactionsProvider`, `rewardsProvider`
- [x] `PaymentService` atomic invariant: debit wallet → append txn → credit points
- [x] Smoke test: repos load, balance = 250.000, history = 30 items

## Phase 2 — Design System Widgets (build vocabulary once)
- [x] `NPCard` + `NPButton` with NeoPop Plate physics incl. RTL shadow flip + haptics (design.md §4)
- [x] `NPScaffold`, `NPTextField`, `NPAmountInput`, `NPListTile`, `NPBottomSheet`
- [x] `NPShimmer`, `NPEmptyState`, `NPErrorState`
- [x] `NPOtpField`, `NPPinPad`, `NPBalanceCard`, `NPBadge`, `NPChip`, `NPSegmentedTabs`, `NPStatusTimeline`
- [x] `NPSuccessAnimation` (check draw + confetti)
- [x] Temporary widget gallery screen to visually verify all components in EN/AR, light/dark

## Phase 3 — Auth + Shell + Shared Payment Flow (demo spine) ⭐
- [x] A1 Splash → A2 Language Select (live RTL flip) → A3 Onboarding
- [x] A4 Login → A5 OTP (`123456`) → A6 Profile → A7 PIN setup → A8 Biometric toggle
- [x] Session persistence + auth guard working
- [x] B4 Bottom nav shell (Home / History / Rewards / Profile + Scan FAB)
- [x] B1 Home Dashboard fully wired to mock data (balance count-up, quick actions, services grid, recent 5 txns)
- [x] **Shared payment flow** (`features/payment/`): PaymentRequest → ConfirmSheet → PIN (3 attempts, shake) → processing → Success takeover (confetti, rewards fly-in) / ErrorSheet
- [x] J1 Transaction History (filters, month groups) + J2 Detail
- ✅ **Checkpoint: login → home → (flow ready) → history runs smoothly** — verified via `flutter analyze` (0 issues), `flutter test` (smoke test passes), and a `kDebugMode`-gated test-payment trigger on Home exercising the full confirm→PIN→receipt flow end-to-end (real Bills/Wallet triggers land in Phase 4/5). Rewards/Profile shell tabs stay placeholder until Phase 6/8 per the build order.

## Phase 4 — Wallet (first full money loop)
- [x] C1 Wallet Home, C2 Top-up (quick chips, mock sources)
- [x] C3 Send Money (3 tabs, mock contacts), C4 Request Money (pending list)
- [x] C5 Scan & Pay (mock scanner + manual entry), C6 My QR
- [x] Insufficient-balance sheet → Top-up CTA (built in Phase 3's shared flow — `payment/widgets/error_sheet.dart`; verified it still fires from wallet-originated `PaymentRequest`s)
- ✅ **Checkpoint: top-up → send → QR pay all hit shared flow, balance/history/points update live** — verified via `flutter analyze` (0 issues) and `flutter test` (smoke test passes); all 6 screens build `PaymentRequest`s that route through the existing shared confirm→PIN→receipt flow, `PaymentService`'s debit/append/credit invariant is untouched (`features/payment/` and `core/` stayed frozen per CLAUDE.md).

## Phase 5 — Bills & Recharges (demo centerpiece)
- [x] E1 Categories → E2 Biller grid (fictional brands) → E3 Account entry (+ fetch-by-mobile, save nickname)
- [x] E4 Saved accounts (swipe delete) → E5 Bill Detail (PDF viewer, due-date chip)
- [x] E6 Prepaid recharge (plans + VAT) + E7 Smart meter
- [x] E8 Payment method sheet → shared flow → E9 receipt with rewards badge
- ✅ **Checkpoint: demo script steps 1–4 fully runnable** — verified via `flutter analyze` (0 issues), `flutter test` (smoke test passes, now also asserting `accounts`/`recharge_plans`/`fetchMeterCharge`), and a manual on-device walk on the Android emulator: Home → Bills → Electricity → VoltGrid → saved "Home Electricity" account → Bill Detail (dashed-divider receipt card, due-date chip, line items) → View PDF (renders the mock `sample_bill.pdf` via pdfx) → Payment Method picker (wallet/cards/Apple Pay/add-card all selectable) → Pay Bill → shared ConfirmSheet (correct payee/amount) → PIN screen (wrong-PIN path shows "2 attempts left", confirming the existing Phase 3 PIN flow still fires correctly from a Phase 5 origin). E6/E7 screens render and are wired; `payment/` and `core/` stayed untouched (frozen per CLAUDE.md) — new bills-only models/widgets live under `features/bills/`.

## Phase 6 — Government + Rewards (demo differentiators)
- [ ] F1 Hub → F2 Traffic fines (multi-select, sticky total bar) → pay
- [ ] F3 Vehicle renewal, F4 Judiciary, F5 Social Protection
- [ ] I1 Rewards home (animated counter, progress ring) → I2 Redeem (locked/unlock states, gold burst)

## Phase 7 — Remittance
- [ ] D1 Home (country select, FX card, dual input)
- [ ] D2/D3 Beneficiaries CRUD
- [ ] D4 Send flow → shared payment flow
- [ ] D5 Tracker timeline with mock status progression

## Phase 8 — Remaining Modules
- [ ] G1–G3 Insurance (quote compare → policy PDF to "My Policies")
- [ ] H1–H3 Education fees
- [ ] B2 Notifications, B3 Search
- [ ] J3 Profile, J4 Saved cards, J5 Security, J6 Branch locator (static map), J7 Self meter reading, J8 Support, J9 Settings (live language + theme switch)

## Phase 9 — AI Assistant ("Ask Emral")
- [ ] K1 Chat screen: bubbles, typing indicator, quick-reply chips, input bar
- [ ] Rule-based intent engine (offline, no LLM): bills due, wallet balance, rewards status, recent txns, pay/send handoff to shared payment flow
- [ ] Rich cards: bill reminder, wallet summary, rewards, payment shortcut (preview-only, never inline-confirms)
- [ ] Home entry points: draggable circular blob FAB (wobble + highlight pulse, snap-to-edge) + services-grid tile
- [ ] `/assistant` route wired; ARB keys (canned replies included) both locales
- [ ] Proactive follow-up after a chat-originated bill payment: cross-sell nudge (vehicle registration renewal), mock "maybe later" reminder, AutoPay opt-in offer on the paid account — multi-turn yes/no/later dialogue via `PendingOffer` state, no LLM

## Phase 10 — Polish & Demo Hardening
- [ ] Motion pass: entrance staggers, pull-to-refresh, tab morphs, reduced-motion fallback
- [ ] Full RTL audit — every screen screenshot-checked in Arabic
- [ ] Dark mode audit — every screen
- [ ] Copy pass per design.md §9 (both ARB files complete, no placeholders)
- [ ] Empty/error/loading audit on every list
- [ ] `flutter analyze` zero warnings; remove widget gallery from release nav
- [ ] Dry-run the full demo script (product.md §8) twice, EN and AR

## Phase 11 — Car Rental Module (Module L, screens + booking)
- [x] Mock data: `rental_locations.json`, `rental_vehicle_classes.json`, `rental_addons.json`; freezed models + codegen
- [x] `RentalRepository` (locations/classes/addons fetch, booking save/fetch, pricing helpers) + providers (search, results, draft selection, derived pricing, bookings)
- [x] L1 Rental Search (location picker, pickup/return date + morning/evening chips)
- [x] L2 Vehicle Results (class cards + trip total, rewards-redeemable banner)
- [x] L3 Vehicle & Extras (spec card, points-redeem toggle, add-on toggles incl. Full Damage Protection double-points badge, sticky summary)
- [x] L4 Booking Review → shared payment flow (`TxnType.carRental`) → post-success bonus-points credit + booking record saved
- [x] L5 My Rentals (booking history list, empty-state CTA back to L1)
- [x] Home services-grid entry tile wired to L1
- [ ] **Checkpoint**: full L1→L5 flow runs end-to-end on mock data, EN + AR/RTL verified, `flutter analyze` zero warnings — `flutter analyze` is clean and L1 (location picker, date pickers, morning/evening chips) was live-verified on-device in EN; L2–L5 and the AR/RTL pass still need a manual on-device walk before this checkbox is ticked

## Phase 12 — AI Assistant: Car Rental Scenario (Module K extension)
- [x] `ChatIntent.rentalBooking` + new `chat_rental_flow.dart` dialogue engine (location → dates → class options → points redemption → add-on cross-sell → licence-expiry reminder → airport roadside-assistance cross-sell → summary), reusing Module L's repository/models
- [x] `RentalChatStage`/`RentalChatContext` multi-turn state (mirrors the existing `PendingOffer` vehicle-renewal pattern) threaded through `chat_provider.dart`; booking payment reuses the existing `ChatCardData.paymentShortcut` card (no new card type needed — the class-options/add-on beats are plain-text replies, matching the script)
- [x] Post-payment summary + loyalty-bonus point credit + `RentalBooking` saved to L5 My Rentals via `onPaymentCompleted`
- [x] ARB keys for every new canned reply (both locales) + a "Rent a car" quick-reply chip
- ✅ **Checkpoint**: `flutter analyze` zero warnings, `flutter test` passes. Full live click-through of the scripted conversation (EN + AR/RTL) not yet done on-device — same open item as Phase 11's checkpoint

---

**Priority logic:** Phases 0–3 make the app *run smoothly on mock data* with the spine (auth → home → payment flow → history) — everything after is plugging modules into that spine. If demo time runs short, ship after Phase 6: it covers the entire client script except remittance.
