# clappy

A Flutter movie/TV browser app backed by [The Movie DB](https://www.themoviedb.org/) API — now
playing / popular / top rated / upcoming, movie and series detail, search, and offline favorites
persisted locally via [Drift](https://drift.simonbinder.eu/).

## Getting started

1. Install dependencies:
   ```
   flutter pub get
   ```
2. Copy `.env.template` to `.env` and set `THE_MOVIEDB_KEY` to your TMDB API key.
3. Generate Drift's local database code:
   ```
   dart run build_runner build
   ```
4. Run the app:
   ```
   flutter run
   ```

## Common commands

| Command | Purpose |
|---|---|
| `flutter analyze` | Static analysis — should be clean before considering work done |
| `dart format .` | Format the codebase |
| `flutter test` | Run the test suite (`flutter test test/some_test.dart` for a single file) |
| `dart run build_runner build` | Regenerate Drift's `app_database.g.dart` after changing table definitions (`build_runner watch` during active schema iteration) |

## Architecture

Clean-Architecture-flavored layering under `lib/`:

- `config/` — cross-cutting app setup: routing, theme, network layer, constants, extensions.
- `domain/` — framework-agnostic core: entities and abstract repository/datasource contracts.
- `infrastructure/` — concrete implementations of the `domain/` contracts: datasources, API
  models, mappers (model → entity), and repositories.
- `presentation/` — everything Flutter-aware: screens, views, widgets, and Riverpod providers.

See `.claude/CLAUDE.md` for the full set of conventions (state management, routing, networking,
persistence, image loading, JSON models, and testing).
