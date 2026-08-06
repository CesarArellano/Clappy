import 'package:drift/drift.dart';

import '../../domain/datasources/local_storage_datasource.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/tv_show.dart';
import 'drift/app_database.dart';

class DriftDatasource implements LocalStorageDatasource {
  DriftDatasource() : db = AppDatabase();
  final AppDatabase db;

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final favoriteMovie = await (db.select(
      db.moviesTable,
    )..where((movie) => movie.id.equals(movieId))).getSingleOrNull();

    return favoriteMovie != null;
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) async {
    final entries = await (db.select(
      db.moviesTable,
    )..limit(limit, offset: offset)).get();

    return entries.map(_entryToMovie).toList();
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final favoriteMovie = await (db.select(
      db.moviesTable,
    )..where((entry) => entry.id.equals(movie.id!))).getSingleOrNull();

    if (favoriteMovie != null) {
      await (db.delete(
        db.moviesTable,
      )..where((entry) => entry.id.equals(movie.id!))).go();
      return;
    }

    await db.into(db.moviesTable).insert(_movieToCompanion(movie));
  }

  Movie _entryToMovie(MovieEntry entry) => Movie(
    adult: entry.adult,
    backdropPath: entry.backdropPath,
    genreIds: _decodeGenreIds(entry.genreIds),
    id: entry.id,
    originalLanguage: entry.originalLanguage,
    originalTitle: entry.originalTitle,
    overview: entry.overview,
    popularity: entry.popularity,
    posterPath: entry.posterPath,
    releaseDate: entry.releaseDate,
    title: entry.title,
    video: entry.video,
    voteAverage: entry.voteAverage,
    voteCount: entry.voteCount,
    budget: entry.budget,
    revenue: entry.revenue,
    runtime: entry.runtime,
    heroId: entry.heroId,
  );

  MoviesTableCompanion _movieToCompanion(Movie movie) =>
      MoviesTableCompanion.insert(
        id: Value(movie.id!),
        adult: Value(movie.adult),
        backdropPath: Value(movie.backdropPath),
        genreIds: Value(_encodeGenreIds(movie.genreIds)),
        originalLanguage: Value(movie.originalLanguage),
        originalTitle: Value(movie.originalTitle),
        overview: Value(movie.overview),
        popularity: Value(movie.popularity),
        posterPath: Value(movie.posterPath),
        releaseDate: Value(movie.releaseDate),
        title: Value(movie.title),
        video: Value(movie.video),
        voteAverage: Value(movie.voteAverage),
        voteCount: Value(movie.voteCount),
        budget: Value(movie.budget),
        revenue: Value(movie.revenue),
        runtime: Value(movie.runtime),
        heroId: Value(movie.heroId),
      );

  String? _encodeGenreIds(List<String>? genreIds) => genreIds?.join(',');

  List<String>? _decodeGenreIds(String? raw) {
    if (raw == null) return null;
    if (raw.isEmpty) return [];
    return raw.split(',');
  }

  @override
  Future<bool> isSeriesFavorite(int seriesId) async {
    final favoriteSeries = await (db.select(
      db.seriesTable,
    )..where((series) => series.id.equals(seriesId))).getSingleOrNull();

    return favoriteSeries != null;
  }

  @override
  Future<List<TvShow>> loadSeries({int limit = 10, int offset = 0}) async {
    final entries = await (db.select(
      db.seriesTable,
    )..limit(limit, offset: offset)).get();

    return entries.map(_entrySeriesToShow).toList();
  }

  @override
  Future<void> toggleFavoriteSeries(TvShow series) async {
    final favoriteSeries = await (db.select(
      db.seriesTable,
    )..where((entry) => entry.id.equals(series.id!))).getSingleOrNull();

    if (favoriteSeries != null) {
      await (db.delete(
        db.seriesTable,
      )..where((entry) => entry.id.equals(series.id!))).go();
      return;
    }

    await db.into(db.seriesTable).insert(_seriesToCompanion(series));
  }

  TvShow _entrySeriesToShow(SeriesEntry entry) => TvShow(
    adult: entry.adult,
    backdropPath: entry.backdropPath,
    genreIds: _decodeGenreIds(entry.genreIds),
    id: entry.id,
    originalLanguage: entry.originalLanguage,
    originalName: entry.originalName,
    overview: entry.overview,
    popularity: entry.popularity,
    posterPath: entry.posterPath,
    firstAirDate: entry.firstAirDate,
    name: entry.name,
    voteAverage: entry.voteAverage,
    voteCount: entry.voteCount,
    numberOfSeasons: entry.numberOfSeasons,
    numberOfEpisodes: entry.numberOfEpisodes,
    status: entry.status,
  );

  SeriesTableCompanion _seriesToCompanion(TvShow series) =>
      SeriesTableCompanion.insert(
        id: Value(series.id!),
        adult: Value(series.adult),
        backdropPath: Value(series.backdropPath),
        genreIds: Value(_encodeGenreIds(series.genreIds)),
        originalLanguage: Value(series.originalLanguage),
        originalName: Value(series.originalName),
        overview: Value(series.overview),
        popularity: Value(series.popularity),
        posterPath: Value(series.posterPath),
        firstAirDate: Value(series.firstAirDate),
        name: Value(series.name),
        voteAverage: Value(series.voteAverage),
        voteCount: Value(series.voteCount),
        numberOfSeasons: Value(series.numberOfSeasons),
        numberOfEpisodes: Value(series.numberOfEpisodes),
        status: Value(series.status),
      );
}
