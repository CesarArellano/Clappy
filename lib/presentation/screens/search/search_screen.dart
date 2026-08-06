import 'package:clappy/config/extensions/null_extensions.dart';
import 'package:clappy/domain/entities/movie.dart';
import 'package:clappy/domain/entities/tv_show.dart';
import 'package:clappy/l10n/app_localizations.dart';
import 'package:clappy/presentation/providers/providers.dart';
import 'package:clappy/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  static const name = 'search-screen';

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = ref.watch(searchControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: l10n.searchFieldHint,
            border: InputBorder.none,
          ),
          onChanged: ref.read(searchControllerProvider.notifier).onQueryChanged,
        ),
        actions: [
          if (controller.query.isNotEmpty)
            IconButton(
              tooltip: l10n.pleaseWait,
              onPressed: () {
                _searchController.clear();
                ref.read(searchControllerProvider.notifier).clear();
              },
              icon: controller.isLoading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.clear),
            ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                ChoiceChip(
                  label: Text(l10n.contentTypeMovies),
                  selected: controller.category == ContentType.movies,
                  onSelected: (_) => ref
                      .read(searchControllerProvider.notifier)
                      .changeCategory(ContentType.movies),
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: Text(l10n.contentTypeSeries),
                  selected: controller.category == ContentType.series,
                  onSelected: (_) => ref
                      .read(searchControllerProvider.notifier)
                      .changeCategory(ContentType.series),
                ),
              ],
            ),
          ),
          Expanded(child: _buildResults(controller.category)),
        ],
      ),
    );
  }

  Widget _buildResults(ContentType category) {
    return switch (category) {
      ContentType.movies => const _MoviesResults(),
      ContentType.series => const _SeriesResults(),
    };
  }
}

class _MoviesResults extends ConsumerWidget {
  const _MoviesResults();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(searchControllerProvider);

    if (controller.query.isEmpty) {
      return const EmptyContainer();
    }

    if (controller.hasError) {
      return Center(
        child: Text(AppLocalizations.of(context)!.couldNotLoadContent),
      );
    }

    if (controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final movies = ref.watch(searchedMoviesProvider);

    if (movies.isEmpty) {
      return const EmptyContainer();
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final Movie movie = movies[index];
        return SearchResultItem(
          title: movie.title.nonNullValue(),
          overview: movie.overview.nonNullValue(),
          rating: movie.voteAverage.nonNullValue(),
          imageUrl: movie.posterPath.nonNullValue(),
          onTap: () => context.push('/home/0/movie/${movie.id}'),
        );
      },
    );
  }
}

class _SeriesResults extends ConsumerWidget {
  const _SeriesResults();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(searchControllerProvider);

    if (controller.query.isEmpty) {
      return const EmptyContainer();
    }

    if (controller.hasError) {
      return Center(
        child: Text(AppLocalizations.of(context)!.couldNotLoadContent),
      );
    }

    if (controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final series = ref.watch(searchedSeriesProvider);

    if (series.isEmpty) {
      return const EmptyContainer();
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: series.length,
      itemBuilder: (context, index) {
        final TvShow show = series[index];
        return SearchResultItem(
          title: show.name.nonNullValue(),
          overview: show.overview.nonNullValue(),
          rating: show.voteAverage.nonNullValue(),
          imageUrl: show.posterPath.nonNullValue(),
          onTap: () => context.push('/home/0/series/${show.id}'),
        );
      },
    );
  }
}
