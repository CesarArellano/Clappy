import 'package:clappy/infrastructure/models/moviedb/moviedb_watch_providers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MoviedbWatchProvidersResponse.fromJson', () {
    test('parses multiple country keys with their categories', () {
      final response = MoviedbWatchProvidersResponse.fromJson({
        'id': 42,
        'results': {
          'US': {
            'link': 'https://www.themoviedb.org/movie/42/watch?locale=US',
            'flatrate': [
              {
                'logo_path': '/netflix.jpg',
                'provider_id': 8,
                'provider_name': 'Netflix',
                'display_priority': 0,
              },
            ],
            'rent': <Map<String, dynamic>>[],
            'buy': <Map<String, dynamic>>[],
          },
          'MX': {
            'link': 'https://www.themoviedb.org/movie/42/watch?locale=MX',
            'buy': [
              {
                'logo_path': '/apple.jpg',
                'provider_id': 2,
                'provider_name': 'Apple TV',
                'display_priority': 1,
              },
            ],
          },
        },
      });

      expect(response.id, 42);
      expect(response.results.keys, containsAll(['US', 'MX']));
      expect(response.results['US']!.flatrate, hasLength(1));
      expect(response.results['US']!.flatrate.first.providerName, 'Netflix');
      expect(response.results['MX']!.buy.first.providerName, 'Apple TV');
    });

    test(
      'defaults a missing category to an empty list instead of throwing',
      () {
        final response = MoviedbWatchProvidersResponse.fromJson({
          'id': 1,
          'results': {
            'US': {
              'link': 'https://www.themoviedb.org/movie/1/watch?locale=US',
              'rent': [
                {
                  'logo_path': '/apple.jpg',
                  'provider_id': 2,
                  'provider_name': 'Apple TV',
                  'display_priority': 0,
                },
              ],
            },
          },
        });

        final us = response.results['US']!;
        expect(us.flatrate, isEmpty);
        expect(us.buy, isEmpty);
        expect(us.free, isEmpty);
        expect(us.ads, isEmpty);
        expect(us.rent, hasLength(1));
      },
    );

    test('parses an empty results object without throwing', () {
      final response = MoviedbWatchProvidersResponse.fromJson({
        'id': 1,
        'results': <String, dynamic>{},
      });

      expect(response.results, isEmpty);
    });
  });
}
