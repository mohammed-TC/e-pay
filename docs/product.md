# Emral Pay — Product Requirements Document

> **Purpose of this file:** Source of truth for the Emral Pay Flutter prototype (client demo). Claude Code should treat this as the product spec. UI/UX direction lives in `design.md`. Technical structure lives in `architecture.md`.

---

## 1. Product Overview

**Emral Pay** is an all-in-one digital wallet and payments super-app. It lets users:

- Hold and manage a mobile wallet (top-up, send, receive, request money)
- Pay utility bills (electricity, water, telecom, internet) and view bills as PDF
- Recharge prepaid mobile and smart electricity meters
- Pay government services: traffic fines, vehicle registration renewal, judiciary fees, social protection contributions
- Buy vehicle insurance instantly
- Pay education fees for schools and universities
- Send money internationally (remittance) with beneficiary management
- Scan & Pay merchants via QR
- Earn and redeem rewards on every payment

**Prototype scope:** This is a client demo prototype. All backend interactions are mocked (local JSON / in-memory repositories). No real payment processing, no real KYC. Flows must *feel* complete end-to-end.

**Design language:** CRED-inspired premium minimalism (dark-first, NeoPop-style depth, generous spacing, celebratory motion). See `design.md`.

---

## 2. Target Personas

| # | Persona | Primary Jobs |
|---|---------|--------------|
| P1 | **Household bill-payer** (30–55) | Pays monthly electricity/water/telecom for family; saves multiple accounts with nicknames; wants reminders and history |
| P2 | **Vehicle owner** (25–50) | Checks & pays traffic fines, renews vehicle registration, buys insurance in minutes |
| P3 | **Parent / student** | Pays school/university fees each term; needs receipts |
| P4 | **Expat / remitter** | Sends money home internationally; manages bills for family remotely; tracks transfer status |
| P5 | **Everyday spender** | QR Scan & Pay at merchants; sends/requests money from friends |
| P6 | **Prepaid user** | Recharges mobile and smart electricity meter; wants fastest possible repeat recharge |

---

## 3. Localization Requirements (CRITICAL)

- **Languages:** English (`en`) and Arabic (`ar`).
- **Direction:** Full **LTR (English)** and **RTL (Arabic)** mirroring. Every screen, icon direction, navigation gesture, text alignment, and animation must respect `Directionality`.
- Language is chosen on first launch (Language Select screen) and changeable anytime in Settings. Persist choice locally.
- All user-facing strings via ARB files (`flutter_localizations` + `intl`). **No hardcoded strings anywhere.**
- Numerals: Western Arabic numerals (0-9) in both locales for amounts; currency formatting locale-aware.
- Currency: use a neutral demo currency code `OMR` with 3 decimal places (configurable constant).
- Dates: locale-formatted.
- Icons with inherent direction (back arrows, chevrons, progress) must flip in RTL. Use directional widgets (`EdgeInsetsDirectional`, `AlignmentDirectional`, `Icons.arrow_back` auto-mirrors, etc.).

---

## 4. Modules, Screens & Functional Requirements

### Module A — Onboarding & Authentication

| ID | Screen | Requirements |
|----|--------|--------------|
| A1 | Splash | Animated logo, version display, route to A2 (first run) or A5/Home (returning) |
| A2 | Language Select | EN / AR cards; sets locale + direction instantly; continue |
| A3 | Onboarding Carousel | 3 slides (Wallet, Bills, Rewards), skip, page indicator, animated illustrations |
| A4 | Login / Register | Mobile number input with country code, validation, CTA → OTP |
| A5 | OTP Verification | 6-digit boxes, auto-advance, 30s resend timer, mock OTP `123456` |
| A6 | Profile Setup | Full name, email (optional), avatar picker (first run only) |
| A7 | PIN Setup | Create 4-digit wallet PIN + confirm; used for all payment confirmations |
| A8 | Biometric Enable | Prompt to enable Face ID / fingerprint (mock toggle in prototype) |

**Rules:** Session persists locally. PIN (or biometric) gate required before any money-moving confirmation. Mock any mobile number as valid.

### Module B — Home & Global

