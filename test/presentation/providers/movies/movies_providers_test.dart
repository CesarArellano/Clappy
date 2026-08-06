import 'package:clappy/domain/entities/movie.dart';
import 'package:clappy/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_test/flutter_test.dart';

Movie _buildMovie(int id) => Movie(
  adult: false,
  backdropPath: '',
  genreIds: const [],
  id: id,
  originalLanguage: 'en',
  originalTitle: 'Title $id',
  overview: '',
  popularity: 0,
  posterPath: '',
  releaseDate: null,
  title: 'Title $id',
  video: false,
  voteAverage: 0,
  voteCount: 0,
  budget: 0,
  revenue: 0,
  runtime: 0,
);

void main() {
  group('MoviesNotifier.loadNextPage', () {
    test('appends fetched movies to state and increments currentPage', () async {
      final calledPages = <int>[];
      final notifier = MoviesNotifier(
        fetchMoreMovies: ({int page = 1}) async {
          calledPages.add(page);
          return [_buildMovie(page)];
        },
      );

      await notifier.loadNextPage();
      expect(notifier.state.map((m) => m.id), [1]);
      expect(notifier.currentPage, 1);

      await notifier.loadNextPage();
      expect(notifier.state.map((m) => m.id), [1, 2]);
      expect(notifier.currentPage, 2);

      expect(calledPages, [1, 2]);
    });

    test('a call while already loading is a no-op', () async {
      var fetchCount = 0;
      final notifier = MoviesNotifier(
        fetchMoreMovies: ({int page = 1}) async {
          fetchCount++;
          await Future<void>.delayed(const Duration(milliseconds: 50));
          return [_buildMovie(page)];
        },
      );

      final first = notifier.loadNextPage();
      final second = notifier.loadNextPage();
      await Future.wait([first, second]);

      expect(fetchCount, 1);
      expect(notifier.state.length, 1);
    });
  });
}
