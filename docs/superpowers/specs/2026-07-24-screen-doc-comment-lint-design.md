# Screen Doc-Comment Lint — Design

## Problem
CLAUDE.md requires every screen file to start with a doc comment referencing its `docs/product.md` screen ID (e.g. `/// Screen E5 — Bill Detail`). Today this is only enforced by manual review at the Definition-of-Done gate. There is no automated check, so it's easy for a screen to ship without it (or with a malformed ID/format) and only get caught in review.

## Goal
Add an automated Dart analyzer lint that flags screen files missing (or malforming) this doc comment, surfaced the same way as any other `flutter analyze` / IDE lint warning.

## Scope
- **In scope**: one custom lint rule enforcing the `/// Screen <ID> — <Name>` comment format on files under `lib/features/*/screens/*.dart`.
- **Out of scope**: cross-checking the ID/name against the actual `docs/product.md` table (format-only validation, per user decision); doc-comment rules for repositories/providers/widgets; TODO/FIXME hygiene; general "why comment" heuristics.

## Approach
Build a local [`custom_lint`](https://pub.dev/packages/custom_lint) plugin package, `packages/epay_lints/`. This runs as a real Dart analyzer plugin — same DX as built-in lints (inline IDE warnings + `dart run custom_lint`), unlike a standalone script or git hook.

## Package structure
```
packages/epay_lints/
  pubspec.yaml                       # depends on custom_lint_builder, analyzer
  lib/epay_lints.dart                # plugin entrypoint (PluginBase, registers rules)
  lib/src/screen_doc_comment_rule.dart
  test/screen_doc_comment_rule_test.dart
```

## Rule: `screen_doc_comment`

**Applies to**: files whose path matches `lib/features/*/screens/*.dart`.

**Check**: locate the first public class declaration in the file (the screen widget). It must have a doc comment (`///`) directly above it whose first line matches:

```
/// Screen [A-J]\d{1,2} — .+
```

(em dash `—`, ID in the A1–J9 range per `docs/product.md`'s screen ID scheme, followed by a non-empty name.)

**Reported problems**:
1. No doc comment at all → `Screen files must start with a doc comment: /// Screen <ID> — <Name> (see docs/product.md).`
2. Doc comment present but doesn't match the pattern (wrong dash character, missing/malformed ID, empty name) → same message, code highlights the existing comment.

**Not checked**: whether the ID actually exists in `docs/product.md`, or whether the name matches the table — format only.

## Wiring into the app project
- Root `pubspec.yaml` → `dev_dependencies`: add `custom_lint: ^<latest>` and `epay_lints: {path: packages/epay_lints}`.
- Root `analysis_options.yaml` → add:
  ```yaml
  analyzer:
    plugins:
      - custom_lint
  ```
- `CLAUDE.md` Commands section gets a line: `Lint (custom rules): dart run custom_lint`.

## Testing
`packages/epay_lints/test/screen_doc_comment_rule_test.dart` feeds sample source strings through the rule (via `custom_lint`'s test harness, or a plain `analyzer` `parseString` + rule-visitor unit test if the harness proves heavy for one rule):
- Pass: doc comment exactly matching the pattern (mirrors the real `splash_screen.dart` example).
- Fail: no doc comment.
- Fail: wrong dash (`-` instead of `—`).
- Fail: missing ID (`/// Splash`).
- Fail: empty name (`/// Screen A1 —`).

## Error handling
N/A — this is a static analysis rule; there's no runtime path to handle failures beyond the lint diagnostic itself.
