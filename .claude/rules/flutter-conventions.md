# Flutter Conventions

Source: `docs/architecture.md` §2, §3, §10.

- **Feature-first structure**: every feature lives in `lib/features/<name>/` with `models/`, `providers/`, `screens/`, `widgets/`. One screen per file.
- **Riverpod only** for business logic. No `setState` for anything beyond pure local widget UI state (e.g. animation controllers). Screens are `ConsumerWidget`/`ConsumerStatefulWidget` and only `watch`/`read` providers.
- **Repositories are the only data access.** Widgets and providers never touch `assets/mock/*.json` directly — only repository implementations in `lib/data/repositories/` do.
- **Freezed models** for every domain entity, with `json_serializable` for (de)serialization. Run codegen after any model/provider change:
  `dart run build_runner build --delete-conflicting-outputs`
- **Screen doc comments**: every screen file starts with `/// Screen <ID> — <Name>` referencing its `docs/product.md` §4 ID (e.g. `/// Screen E5 — Bill Detail`).
- **No business logic in widgets.** Layout only; validation, calculations, and state transitions belong in providers.
- **Const constructors** wherever possible. Extract widgets over ~60 lines into their own file.
- **Zero-warning bar**: `flutter analyze` must be clean before any task is marked done in `docs/tasks.md`.
