# Where to Watch

## Context

Clappy currently lets users browse and favorite movies/series but gives no way to know *where*
to actually watch something. TMDB exposes this via `/movie/{id}/watch/providers` and
`/tv/{id}/watch/providers`, which return streaming/rent/buy/free availability grouped by country.
Adding this turns the app from a browser into something people would actually open before picking
what to watch — one of the "daily-use" ideas captured in `docs/notes/portfolio-ideas.md`.

TMDB's terms require attribution when displaying this data (the response's `link` field must be
shown/tappable), and per user decision the watch region is **user-selectable in Settings** rather
than silently inferred from app language — TMDB's response includes every country in one payload,
so no extra API calls are needed to support this.

## Design decisions

- **Shared domain entity/mapper/widget across movies and series.** The TMDB response shape is
  byte-identical for both endpoints (`results` keyed by country → `flatrate`/`rent`/`buy`/`free`/`ads`
  category lists). Unlike `Movie`/`TvShow` (genuinely different fields), duplicating this would be
  copy-paste with zero divergence. Datasource/repository methods still live on each of
  `MoviesDatasource`/`MoviesRepository` and `SeriesDatasource`/`SeriesRepository` separately (matching
  the existing per-feature convention, e.g. `getYoutubeVideosById`/`getCastBySeries`), but both
  delegate to one shared raw model, one shared mapper, and one shared `WatchProviders` entity/widget.
- **New widget directory** `lib/presentation/widgets/watch_providers/` — parallel to `movies/`,
  `people/`, `series/`, `videos/`. First cross-feature (movie+series) content section, not generic
  enough for `shared/`.
- **Watch region is a Settings preference**, following the exact `AppLanguage`/`ThemePreference`
  pattern (`lib/presentation/providers/settings/app_language_provider.dart`,
  `lib/infrastructure/datasources/shared_preferences_datasource.dart`): a new closed `WatchRegion`
  enum (curated list of common countries, not a free-text/full-ISO picker — matches the existing
  `ChoiceChip` row UI in `preferences_screen.dart` rather than introducing a new search UI), defaulted
  to `WatchRegion.us` on first run, persisted via `SharedPreferences`.
- **New dependency**: `url_launcher` (not currently in `pubspec.yaml`) to open the attribution link.
- **Empty state**: hide the section entirely (`SizedBox()`), matching the existing convention in
  `VideosFromMovie`/`SimilarMovies`/`PersonMovieCredits` for empty lists — no new "not available"
  copy.

## Domain layer

**`lib/domain/entities/watch_providers.dart`** (new):
```dart
enum WatchProviderCategory { flatrate, rent, buy, free, ads }

class WatchProvider {
  WatchProvider({
    required this.providerId,
    required this.providerName,
    required this.logoPath,
    required this.displayPriority,
  });

  final int providerId;
  final String providerName;
  final String logoPath; // full URL, already prefixed in the mapper
  final int displayPriority;
}

class WatchProviders {
  WatchProviders({required this.link, required this.categories});

  final String? link; // null when the resolved region isn't in TMDB's results at all
  final Map<WatchProviderCategory, List<WatchProvider>> categories;

  bool get isEmpty => categories.values.every((list) => list.isEmpty);
}
```
Register in `lib/domain/entities/entities.dart`. `WatchProviders` represents one already-resolved
country's data — region resolution happens in the mapper, so nothing above infrastructure needs to
know TMDB returns a country map.

**`lib/domain/entities/watch_region.dart`** (new, mirrors `lib/domain/entities/app_language.dart`):
```dart
enum WatchRegion { us, mx, es, gb, ca, ar, br, fr, de, it }
```
Curated to common TMDB markets — extend later if needed, same spirit as `AppLanguage` only having
`en`/`es` today. Add a `WatchRegionX.countryCode` extension (`lib/config/extensions/` — new file
`watch_region_extensions.dart`) mapping each to its ISO code (`WatchRegion.us => 'US'`, etc.) and a
`displayName` getter for the Settings UI (localized labels, l10n keys per region).

**`lib/domain/datasources/movies_datasource.dart`** — add:
```dart
Future<WatchProviders> getWatchProviders(int movieId);
```
**`lib/domain/datasources/series_datasource.dart`** — add:
```dart
Future<WatchProviders> getWatchProviders(int seriesId);
```
Mirror both into `lib/domain/repositories/movies_repository.dart` / `series_repository.dart`
(pure passthrough convention — every existing method is duplicated verbatim between datasource and
repository interfaces).

Note: unlike the earlier draft, **region is not a parameter here** — the datasource fetches the
full multi-country TMDB response and the mapper resolves the region, but region selection is a
*presentation-layer* concern (the widget reads `watchRegionProvider`). Keeping the datasource
signature region-free means the `FutureProvider.family<WatchProviders, int>` cache key stays just
the movie/series id — see below for why this matters for correctness.

