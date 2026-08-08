import 'package:clappy/domain/entities/tv_show.dart';
import 'package:clappy/domain/entities/watch_providers.dart';
import 'package:clappy/infrastructure/datasources/tv_moviedb_datasource.dart';
import 'package:clappy/infrastructure/repositories/series_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTvMovieDbDatasource extends Mock implements TvMovieDbDatasource {}

TvShow _buildSeries({int id = 1}) => TvShow(
  adult: false,
  backdropPath: '',
  genreIds: const [],
  id: id,
  originalLanguage: 'en',
  originalName: 'Name',
  overview: '',
  popularity: 0,
  posterPath: '',
  firstAirDate: null,
  name: 'Name',
  voteAverage: 0,
  voteCount: 0,
  numberOfSeasons: 0,
  numberOfEpisodes: 0,
  status: '',
);

void main() {
  late MockTvMovieDbDatasource datasource;
  late SeriesRepositoryImpl repository;

  setUp(() {
    datasource = MockTvMovieDbDatasource();
    repository = SeriesRepositoryImpl(datasource);
  });

  test('getPopular delegates to datasource.getPopular', () async {
    final series = [_buildSeries()];
    when(() => datasource.getPopular()).thenAnswer((_) async => series);

    final result = await repository.getPopular();

    expect(result, series);
    verify(() => datasource.getPopular()).called(1);
  });

  test('getWatchProviders delegates to datasource.getWatchProviders', () async {
    final watchProviders = WatchProviders(link: null, categories: const {});
    when(
      () => datasource.getWatchProviders(42),
    ).thenAnswer((_) async => watchProviders);

    final result = await repository.getWatchProviders(42);

    expect(result, watchProviders);
    verify(() => datasource.getWatchProviders(42)).called(1);
  });
}
