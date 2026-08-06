import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/extensions/null_extensions.dart';
import '../../../domain/entities/tv_show.dart';
import '../../../domain/repositories/local_storage_repository.dart';
import '../providers.dart';

final favoriteSeriesProvider =
    StateNotifierProvider<StorageSeriesNotifier, Map<int, TvShow>>((ref) {
      final localStorageRepository = ref.watch(localStorageRepositoryProvider);
      return StorageSeriesNotifier(
        localStorageRepository: localStorageRepository,
      );
    });

class StorageSeriesNotifier extends StateNotifier<Map<int, TvShow>> {
  StorageSeriesNotifier({required this.localStorageRepository}) : super({});
  int page = 0;

  final LocalStorageRepository localStorageRepository;

  Future<List<TvShow>> loadNextPage() async {
    final series = await localStorageRepository.loadSeries(offset: page * 10);
    page++;
    if (!mounted) return series;

    final tempSeriesMap = <int, TvShow>{};

    for (final TvShow show in series) {
      tempSeriesMap[show.id.nonNullValue()] = show;
    }

    state = {...state, ...tempSeriesMap};

    return series;
  }

  Future<void> refresh() async {
    page = 0;
    state = {};
    await loadNextPage();
  }

  Future<void> toggleFavorite(TvShow series) async {
    await localStorageRepository.toggleFavoriteSeries(series);
    if (!mounted) return;
    final bool isSeriesInFavorites = state[series.id] != null;

    if (isSeriesInFavorites) {
      final newState = {...state};
      newState.remove(series.id);
      state = newState;
    } else {
      state = {...state, series.id.nonNullValue(): series};
    }
  }
}
