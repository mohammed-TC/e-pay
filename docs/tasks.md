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
- [ ] A1 Splash → A2 Language Select (live RTL flip) → A3 Onboarding
- [ ] A4 Login → A5 OTP (`123456`) → A6 Profile → A7 PIN setup → A8 Biometric toggle
- [ ] Session persistence + auth guard working
- [ ] B4 Bottom nav shell (Home / History / Rewards / Profile + Scan FAB)
- [ ] B1 Home Dashboard fully wired to mock data (balance count-up, quick actions, services grid, recent 5 txns)
- [ ] **Shared payment flow** (`features/payment/`): PaymentRequest → ConfirmSheet → PIN (3 attempts, shake) → processing → Success takeover (confetti, rewards fly-in) / ErrorSheet
- [ ] J1 Transaction History (filters, month groups) + J2 Detail
- ✅ **Checkpoint: login → home → (flow ready) → history runs smoothly**

## Phase 4 — Wallet (first full money loop)
- [ ] C1 Wallet Home, C2 Top-up (quick chips, mock sources)
- [ ] C3 Send Money (3 tabs, mock contacts), C4 Request Money (pending list)
- [ ] C5 Scan & Pay (mock scanner + manual entry), C6 My QR
- [ ] Insufficient-balance sheet → Top-up CTA
- ✅ Checkpoint: top-up → send → QR pay all hit shared flow, balance/history/points update live

## Phase 5 — Bills & Recharges (demo centerpiece)
- [ ] E1 Categories → E2 Biller grid (fictional brands) → E3 Account entry (+ fetch-by-mobile, save nickname)
- [ ] E4 Saved accounts (swipe delete) → E5 Bill Detail (PDF viewer, due-date chip)
- [ ] E6 Prepaid recharge (plans + VAT) + E7 Smart meter
- [ ] E8 Payment method sheet → shared flow → E9 receipt with rewards badge
- ✅ Checkpoint: demo script steps 1–4 fully runnable

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

## Phase 9 — Polish & Demo Hardening
- [ ] Motion pass: entrance staggers, pull-to-refresh, tab morphs, reduced-motion fallback
- [ ] Full RTL audit — every screen screenshot-checked in Arabic
- [ ] Dark mode audit — every screen
- [ ] Copy pass per design.md §9 (both ARB files complete, no placeholders)
- [ ] Empty/error/loading audit on every list
- [ ] `flutter analyze` zero warnings; remove widget gallery from release nav
- [ ] Dry-run the full demo script (product.md §8) twice, EN and AR

---

**Priority logic:** Phases 0–3 make the app *run smoothly on mock data* with the spine (auth → home → payment flow → history) — everything after is plugging modules into that spine. If demo time runs short, ship after Phase 6: it covers the entire client script except remittance.