**`lib/domain/repositories/settings_repository.dart`** / **`lib/domain/datasources/settings_datasource.dart`**
— add:
```dart
Future<WatchRegion> getWatchRegion();
Future<void> setWatchRegion(WatchRegion region);
```

## Infrastructure layer

**`lib/infrastructure/models/moviedb/moviedb_watch_providers.dart`** (new — the novel part: TMDB's
`results` is a `Map<String, ...>`, unlike every other `results` field in this codebase which is a
`List`):
```dart
class MoviedbWatchProvidersResponse {
  factory MoviedbWatchProvidersResponse.fromJson(Map<String, dynamic> json) =>
      MoviedbWatchProvidersResponse(
        id: json["id"],
        results: (json["results"] as Map<String, dynamic>? ?? {}).map(
          (countryCode, value) => MapEntry(
            countryCode,
            CountryWatchProviders.fromJson(value as Map<String, dynamic>),
          ),
        ),
      );

  MoviedbWatchProvidersResponse({required this.id, required this.results});

  final int id;
  final Map<String, CountryWatchProviders> results;
}

class CountryWatchProviders {
  factory CountryWatchProviders.fromJson(Map<String, dynamic> json) =>
      CountryWatchProviders(
        link: json["link"],
        flatrate: _providerList(json["flatrate"]),
        rent: _providerList(json["rent"]),
        buy: _providerList(json["buy"]),
        free: _providerList(json["free"]),
        ads: _providerList(json["ads"]),
      );

  CountryWatchProviders({
    required this.link,
    required this.flatrate,
    required this.rent,
    required this.buy,
    required this.free,
    required this.ads,
  });

  final String link;
  final List<MoviedbProvider> flatrate;
  final List<MoviedbProvider> rent;
  final List<MoviedbProvider> buy;
  final List<MoviedbProvider> free;
  final List<MoviedbProvider> ads;

  static List<MoviedbProvider> _providerList(dynamic value) => value == null
      ? []
      : List<MoviedbProvider>.from((value as List).map((x) => MoviedbProvider.fromJson(x)));
}

class MoviedbProvider {
  factory MoviedbProvider.fromJson(Map<String, dynamic> json) => MoviedbProvider(
    logoPath: json["logo_path"],
    providerId: json["provider_id"],
    providerName: json["provider_name"],
    displayPriority: json["display_priority"],
  );

  MoviedbProvider({
    required this.logoPath,
    required this.providerId,
    required this.providerName,
    required this.displayPriority,
  });

  final String logoPath;
  final int providerId;
  final String providerName;
  final int displayPriority;
}
```
Deliberate deviation from the surrounding "all fields required" convention: `flatrate`/`rent`/`buy`/
`free`/`ads` default to `[]` when absent (TMDB omits categories with no providers for a given
country) — treating them as required would crash on real data.

**`lib/infrastructure/mappers/watch_providers_mapper.dart`** (new — resolves region + flattens):
```dart
class WatchProvidersMapper {
  static WatchProviders fromResponse(MoviedbWatchProvidersResponse response, String regionCode) {
    final country = response.results[regionCode];
    if (country == null) {
      return WatchProviders(
        link: null,
        categories: {for (final c in WatchProviderCategory.values) c: []},
      );
    }
    return WatchProviders(
      link: country.link,
      categories: {
        WatchProviderCategory.flatrate: _toEntities(country.flatrate),
        WatchProviderCategory.rent: _toEntities(country.rent),
        WatchProviderCategory.buy: _toEntities(country.buy),
        WatchProviderCategory.free: _toEntities(country.free),
        WatchProviderCategory.ads: _toEntities(country.ads),
      },
    );
  }

  static List<WatchProvider> _toEntities(List<MoviedbProvider> providers) =>
      providers
          .map((p) => WatchProvider(
                providerId: p.providerId,
                providerName: p.providerName,
                logoPath: p.logoPath.isNotEmpty
                    ? '${TmdbImage.baseUrlW92}${p.logoPath}'
                    : ImagePlaceholders.noProfileImage,
                displayPriority: p.displayPriority,
              ))
          .toList()
        ..sort((a, b) => a.displayPriority.compareTo(b.displayPriority));
}
```
Called from the datasource with a region code — see below, this is where the presentation-layer
`watchRegionProvider` value flows in.

