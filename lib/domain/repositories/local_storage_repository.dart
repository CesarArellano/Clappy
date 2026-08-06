import '../entities/movie.dart';
import '../entities/tv_show.dart';

abstract class LocalStorageRepository {
  Future<void> toggleFavorite(Movie movie);

  Future<bool> isMovieFavorite(int movieId);

  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0});

  Future<void> toggleFavoriteSeries(TvShow series);

  Future<bool> isSeriesFavorite(int seriesId);

  Future<List<TvShow>> loadSeries({int limit = 10, int offset = 0});
}
