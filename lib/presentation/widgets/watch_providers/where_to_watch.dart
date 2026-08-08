import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/extensions/network_exception_extensions.dart';
import '../../../config/network/network_exceptions.dart';
import '../../../domain/entities/entities.dart';
import '../../../l10n/app_localizations.dart';
import '../../providers/providers.dart';
import '../shared/app_network_image.dart';
import '../shared/error_state.dart';
import '../shared/skeleton_placeholders.dart';

final FutureProviderFamily<WatchProviders, int> watchProvidersForMovieProvider =
    FutureProvider.family((ref, int movieId) {
      final movieRepository = ref.watch(moviesRepositoryProvider);
      return movieRepository.getWatchProviders(movieId);
    });

final FutureProviderFamily<WatchProviders, int>
watchProvidersForSeriesProvider = FutureProvider.family((ref, int seriesId) {
  final seriesRepository = ref.watch(seriesRepositoryProvider);
  return seriesRepository.getWatchProviders(seriesId);
});

class WhereToWatchMovie extends ConsumerWidget {
  const WhereToWatchMovie({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchProviders = ref.watch(watchProvidersForMovieProvider(movieId));

    return _WhereToWatchBody(
      watchProviders: watchProviders,
      onRetry: () => ref.invalidate(watchProvidersForMovieProvider(movieId)),
    );
  }
}

class WhereToWatchSeries extends ConsumerWidget {
  const WhereToWatchSeries({super.key, required this.seriesId});

  final int seriesId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchProviders = ref.watch(watchProvidersForSeriesProvider(seriesId));

    return _WhereToWatchBody(
      watchProviders: watchProviders,
      onRetry: () => ref.invalidate(watchProvidersForSeriesProvider(seriesId)),
    );
  }
}

class _WhereToWatchBody extends StatelessWidget {
  const _WhereToWatchBody({
    required this.watchProviders,
    required this.onRetry,
  });

  final AsyncValue<WatchProviders> watchProviders;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return watchProviders.when(
      data: (providers) => providers.isEmpty
          ? const SizedBox()
          : _WatchProvidersSection(providers: providers),
      error: (err, _) {
        final l10n = AppLocalizations.of(context)!;
        return ErrorStateWidget(
          message: err is NetworkException
              ? err.localizedMessage(l10n)
              : l10n.couldNotLoadContent,
          onRetry: onRetry,
        );
      },
      loading: () => const WatchProvidersSkeleton(),
    );
  }
}

class _WatchProvidersSection extends StatelessWidget {
  const _WatchProvidersSection({required this.providers});

  final WatchProviders providers;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            l10n.whereToWatch,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        _ProviderCategoryRow(
          label: l10n.streamOn,
          providers:
              providers.categories[WatchProviderCategory.flatrate] ?? const [],
        ),
        _ProviderCategoryRow(
          label: l10n.watchFree,
          providers:
              providers.categories[WatchProviderCategory.free] ?? const [],
        ),
        _ProviderCategoryRow(
          label: l10n.rentOn,
          providers:
              providers.categories[WatchProviderCategory.rent] ?? const [],
        ),
        _ProviderCategoryRow(
          label: l10n.buyOn,
          providers:
              providers.categories[WatchProviderCategory.buy] ?? const [],
        ),
        _ProviderCategoryRow(
          label: l10n.watchWithAds,
          providers:
              providers.categories[WatchProviderCategory.ads] ?? const [],
        ),
        if (providers.link != null)
          _MoreWatchOptionsLink(link: providers.link!),
      ],
    );
  }
}

class _ProviderCategoryRow extends StatelessWidget {
  const _ProviderCategoryRow({required this.label, required this.providers});

  final String label;
  final List<WatchProvider> providers;

  @override
  Widget build(BuildContext context) {
    if (providers.isEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 56,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: providers.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) =>
                  _ProviderLogoChip(provider: providers[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProviderLogoChip extends StatelessWidget {
  const _ProviderLogoChip({required this.provider});

  final WatchProvider provider;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: provider.providerName,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AppNetworkImage(
          imageUrl: provider.logoPath,
          width: 60,
          height: 60,
          cacheWidth: 60,
          cacheHeight: 60,
        ),
      ),
    );
  }
}

class _MoreWatchOptionsLink extends StatelessWidget {
  const _MoreWatchOptionsLink({required this.link});

  final String link;

  Future<void> _openLink() async {
    try {
      await launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
    } on Object catch (error) {
      debugPrint('Failed to open watch providers link $link: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: _openLink,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          alignment: Alignment.centerLeft,
        ),
        child: Text(l10n.moreWatchOptions),
      ),
    );
  }
}