**`lib/config/constants/tmdb_image.dart`** — add `static const String baseUrlW92 = 'https://image.tmdb.org/t/p/w92';` (TMDB's recommended small logo size; the file currently only has `baseUrlW500`).

**`lib/infrastructure/datasources/movie_db_datasource.dart`** — add, following the exact shape of
`getYoutubeVideosById` (lines 101-115):
```dart
@override
Future<WatchProviders> getWatchProviders(int movieId) async {
  final response = await networkService.get('/movie/$movieId/watch/providers');
  final parsed = MoviedbWatchProvidersResponse.fromJson(response.data);
  return WatchProvidersMapper.fromResponse(parsed, _region);
}
```
**`lib/infrastructure/datasources/tv_moviedb_datasource.dart`** — same body against
`/tv/$seriesId/watch/providers`.

Since the domain method signature is region-free (see above), the datasource needs the region code
injected at construction, mirroring how `NetworkService`'s language is threaded in today via
`networkServiceProvider` watching `appLanguageProvider`
(`lib/presentation/providers/network/network_service_provider.dart`). Add a `regionCode` constructor
param to both concrete datasources, and have their provider files
(`lib/presentation/providers/movies/...`, `lib/presentation/providers/series/...` — find the exact
provider that constructs `MovieDbDatasource`/`TvMoviedbDatasource`) `ref.watch(watchRegionProvider)`
and rebuild the datasource when it changes, same dependency-injection style already used for language.

**`lib/infrastructure/repositories/movies_repository_impl.dart`** / **`series_repository_impl.dart`**
— add the 1-line passthrough each, matching every other method in these files.

**`lib/infrastructure/repositories/settings_repository_impl.dart`** and
**`lib/infrastructure/datasources/shared_preferences_datasource.dart`** — add `getWatchRegion`/
`setWatchRegion`, following `getAppLanguage`/`setAppLanguage` exactly (new `_watchRegionKey =
'watch_region'` constant, `WatchRegion.values.firstWhere(... orElse: () => WatchRegion.us)`).

## Presentation layer

**`lib/presentation/providers/settings/watch_region_provider.dart`** (new, mirrors
`app_language_provider.dart`):
```dart
final watchRegionProvider = StateNotifierProvider<WatchRegionNotifier, WatchRegion>((ref) {
  return WatchRegionNotifier(ref.watch(settingsRepositoryProvider));
});

class WatchRegionNotifier extends StateNotifier<WatchRegion> {
  WatchRegionNotifier(this._repository) : super(WatchRegion.us) {
    _loadPersisted();
  }

  final SettingsRepositoryImpl _repository;

  Future<void> _loadPersisted() async {
    final persisted = await _repository.getWatchRegion();
    if (!mounted || persisted == state) return;
    state = persisted;
  }

  Future<void> setWatchRegion(WatchRegion region) async {
    state = region;
    await _repository.setWatchRegion(region);
  }
}
```
Unlike `AppLanguageNotifier`, no `initialValue` preload-before-`runApp` constructor param is needed
— that complexity exists there specifically because `NetworkService` (built before first frame)
depends on the language. Watch region only affects the datasource's region-scoped fetch, which
already happens after normal provider initialization, so the default async load is sufficient.
Register in `lib/presentation/providers/providers.dart` barrel.

**`lib/presentation/widgets/watch_providers/where_to_watch.dart`** (new):
```dart
final watchProvidersForMovieProvider = FutureProvider.family<WatchProviders, int>((ref, movieId) {
  final repo = ref.watch(moviesRepositoryProvider);
  return repo.getWatchProviders(movieId);
});

final watchProvidersForSeriesProvider = FutureProvider.family<WatchProviders, int>((ref, seriesId) {
  final repo = ref.watch(seriesRepositoryProvider);
  return repo.getWatchProviders(seriesId);
});
```
Both providers implicitly depend on `watchRegionProvider` transitively (via the datasource
constructed by `moviesRepositoryProvider`/`seriesRepositoryProvider`), so switching region in
Settings invalidates and refetches automatically — same mechanism already relied on for language.

`WhereToWatchMovie`/`WhereToWatchSeries` (`ConsumerWidget`s) watch their respective provider and
render through a shared `_WhereToWatchBody`, following the exact `.when(data/error/loading)` +
`ErrorStateWidget` + `ref.invalidate(...)` retry pattern used in
`lib/presentation/widgets/videos/videos_from_movie.dart`. Data case: section title
(`Text(l10n.whereToWatch, style: fontSize 22 bold)` — the pattern repeated verbatim in every
section), one horizontal row of small logo chips per non-empty category (`flatrate`/`free` first,
then `rent`/`buy`, `ads` last — matches TMDB's own ordering), and a tappable "more watch options"
row using `url_launcher`'s `launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication)` when
`providers.link != null` (the required TMDB/JustWatch attribution). Empty case: `SizedBox()`.

New small widget `_ProviderLogoChip` (~40x40 `AppNetworkImage` in a `ClipRRect`, `Tooltip` with the
provider name) — do **not** reuse `CastCard` (`lib/presentation/widgets/shared/cast_card.dart`),
it's a 140×160 portrait card, wrong shape for a square provider logo.

New `WatchProvidersSkeleton` in `lib/presentation/widgets/shared/skeleton_placeholders.dart`,
following the existing `Bone`-based skeleton pattern used for cast/credits sections.

Export the new file(s) directly from `lib/presentation/widgets/widgets.dart` (matches how
`videos_from_movie.dart` is exported with no sub-barrel).

**Screen wiring:**
- `lib/presentation/screens/movies/movie_screen.dart:146-167` (`_MovieDetails`) — insert
  `WhereToWatchMovie(movieId: movie.id.nonNullValue())` between `VideosFromMovie(...)` (line 161)
  and `SimilarMovies(...)` (line 163), with the same `SizedBox` spacer convention.
- `lib/presentation/screens/series/series_screen.dart:148-230` (`_SeriesDetails`) — insert
  `WhereToWatchSeries(seriesId: series.id.nonNullValue())` after `_SeriesCast(...)`/`_LastSeason`
  (line 229-230).

**Settings UI** — `lib/presentation/screens/settings/preferences_screen.dart`: add a third
`Column` section after the existing Language section (lines 63-89), following the identical
`Text` title + `Row` of `ChoiceChip`s pattern, one chip per `WatchRegion` value, wired to
`ref.read(watchRegionProvider.notifier).setWatchRegion(...)`.

## l10n

`lib/l10n/app_en.arb` additions (mirror in `app_es.arb`):
```json
"whereToWatch": "Where to Watch",
"streamOn": "Stream",
"rentOn": "Rent",
"buyOn": "Buy",
"watchFree": "Free",
"watchWithAds": "Free with Ads",
"moreWatchOptions": "More watch options",
"watchRegionLabel": "Watch region"
```
Plus one label key per `WatchRegion` enum value for the Settings chips (e.g. `regionUs: "United
States"`, `regionMx: "Mexico"`, ...). Run `flutter gen-l10n` afterward (this project uses Flutter's
built-in generator via `generate: true` in `pubspec.yaml`, not a codegen package — no `build_runner`
step needed for this).

## Dependency change

Add to `pubspec.yaml`:
```yaml
url_launcher: ^6.3.0
```
New third-party dependency (confirmed absent today) — run `flutter pub get` after adding.

## Verification

- `flutter analyze` — must be clean, in particular around nullable `link` handling and the
  optional-category JSON parsing not throwing on missing keys.
- **Unit tests** (highest-risk, novel map-keyed parsing):
  - New `test/infrastructure/models/moviedb_watch_providers_test.dart` — parses a multi-country
    fixture, a country missing some categories (defaults to `[]`, no throw), and an empty
    `results: {}` object.
  - New `test/infrastructure/mappers/watch_providers_mapper_test.dart` — resolves a present region
    correctly (link + sorted-by-`displayPriority` providers), returns `link: null` + all-empty
    categories for a region absent from `results`, and prefixes logo URLs with `TmdbImage.baseUrlW92`.
  - Extend `test/infrastructure/repositories/movies_repository_impl_test.dart` (pattern already
    established there for `getYoutubeVideosById`, lines 112-124) with a `getWatchProviders`
    passthrough case; add the series equivalent.
- **Widget tests** — new `test/presentation/widgets/watch_providers/where_to_watch_test.dart`
  using `ProviderScope` overrides on `watchProvidersForMovieProvider`/`watchProvidersForSeriesProvider`
  (check `test/presentation/providers/movies/movies_providers_test.dart` for the exact override
  idiom already used in this repo): loading → skeleton, data non-empty → title + chips + tappable
  link, data empty (`WatchProviders.isEmpty`) → `SizedBox()`, error → `ErrorStateWidget` with retry
  wired to `ref.invalidate`. The attribution-tap test needs `url_launcher`'s platform-interface mock
  (`UrlLauncherPlatform.instance = MockUrlLauncherPlatform()`), since `launchUrl` hits a platform
  channel unavailable in plain `flutter_test`.
- **Manual run**: `flutter run`, open a popular movie and a popular series, confirm the section
  renders with real logos, confirm switching "Watch region" in Settings changes the shown providers
  and re-fetches (no stale cache from the previous region), and confirm tapping "more watch options"
  opens the link externally.

### Critical files
- `lib/domain/entities/watch_providers.dart`, `lib/domain/entities/watch_region.dart`
- `lib/infrastructure/models/moviedb/moviedb_watch_providers.dart`
- `lib/infrastructure/mappers/watch_providers_mapper.dart`
- `lib/presentation/widgets/watch_providers/where_to_watch.dart`
- `lib/presentation/providers/settings/watch_region_provider.dart`
- `lib/presentation/screens/settings/preferences_screen.dart`
- `lib/presentation/screens/movies/movie_screen.dart`, `lib/presentation/screens/series/series_screen.dart`
