# Portfolio ideas

Candidate features/improvements to make Clappy stand out for recruiters and be useful day-to-day.
Captured 2026-08-07.

## Recruiter-facing signal (cheap, high visibility)

- **CI pipeline** — GitHub Actions running `flutter analyze` + `flutter test` on every PR, with a
  README badge. No CI config exists today.
- **A real test suite** — only the default counter-app scaffold exists (`test/widget_test.dart`).
  Unit tests on mappers/repositories (mock `NetworkService`) and widget tests on key widgets, plus
  a coverage report.
- **README polish** — architecture diagram (Mermaid), demo GIF, link to a TestFlight/Play internal
  testing build.

## Features that make it genuinely useful day-to-day

- **"Where to watch"** — TMDB's `/watch/providers` endpoint, region-aware streaming availability.
- **Multiple lists, not just Favorites** — a "Watched" and/or custom-collection concept alongside
  favorites, same Drift table pattern.
- **Recommendations/similar** — TMDB's `/movie/{id}/recommendations` and `/similar` on the movie
  detail screen.
- **Release-date reminders** — local notifications for followed upcoming movies/series
  (`flutter_local_notifications`, no backend needed).
- **Offline browsing** — cache the last-fetched now playing/popular/top rated/upcoming lists in
  Drift, extending the existing favorites datasource pattern.

## Engineering-depth signals worth showing off

- **Accessibility pass** — Semantics labels, contrast, dynamic text scaling.
- **Material You / dynamic color** — `dynamic_color` package on top of the existing theme setup.
- **Deep linking** — universal/app links into `MovieScreen` via go_router's existing named routes.

## Next step

Best combo of impressive-to-recruiters and useful-to-use: where-to-watch + CI pipeline.
