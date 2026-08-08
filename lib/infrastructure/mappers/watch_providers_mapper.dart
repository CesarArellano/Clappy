import '../../config/constants/tmdb_image.dart';
import '../../domain/entities/watch_providers.dart';
import '../models/moviedb/moviedb_watch_providers.dart';

class WatchProvidersMapper {
  static WatchProviders fromResponse(
    MoviedbWatchProvidersResponse response,
    String regionCode,
  ) {
    final country = response.results[regionCode];
    if (country == null) {
      return WatchProviders(
        link: null,
        categories: {
          for (final category in WatchProviderCategory.values) category: [],
        },
      );
    }

    return WatchProviders(
      link: country.link,
      categories: {
        WatchProviderCategory.flatrate: _toEntities(country.flatrate),
        WatchProviderCategory.rent: _toEntities(country.rent),
        WatchProviderCategory.buy: _toEntities(country.buy),
        WatchProviderCategory.free: _toEntities(country.free),
        WatchProviderCategory.ads: _toEntities(country.ads),
      },
    );
  }

  static List<WatchProvider> _toEntities(List<MoviedbProvider> providers) =>
      providers
          .map(
            (provider) => WatchProvider(
              providerId: provider.providerId,
              providerName: provider.providerName,
              logoPath: '${TmdbImage.baseUrlW92}${provider.logoPath}',
              displayPriority: provider.displayPriority,
            ),
          )
          .toList()
        ..sort((a, b) => a.displayPriority.compareTo(b.displayPriority));
}
