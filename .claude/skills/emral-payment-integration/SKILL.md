---
name: emral-payment-integration
description: How to plug a new payment type into Emral Pay's shared payment flow. Use whenever a screen needs to move money — never build a bespoke confirm/PIN/receipt.
---

# Emral Payment Integration

Full contract: `.claude/rules/payment-flow.md`, `docs/architecture.md` §4.

1. **Build a `PaymentRequest`** in the originating feature: `{type, payee, lineItems[], amount, fee, currency, meta}`. `type` identifies the payment kind (bill, recharge, fine, renewal, judiciary, SPF, insurance, education, wallet send, remittance, QR pay) for receipt copy/icon.
2. **Route to the shared flow**: `context.push(Routes.paymentConfirm, extra: request)`. Do not implement your own confirm sheet, PIN pad, or receipt screen.
3. Shared flow (`features/payment/`) handles: `ConfirmSheet` (review) → `PinScreen` (4-digit, 3 attempts, shake+cooldown on failure) → processing → `ReceiptScreen` (success takeover, confetti, rewards fly-in) or `ErrorSheet` (retry).
4. Behind the scenes, `PaymentService` performs the atomic invariant: debit wallet → append transaction → credit reward points (1 pt / 1 OMR). Never replicate this sequence in your feature code.
5. **Handle the `PaymentResult`** returned to the origin screen (e.g. refresh a list, pop back to a hub, show "pay another" CTA) — this is the only payment-outcome logic that belongs in the feature.
6. Insufficient balance is handled by the shared flow's insufficient-funds sheet (Top-up CTA) — don't pre-validate balance in the feature screen.
