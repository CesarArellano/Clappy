import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home/content_type_provider.dart';
import 'searched_series_provider.dart';
import 'search_movies_provider.dart';

class SearchControllerState {
  const SearchControllerState({
    this.query = '',
    this.category = ContentType.movies,
    this.isLoading = false,
  });

  final String query;
  final ContentType category;
  final bool isLoading;

  SearchControllerState copyWith({
    String? query,
    ContentType? category,
    bool? isLoading,
  }) {
    return SearchControllerState(
      query: query ?? this.query,
      category: category ?? this.category,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class SearchController extends StateNotifier<SearchControllerState> {
  SearchController(this._ref) : super(const SearchControllerState());

  final Ref _ref;
  Timer? _debounce;

  void onQueryChanged(String query) {
    _debounce?.cancel();
    state = state.copyWith(query: query, isLoading: query.isNotEmpty);

    if (query.isEmpty) {
      state = state.copyWith(isLoading: false);
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 400), () async {
      await _performSearch(query);
    });
  }

  void changeCategory(ContentType category) {
    if (category == state.category) return;
    _debounce?.cancel();
    state = state.copyWith(category: category);
    if (state.query.isNotEmpty) {
      onQueryChanged(state.query);
    }
  }

  void clear() {
    _debounce?.cancel();
    state = const SearchControllerState();
  }

  Future<void> _performSearch(String query) async {
    if (query.isEmpty) return;
    state = state.copyWith(isLoading: true);

    switch (state.category) {
      case ContentType.movies:
        await _ref
            .read(searchedMoviesProvider.notifier)
            .searchMoviesByQuery(query);
      case ContentType.series:
        await _ref
            .read(searchedSeriesProvider.notifier)
            .searchSeriesByQuery(query);
    }

    if (mounted) {
      state = state.copyWith(isLoading: false);
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}

final searchControllerProvider =
    StateNotifierProvider<SearchController, SearchControllerState>((ref) {
      return SearchController(ref);
    });
