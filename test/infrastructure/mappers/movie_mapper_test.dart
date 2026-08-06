import 'package:clappy/config/constants/image_placeholders.dart';
import 'package:clappy/infrastructure/mappers/movie_mapper.dart';
import 'package:clappy/infrastructure/models/moviedb/movie_details.dart';
import 'package:clappy/infrastructure/models/moviedb/movie_moviedb.dart';
import 'package:flutter_test/flutter_test.dart';

MovieMovieDB _buildMovieMovieDB({
  String posterPath = '/poster.jpg',
  String backdropPath = '/backdrop.jpg',
}) {
  return MovieMovieDB(
    adult: false,
    backdropPath: backdropPath,
    genreIds: [28, 12],
    id: 42,
    originalLanguage: 'en',
    originalTitle: 'Original Title',
    overview: 'An overview.',
    popularity: 12.3,
    posterPath: posterPath,
    releaseDate: DateTime(2024, 1, 15),
    title: 'A Movie',
    video: false,
    voteAverage: 7.5,
    voteCount: 100,
  );
}

void main() {
  group('MovieMapper.movieDBToEntity', () {
    test('maps every field from MovieMovieDB to Movie', () {
      final movie = MovieMapper.movieDBToEntity(_buildMovieMovieDB());

      expect(movie.id, 42);
      expect(movie.title, 'A Movie');
      expect(movie.originalTitle, 'Original Title');
      expect(movie.overview, 'An overview.');
      expect(movie.genreIds, ['28', '12']);
      expect(movie.popularity, 12.3);
      expect(movie.voteAverage, 7.5);
      expect(movie.voteCount, 100);
      expect(movie.releaseDate, DateTime(2024, 1, 15));
      expect(movie.posterPath, 'https://image.tmdb.org/t/p/w500/poster.jpg');
      expect(
        movie.backdropPath,
        'https://image.tmdb.org/t/p/w500/backdrop.jpg',
      );
    });

    test(
      'falls back to ImagePlaceholders.posterNotFound when posterPath is empty',
      () {
        final movie = MovieMapper.movieDBToEntity(
          _buildMovieMovieDB(posterPath: ''),
        );

        expect(movie.posterPath, ImagePlaceholders.posterNotFound);
      },
    );

    test(
      'falls back to ImagePlaceholders.posterNotFound when backdropPath is empty',
      () {
        final movie = MovieMapper.movieDBToEntity(
          _buildMovieMovieDB(backdropPath: ''),
        );

        expect(movie.backdropPath, ImagePlaceholders.posterNotFound);
      },
    );

    test('zeroes out detail-only fields not present in list responses', () {
      final movie = MovieMapper.movieDBToEntity(_buildMovieMovieDB());

      expect(movie.budget, 0);
      expect(movie.revenue, 0);
      expect(movie.runtime, 0);
    });
  });

  group('MovieMapper.movieDetailsToEntity', () {
    test('maps budget, revenue, and runtime from MovieDetails', () {
      final details = MovieDetails.fromJson({
        'adult': false,
        'backdrop_path': '/backdrop.jpg',
        'budget': 1000000,
        'genres': [
          {'id': 28, 'name': 'Action'},
        ],
        'id': 42,
        'original_language': 'en',
        'original_title': 'Original Title',
        'overview': 'An overview.',
        'popularity': 12.3,
        'poster_path': '/poster.jpg',
        'release_date': '2024-01-15',
        'revenue': 5000000,
        'runtime': 120,
        'title': 'A Movie',
        'video': false,
        'vote_average': 7.5,
        'vote_count': 100,
      });

      final movie = MovieMapper.movieDetailsToEntity(details);

      expect(movie.budget, 1000000);
      expect(movie.revenue, 5000000);
      expect(movie.runtime, 120);
      expect(movie.genreIds, ['Action']);
    });
  });
}
