# Agent Instructions

This repository is a Flutter/Dart movie browser app. Follow these instructions for Codex and other
coding agents working in this workspace. For deeper Claude-specific context, also see
`.claude/CLAUDE.md`.

When a task matches one of the project skills, read the relevant
`.agents/skills/<skill-name>/SKILL.md` before editing code. Those skills are part of the intended
agent harness for this repo; use them instead of re-deriving the workflow from scratch.

## Project Shape

- Keep the existing architecture: `config/`, `domain/`, `infrastructure/`, and `presentation/`.
- Do not introduce a separate generic `data/` + `ui/` MVVM split.
- `domain/` stays framework-agnostic. It should not import Flutter, Dio, Drift, or generated API
  models.
- API/DB models are translated to domain entities through static mapper classes in
  `infrastructure/mappers/`. Do not add `toEntity()` methods to raw API models.
- New files in directories with barrels, such as `presentation/widgets/widgets.dart` or
  `domain/entities/entities.dart`, should be exported from the matching barrel when appropriate.

## Flutter And Dart

- Prefer `const`, `final`, switch expressions, and existing local patterns.
- Respect the project lints, including constructor ordering, trailing commas, explicit public return
  types, and formatting.
- Use focused extensions under `lib/config/extensions/` for reusable type-specific behavior instead
  of private one-off helpers. Example: localized date labels should read like
  `DateTime.now().weekdayDayLabel(l10n.localeName)`.
- Do not duplicate an extension member that already exists. Consolidate instead.
- Use `dart format` after edits and `dart analyze` or `flutter analyze` before considering work done.

## State Management

- This repo uses `flutter_riverpod` without code generation.
- Keep providers hand-declared as top-level `final` variables.
- Do not introduce `riverpod_generator` or `@riverpod` annotations unless the whole provider layer is
  intentionally migrated.
- Use `ref.watch` in provider bodies and widget builds; use `ref.read` inside callbacks and notifier
  methods.

## Networking And Persistence

- `NetworkService` is the only class that should touch `Dio` directly.
- Datasources depend on `NetworkService`, not raw `Dio`.
- Surface networking failures as `NetworkException`, not raw `DioException`.
- Do not hand-edit Drift generated files such as `app_database.g.dart`; regenerate them with
  `dart run build_runner build` after schema changes.

## Images

- Use `AppNetworkImage` for network images instead of bare `Image.network` or
  `FadeInImage` + `NetworkImage`.
- Use `ImagePlaceholders` constants for fallback image URLs. Do not inline those URLs again.
- Pass real cache dimensions when a widget visually fills an already-sized parent.

## Localization

- Use generated `AppLocalizations` strings for translatable UI text.
- For dynamic localized formatting, use `intl` with the active `l10n.localeName`.
- Avoid hardcoded UI strings in widgets when they should follow the selected app language.

## Testing And Verification

- Run the narrowest useful verification for the change, usually `dart analyze <changed files>` or
  `flutter analyze` for broader edits.
- Add focused unit/widget tests when changing shared behavior, mappers, repositories, or user-facing
  workflows.
- Existing real test coverage is minimal, so do not assume a mature test pattern is already present.

## Available Skills

Project skills live under `.agents/skills/`. Read the matching `SKILL.md` when the task touches that
topic:

| Topic | Skill file |
|---|---|
| Overall layering | `.agents/skills/flutter-apply-architecture-best-practices/SKILL.md` |
| Declarative routing / shell routes | `.agents/skills/flutter-setup-declarative-routing/SKILL.md` |
| JSON model shapes | `.agents/skills/flutter-implement-json-serialization/SKILL.md` |
| Localization | `.agents/skills/flutter-setup-localization/SKILL.md` |
| Responsive layout | `.agents/skills/flutter-build-responsive-layout/SKILL.md` |
| Diagnosing layout overflow / constraints | `.agents/skills/flutter-fix-layout-issues/SKILL.md` |
| Widget previews | `.agents/skills/flutter-add-widget-preview/SKILL.md` |
| Widget tests | `.agents/skills/flutter-add-widget-test/SKILL.md` |
| Integration tests | `.agents/skills/flutter-add-integration-test/SKILL.md` |
| Unit tests | `.agents/skills/dart-add-unit-test/SKILL.md` |
| Generating mocks | `.agents/skills/dart-generate-test-mocks/SKILL.md` |
| Coverage reports | `.agents/skills/dart-collect-coverage/SKILL.md` |
| Static analysis | `.agents/skills/dart-run-static-analysis/SKILL.md` |
| Runtime exceptions | `.agents/skills/dart-fix-runtime-errors/SKILL.md` |
| Package conflicts | `.agents/skills/dart-resolve-package-conflicts/SKILL.md` |
| Switch expressions / pattern matching | `.agents/skills/dart-use-pattern-matching/SKILL.md` |
| Primary constructors | `.agents/skills/dart-use-primary-constructors/SKILL.md` |
| Dart CLI apps | `.agents/skills/dart-build-cli-app/SKILL.md` |
| FFI bindings | `.agents/skills/dart-use-ffigen/SKILL.md` |
| Native assets / FFI assets | `.agents/skills/dart-setup-ffi-assets/SKILL.md` |
| Migrating assertions to `package:checks` | `.agents/skills/dart-migrate-to-checks-package/SKILL.md` |

Some Claude-only project skills may be documented in `.claude/CLAUDE.md`; if a topic is mentioned
there but does not exist in `.agents/skills/`, follow the written project guidance in
`.claude/CLAUDE.md` and continue with the closest available workflow.

## Do Not

- Do not add another `Dio()` outside `network_service.dart`.
- Do not catch raw `DioException` at presentation call sites.
- Do not hardcode `THE_MOVIEDB_KEY`; use `.env`.
- Do not introduce code generation styles, folder structures, or abstractions that conflict with the
  current repo.
- Do not revert unrelated user changes in the working tree.