| ID | Screen | Requirements |
|----|--------|--------------|
| B1 | Home Dashboard | (1) Wallet balance card with hide/show toggle, (2) quick actions row: Top-up, Send, Scan, Request, (3) services grid: Bills, Recharge, Government, Insurance, Education, Remittance, Rewards, More, (4) promo banner carousel, (5) recent transactions (last 5) with "view all", (6) rewards points chip |
| B2 | Notifications | List of payment reminders, promos, transaction alerts; unread badges; mark-as-read |
| B3 | Global Search | Search billers/services by name; recent searches |
| B4 | Bottom Navigation | 4 tabs: Home, History, Rewards, Profile (+ center Scan FAB) |

### Module C — Wallet

| ID | Screen | Requirements |
|----|--------|--------------|
| C1 | Wallet Home | Balance, mini statement (10 latest), actions: Top-up / Send / Request / My QR |
| C2 | Top-up | Amount entry with quick chips (5/10/20/50), payment source selector (saved card, new card, Apple Pay mock), fee display, confirm → PIN → success |
| C3 | Send Money | Tabs: To Mobile / To Wallet / To Bank. Contact picker (mock contacts), amount, note field |
| C4 | Request Money | Payer + amount + note; "Pending requests" list with accept/decline (mock) |
| C5 | Scan & Pay | Camera view (mock scanner overlay), manual code entry fallback, merchant confirm sheet → amount → PIN → success |
| C6 | My QR | Personal QR display, share button |
| C7 | Payment Confirmation (shared) | Review sheet: recipient, amount, fee, total → PIN/biometric → animated success receipt (share/download) |

**Rules:** Wallet balance is a local mock ledger; every transaction mutates it and appends to history. Insufficient balance shows top-up prompt.

### Module D — International Remittance

| ID | Screen | Requirements |
|----|--------|--------------|
| D1 | Remittance Home | Destination country selector, live FX rate card (mock rates), "you send / they receive" dual input |
| D2 | Beneficiary List | Saved beneficiaries, add/edit/delete, search |
| D3 | Add Beneficiary | Name, bank, IBAN/account, relationship, purpose of transfer |
| D4 | Send Flow | Amount → rate + fee breakdown → review → PIN → processing |
| D5 | Transfer Tracker | Status timeline: Initiated → Processing → Sent → Delivered (mock progression), transfer history |

### Module E — Bills & Recharges

| ID | Screen | Requirements |
|----|--------|--------------|
| E1 | Bill Categories | Electricity, Water, Telecom, Internet, TV/Entertainment |
| E2 | Biller Select | Grid of provider logos per category (use generic mock brands: "VoltGrid", "AquaFlow", "TeleOne", "SkyNet", etc.) |
| E3 | Account Entry | Account number input, optional "fetch by mobile number" (electricity), save with nickname toggle |
| E4 | Saved Accounts | Nicknamed accounts per biller, multi-account, swipe to delete, tap to fetch bill |
| E5 | Bill Detail | Amount due, due date, breakdown, "View PDF" (mock PDF viewer), pay CTA |
| E6 | Prepaid Recharge | Provider select → plan cards or custom amount → VAT line item |
| E7 | Smart Meter Recharge | Meter number entry, amount, VAT |
| E8 | Payment Method Sheet | Wallet (default) / saved card / new card / Apple Pay mock |
| E9 | Receipt | Success animation, reference number, rewards earned badge, share/download, "pay another bill" |

**Rules:** Bill fetch returns mock bill data (randomized realistic amounts). Paying a bill: deducts wallet, adds history entry, credits reward points (1 pt per 1 OMR).

### Module F — Government Services

| ID | Screen | Requirements |
|----|--------|--------------|
| F1 | Gov Services Hub | Tiles: Traffic Fines, Vehicle Renewal, Judiciary Fees, Social Protection |
| F2 | Traffic Fines | Lookup by civil ID or plate number → fines list with checkboxes → multi-select total → pay |
| F3 | Vehicle Renewal | Plate entry → vehicle details card → insurance validity check (mock) → renewal fee → pay |
| F4 | Judiciary Payment | Case reference entry → fee detail → pay |
| F5 | Social Protection | ID lookup → contribution amount → pay |

### Module G — Insurance

