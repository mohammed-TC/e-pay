# Shared Payment Flow

Source: `docs/architecture.md` §4.

- **Every payment routes through `features/payment/`.** All 8+ payment types (bill, recharge, fine, renewal, judiciary, SPF, insurance, education, wallet send, remittance, QR pay) build a `PaymentRequest {type, payee, lineItems[], amount, fee, currency, meta}` and push to `Routes.paymentConfirm` with it as `extra`.
- **Never inline confirm/PIN/receipt.** No feature screen implements its own confirmation sheet, PIN entry, or success/receipt UI — always delegate to the shared `ConfirmSheet → PinScreen → ReceiptScreen`/`ErrorSheet` flow.
- **Flow returns a `PaymentResult`** to the origin screen so it can update local UI state after the shared flow completes.
- **PIN attempts**: 3 max → cooldown message (mock), shake animation on wrong entry.
- **`PaymentService` atomic invariant**: every successful payment does exactly three things, and only in `PaymentService` — (1) debit wallet, (2) append transaction, (3) credit reward points (1 pt / 1 OMR). No screen or provider outside `PaymentService` implements this sequence itself.
- Insufficient balance → insufficient-funds sheet with Top-up CTA, not a generic error.
