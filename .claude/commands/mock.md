---
description: Generate or extend seed JSON for a mock data domain
argument-hint: <domain e.g. billers, fines, beneficiaries>
---

Generate/extend `assets/mock/$1.json`:

1. Check `docs/product.md` §6 for required counts and realism constraints for `$1` (e.g. 12 billers across 5 categories, 30 transactions across last 3 months, fictional brand names only — never real companies).
2. Check the matching freezed model in `lib/features/*/models/` or `lib/core/models/` for exact field names/types — JSON must deserialize cleanly, no schema drift.
3. Check the matching repository in `lib/data/repositories/` for how it's loaded/parsed.
4. Write/extend the JSON with realistic, internally-consistent demo values (e.g. transaction dates within last 3 months, amounts plausible for OMR/3dp, wallet ledger arithmetic must reconcile to seed balance 250.000 OMR if touching wallet-adjacent data).
5. Run `flutter analyze` and a quick repo smoke check (load + count) to confirm it parses.
