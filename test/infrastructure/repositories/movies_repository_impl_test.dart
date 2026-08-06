import 'package:clappy/domain/entities/movie.dart';
import 'package:clappy/infrastructure/datasources/movie_db_datasource.dart';
import 'package:clappy/infrastructure/repositories/movies_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieDbDatasource extends Mock implements MovieDbDatasource {}

Movie _buildMovie({int id = 1}) => Movie(
  adult: false,
  backdropPath: '',
  genreIds: const [],
  id: id,
  originalLanguage: 'en',
  originalTitle: 'Title',
  overview: '',
  popularity: 0,
  posterPath: '',
  releaseDate: null,
  title: 'Title',
  video: false,
  voteAverage: 0,
  voteCount: 0,
  budget: 0,
  revenue: 0,
  runtime: 0,
);

void main() {
  late MockMovieDbDatasource datasource;
  late MoviesRepositoryImpl repository;

  setUp(() {
    datasource = MockMovieDbDatasource();
    repository = MoviesRepositoryImpl(datasource);
  });

  test('getNowPlaying delegates to datasource.getNowPlaying', () async {
    final movies = [_buildMovie()];
    when(
      () => datasource.getNowPlaying(page: 2),
    ).thenAnswer((_) async => movies);

    final result = await repository.getNowPlaying(page: 2);

    expect(result, movies);
    verify(() => datasource.getNowPlaying(page: 2)).called(1);
  });

  test('getPopular delegates to datasource.getPopular', () async {
    final movies = [_buildMovie()];
    when(() => datasource.getPopular()).thenAnswer((_) async => movies);

    final result = await repository.getPopular();

    expect(result, movies);
    verify(() => datasource.getPopular()).called(1);
  });

  test('getTopRated delegates to datasource.getTopRated', () async {
    final movies = [_buildMovie()];
    when(() => datasource.getTopRated()).thenAnswer((_) async => movies);

    final result = await repository.getTopRated();

    expect(result, movies);
    verify(() => datasource.getTopRated()).called(1);
  });

  test('getUpcoming delegates to datasource.getUpcoming', () async {
    final movies = [_buildMovie()];
    when(() => datasource.getUpcoming()).thenAnswer((_) async => movies);

    final result = await repository.getUpcoming();

    expect(result, movies);
    verify(() => datasource.getUpcoming()).called(1);
  });

  test('getMovieById delegates to datasource.getMovieById', () async {
    final movie = _buildMovie();
    when(() => datasource.getMovieById('42')).thenAnswer((_) async => movie);

    final result = await repository.getMovieById('42');

    expect(result, movie);
    verify(() => datasource.getMovieById('42')).called(1);
  });

  test('searchMovies delegates to datasource.searchMovies', () async {
    final movies = [_buildMovie()];
    when(
      () => datasource.searchMovies('query'),
    ).thenAnswer((_) async => movies);

    final result = await repository.searchMovies('query');

    expect(result, movies);
    verify(() => datasource.searchMovies('query')).called(1);
  });

  test('getSimilarMovies delegates to datasource.getSimilarMovies', () async {
    final movies = [_buildMovie()];
    when(() => datasource.getSimilarMovies(42)).thenAnswer((_) async => movies);

    final result = await repository.getSimilarMovies(42);

    expect(result, movies);
    verify(() => datasource.getSimilarMovies(42)).called(1);
  });

  test(
    'getYoutubeVideosById delegates to datasource.getYoutubeVideosById',
    () async {
      when(
        () => datasource.getYoutubeVideosById(42),
      ).thenAnswer((_) async => []);

      final result = await repository.getYoutubeVideosById(42);

      expect(result, isEmpty);
      verify(() => datasource.getYoutubeVideosById(42)).called(1);
    },
  );
}
