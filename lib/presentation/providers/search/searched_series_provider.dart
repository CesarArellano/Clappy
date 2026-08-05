import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/tv_show.dart';
import '../series/series_repository_provider.dart';

final searchedSeriesProvider =
    StateNotifierProvider<SearchedSeriesNotifier, List<TvShow>>((ref) {
      final seriesRepository = ref.watch(seriesRepositoryProvider);
      return SearchedSeriesNotifier(
        ref: ref,
        searchSeries: seriesRepository.searchSeries,
      );
    });

typedef SearchedSeriesCallback = Future<List<TvShow>> Function(String query);

class SearchedSeriesNotifier extends StateNotifier<List<TvShow>> {
  SearchedSeriesNotifier({required this.ref, required this.searchSeries})
    : super([]);
  final Ref ref;
  final SearchedSeriesCallback searchSeries;

  Future<List<TvShow>> searchSeriesByQuery(String query) async {
    final List<TvShow> series = await searchSeries(query);
    if (!mounted) return series;
    state = series;
    return series;
  }
}
