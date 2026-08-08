import 'package:clappy/config/constants/tmdb_image.dart';
import 'package:clappy/domain/entities/watch_providers.dart';
import 'package:clappy/infrastructure/mappers/watch_providers_mapper.dart';
import 'package:clappy/infrastructure/models/moviedb/moviedb_watch_providers.dart';
import 'package:flutter_test/flutter_test.dart';

MoviedbWatchProvidersResponse _buildResponse() =>
    MoviedbWatchProvidersResponse.fromJson({
      'id': 42,
      'results': {
        'US': {
          'link': 'https://www.themoviedb.org/movie/42/watch?locale=US',
          'flatrate': [
            {
              'logo_path': '/hbo.jpg',
              'provider_id': 384,
              'provider_name': 'HBO Max',
              'display_priority': 2,
            },
            {
              'logo_path': '/netflix.jpg',
              'provider_id': 8,
              'provider_name': 'Netflix',
              'display_priority': 0,
            },
          ],
        },
      },
    });

void main() {
  group('WatchProvidersMapper.fromResponse', () {
    test('resolves a present region with its link and sorted providers', () {
      final providers = WatchProvidersMapper.fromResponse(
        _buildResponse(),
        'US',
      );

      expect(
        providers.link,
        'https://www.themoviedb.org/movie/42/watch?locale=US',
      );
      final flatrate = providers.categories[WatchProviderCategory.flatrate]!;
      expect(flatrate.map((p) => p.providerName), ['Netflix', 'HBO Max']);
      expect(providers.categories[WatchProviderCategory.rent], isEmpty);
    });

    test('prefixes logo paths with TmdbImage.baseUrlW92', () {
      final providers = WatchProvidersMapper.fromResponse(
        _buildResponse(),
        'US',
      );

      final flatrate = providers.categories[WatchProviderCategory.flatrate]!;
      expect(flatrate.first.logoPath, '${TmdbImage.baseUrlW92}/netflix.jpg');
    });

    test(
      'returns a null link and all-empty categories for an absent region',
      () {
        final providers = WatchProvidersMapper.fromResponse(
          _buildResponse(),
          'FR',
        );

        expect(providers.link, isNull);
        expect(providers.isEmpty, isTrue);
      },
    );
  });
}
