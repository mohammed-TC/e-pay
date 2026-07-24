---
name: emral-screen-builder
description: Repeatable workflow for building any Emral Pay screen from its product.md ID. Use whenever building or rebuilding a specific screen (not covered by a more specific flow like payment integration).
---

# Emral Screen Builder

1. **Check `docs/tasks.md`** — confirm the screen belongs to the current (or explicitly requested) phase.
2. **Read the screen's row in `docs/product.md` §4** — requirements, and cross-check `docs/design.md` §7 for any screen-specific art direction.
3. **Use core widgets only** (`lib/core/widgets/`: `NPScaffold`, `NPButton`, `NPCard`, `NPAmountInput`, `NPTextField`, `NPListTile`, `NPBottomSheet`, `NPShimmer`, `NPEmptyState`/`NPErrorState`, etc.) — never raw Material equivalents. See `.claude/rules/design-tokens.md`.
4. **Wire provider + repository**: create/extend the feature's Riverpod provider in `providers/`; provider calls the repository in `lib/data/repositories/`; screen only watches the provider. See `.claude/rules/flutter-conventions.md`.
5. **Add ARB keys** to both `lib/l10n/app_en.arb` and `app_ar.arb` for every string on the screen.
6. **Verify EN**, then switch locale and **verify AR/RTL** (layout mirrors, plate shadows flip, no clipped Arabic text).
7. **Check the task off** in `docs/tasks.md` only once `flutter analyze` is clean and all four states (loading/content/error/empty) are present where applicable.

If the screen initiates a payment, stop after step 2 and use `emral-payment-integration` instead — do not build a bespoke confirm/PIN/receipt.
