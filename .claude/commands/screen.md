---
description: Build one screen by its product.md ID
argument-hint: <ID e.g. E5>
---

Build screen $1:

1. Confirm it's on the current phase in `docs/tasks.md`; if not, ask before proceeding.
2. Read its row in `docs/product.md` §4 for requirements, and `docs/design.md` §7 if it has specific art direction.
3. Follow `.claude/rules/flutter-conventions.md` (structure, doc comment `/// Screen $1 — <Name>`), `.claude/rules/design-tokens.md` (NP widgets only), `.claude/rules/rtl-localization.md`, and `.claude/rules/payment-flow.md` if it moves money.
4. Wire the provider(s) it needs (create if missing) — screen stays layout-only.
5. Wire navigation: add/confirm the route in `lib/app/router/routes.dart` + `app_router.dart` per `docs/architecture.md` §6.
6. Add every user-facing string as a key in both `lib/l10n/app_en.arb` and `app_ar.arb`.
7. Implement shimmer/content/error/empty states for any async data.
8. Run `flutter analyze`, verify EN then AR/RTL.
9. Check the item off in `docs/tasks.md`.
