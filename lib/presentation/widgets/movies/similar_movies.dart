import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/extensions/network_exception_extensions.dart';
import '../../../config/network/network_exceptions.dart';
import '../../../domain/entities/entities.dart';
import '../../../l10n/app_localizations.dart';
import '../../providers/providers.dart';
import '../widgets.dart';

final similarMoviesProvider = FutureProvider.family((ref, int movieId) {
  final movieRepository = ref.watch(moviesRepositoryProvider);
  return movieRepository.getSimilarMovies(movieId);
});

class SimilarMovies extends ConsumerWidget {
  const SimilarMovies({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarMoviesFuture = ref.watch(similarMoviesProvider(movieId));

    return similarMoviesFuture.when(
      data: (movies) => _Recommendations(movies: movies),
      error: (err, _) {
        final l10n = AppLocalizations.of(context)!;
        return ErrorStateWidget(
          message: err is NetworkException
              ? err.localizedMessage(l10n)
              : l10n.couldNotLoadContent,
          onRetry: () => ref.invalidate(similarMoviesProvider(movieId)),
        );
      },
      loading: () => HorizontalContentSkeleton(
        title: AppLocalizations.of(context)!.recommendations,
      ),
    );
  }
}

class _Recommendations extends StatelessWidget {
  const _Recommendations({required this.movies});
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox();

    return MovieHorizontalListview(
      title: AppLocalizations.of(context)!.recommendations,
      movies: movies,
    );
  }
}
