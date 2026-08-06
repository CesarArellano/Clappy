import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../l10n/app_localizations.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    unawaited(ref.read(favoriteMoviesProvider.notifier).loadNextPage());
    unawaited(ref.read(favoriteSeriesProvider.notifier).loadNextPage());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final contentType = ref.watch(contentTypeProvider);

    return switch (contentType) {
      ContentType.movies => const _FavoriteMovies(),
      ContentType.series => const _FavoriteSeries(),
    };
  }
}

class _FavoriteMovies extends ConsumerStatefulWidget {
  const _FavoriteMovies();

  @override
  ConsumerState<_FavoriteMovies> createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends ConsumerState<_FavoriteMovies> {
  bool isLastPage = false;
  bool isLoading = false;

  Future<void> loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;

    final movies = await ref
        .read(favoriteMoviesProvider.notifier)
        .loadNextPage();
    isLoading = false;

    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();
    final colors = Theme.of(context).colorScheme;

    if (favoriteMovies.isEmpty) {
      return _NoFavorites(message: l10n.noFavoriteMovies, colors: colors);
    }

    // CustomAppbar is mounted once by HomeScreen, overlaid on top of every
    // tab — this only needs to pad its own content so it starts below the
    // bar, then scrolls up underneath its blur.
    return RefreshIndicator(
      onRefresh: () => ref.read(favoriteMoviesProvider.notifier).refresh(),
      child: MovieMasonry(movies: favoriteMovies, loadNextPage: loadNextPage),
    );
  }
}

class _FavoriteSeries extends ConsumerStatefulWidget {
  const _FavoriteSeries();

  @override
  ConsumerState<_FavoriteSeries> createState() => _FavoriteSeriesState();
}

class _FavoriteSeriesState extends ConsumerState<_FavoriteSeries> {
  bool isLastPage = false;
  bool isLoading = false;

  Future<void> loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;

    final series = await ref
        .read(favoriteSeriesProvider.notifier)
        .loadNextPage();
    isLoading = false;

    if (series.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final favoriteSeries = ref.watch(favoriteSeriesProvider).values.toList();
    final colors = Theme.of(context).colorScheme;

    if (favoriteSeries.isEmpty) {
      return _NoFavorites(message: l10n.noFavoriteSeries, colors: colors);
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(favoriteSeriesProvider.notifier).refresh(),
      child: SeriesMasonry(series: favoriteSeries, loadNextPage: loadNextPage),
    );
  }
}

class _NoFavorites extends StatelessWidget {
  const _NoFavorites({required this.message, required this.colors});

  final String message;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_outline_outlined,
            size: 60,
            color: colors.primary,
          ),
          Text(
            l10n.ohNo,
            style: TextStyle(fontSize: 30, color: colors.primary),
          ),
          Text(message, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          FilledButton.tonal(
            onPressed: () => context.go('/home/0'),
            child: Text(l10n.startSearching),
          ),
        ],
      ),
    );
  }
}