| ID | Screen | Requirements |
|----|--------|--------------|
| G1 | Insurance Home | Vehicle insurance entry card, "my policies" list |
| G2 | Quote Flow | Vehicle details form → 2–3 mock quote cards (compare) → select |
| G3 | Policy Payment & Delivery | Pay → policy document (mock PDF) delivered to "My Policies" |

### Module H — Education Fees

| ID | Screen | Requirements |
|----|--------|--------------|
| H1 | Institution List | ~8 mock schools/universities with search |
| H2 | Student Lookup | Student ID entry → student name + outstanding fee card |
| H3 | Fee Payment | Pay → receipt |

### Module I — Rewards

| ID | Screen | Requirements |
|----|--------|--------------|
| I1 | Rewards Home | Points balance (animated counter), earn history, progress bar to redemption threshold (500 pts) |
| I2 | Redeem | Redemption options (wallet cashback, vouchers); locked state below threshold; celebratory unlock animation |

### Module J — History & Profile

| ID | Screen | Requirements |
|----|--------|--------------|
| J1 | Transaction History | All transactions; filters: type, date range, status; grouped by month; tap → detail |
| J2 | Transaction Detail | Full breakdown, status, reference, re-download receipt |
| J3 | Profile | Avatar, name, mobile, edit |
| J4 | Saved Cards | Card list (masked), add card form (mock validation), delete, set default |
| J5 | Security Settings | Change PIN, biometric toggle, active sessions (mock) |
| J6 | Branch Locator | Map view (mock/static map ok) with branch + kiosk pins, list toggle |
| J7 | Self Meter Reading | Meter number + reading input + photo attach (mock) → submitted state |
| J8 | Support | FAQ accordion, contact options, mock live chat |
| J9 | Settings | Language switch (EN/AR with instant RTL flip), notification toggles, about, privacy, logout |

---

### Module K — AI Assistant

| ID | Screen | Requirements |
|----|--------|--------------|
| K1 | Assistant Chat ("Ask Emral") | Conversation UI: assistant/user bubbles, quick-reply chips, typing indicator. Rule-based (offline, no LLM/network) intent engine answers from existing mock data: wallet balance, bills due (saved accounts), rewards status, recent transactions. Rich cards (bill reminder, wallet summary, rewards, payment shortcut) render inline. Any pay/send intent builds a `PaymentRequest` and hands off to the shared payment flow (never an inline confirm) — payment-flow.md |

**Entry points:** draggable circular "blob" FAB on Home Dashboard (B1) — see design.md §11 — plus a static tile in the B1 services grid for discoverability.

**Rules:** All assistant reply copy goes through `context.l10n.*` like any other screen — no hardcoded canned strings, even for mock "AI" text.

## 5. Cross-cutting Rules

1. **Every payment flow ends in the shared Confirmation → PIN → Success Receipt pattern** (C7/E9). One reusable flow component.
2. **Rewards accrue on every successful payment** (1 pt / 1 OMR spent), shown on receipt.
3. **All money-moving actions require PIN or biometric.**
4. **Empty states, loading shimmers, and error states required for every list/fetch screen.**
5. **All amounts** use `Money` value object (amount + currency, 3 dp).
6. **Offline/demo mode:** app must run fully without network.

## 6. Mock Data Requirements

- 1 demo user (pre-seeded after OTP), wallet balance 250.000 OMR
- 12 billers across 5 categories (generic fictional brands — no real company names)
- 6 saved biller accounts, 3 saved cards, 4 beneficiaries
- 30 historical transactions across all types (last 3 months)
- 5 traffic fines, 1 vehicle, 2 insurance quotes, 3 institutions with students
- 320 reward points pre-seeded (below 500 threshold → shows progress)

## 7. Out of Scope (Prototype)

Real payments, real KYC/AML, real OTP/SMS, push notifications backend, real maps SDK (static ok), deep links, accessibility audit (basic semantics only).

## 8. Demo Script (happy path for client)

1. Launch → Arabic select → observe full RTL → switch to English in settings later
2. Login with any number → OTP `123456` → PIN setup
3. Home tour → pay an electricity bill from saved account → see PDF → pay with wallet → success + rewards
4. QR Scan & Pay a merchant
5. Send remittance to a saved beneficiary → show tracker timeline
6. Check traffic fines → multi-select pay
7. Rewards screen → progress toward redemption
8. Settings → flip language live → show mirrored UI
