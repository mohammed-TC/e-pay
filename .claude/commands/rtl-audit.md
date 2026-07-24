---
description: Sweep lib/ for RTL and localization violations
---

Audit `lib/` against `.claude/rules/rtl-localization.md`:

1. Grep for `EdgeInsets.only(left`, `EdgeInsets.only(right`, `EdgeInsets.fromLTRB`, `Alignment.centerLeft`, `Alignment.centerRight`, `.left`/`.right` positional args — flag any not justified (icons that must never mirror per design.md §8.4).
2. Grep for string literals inside `Text(`, `SnackBar`, `AppBar(title:`, etc. that aren't `context.l10n.*` calls — flag hardcoded strings.
3. Check `NPCard`/`NPButton` plate-shadow logic actually branches on `Directionality.of(context)`.
4. Check every screen file has been visually verified in `ar` (cross-reference `docs/tasks.md` Definition of Done, don't assume).
5. Report a table: file:line, violation type, suggested fix (directional widget/ARB key to use). No fixes applied automatically — this command reports only unless the user asks to fix.
