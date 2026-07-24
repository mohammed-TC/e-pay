---
description: Execute a phase from docs/tasks.md in order
argument-hint: <n>
---

Execute Phase $1 of `docs/tasks.md`:

1. Read `docs/tasks.md` and locate the `## Phase $1` section.
2. Read `docs/product.md`, `docs/architecture.md`, `docs/design.md` for any context needed by this phase's tasks.
3. Work through the unchecked `- [ ]` items **in order, top to bottom**. Follow all rules in `.claude/rules/`.
4. After each item is genuinely complete (builds, meets Definition of Done in CLAUDE.md), check it off (`- [x]`) in `docs/tasks.md`.
5. Run `flutter analyze` — fix all warnings before continuing to the next item.
6. If a phase checkpoint (✅ line) exists at the end, verify it manually before checking off the last item.
7. Do not start the next phase. Stop and summarize: items completed, any blockers, analyze status.
