import 'dart:async';

import 'package:clappy/domain/entities/watch_providers.dart';
import 'package:clappy/l10n/app_localizations.dart';
import 'package:clappy/presentation/widgets/shared/error_state.dart';
import 'package:clappy/presentation/widgets/shared/skeleton_placeholders.dart';
import 'package:clappy/presentation/widgets/watch_providers/where_to_watch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:url_launcher_platform_interface/link.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

class _FakeUrlLauncherPlatform extends UrlLauncherPlatform {
  final List<String> launchedUrls = [];

  @override
  LinkDelegate? get linkDelegate => null;

  @override
  Future<bool> canLaunch(String url) async => true;

  @override
  Future<bool> launchUrl(String url, LaunchOptions options) async {
    launchedUrls.add(url);
    return true;
  }
}

WatchProvider _buildProvider({String name = 'Netflix'}) => WatchProvider(
  providerId: 8,
  providerName: name,
  logoPath: 'https://image.tmdb.org/t/p/w92/netflix.jpg',
  displayPriority: 0,
);

Widget _wrap(Widget child, List<Override> overrides) => ProviderScope(
  overrides: overrides,
  child: MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(body: child),
  ),
);

void main() {
  testWidgets('shows a skeleton while loading', (tester) async {
    await tester.pumpWidget(
      _wrap(const WhereToWatchMovie(movieId: 1), [
        watchProvidersForMovieProvider(
          1,
        ).overrideWith((ref) => Completer<WatchProviders>().future),
      ]),
    );
    await tester.pump();
    await tester.pump();

    expect(find.byType(WatchProvidersSkeleton), findsOneWidget);
  });

  testWidgets(
    'renders providers and the attribution link when data is present',
    (tester) async {
      final fakePlatform = _FakeUrlLauncherPlatform();
      UrlLauncherPlatform.instance = fakePlatform;

      final watchProviders = WatchProviders(
        link: 'https://www.themoviedb.org/movie/1/watch?locale=US',
        categories: {
          WatchProviderCategory.flatrate: [_buildProvider()],
        },
      );

      await tester.pumpWidget(
        _wrap(const WhereToWatchMovie(movieId: 1), [
          watchProvidersForMovieProvider(
            1,
          ).overrideWith((ref) async => watchProviders),
        ]),
      );
      await tester.pump();
      await tester.pump();

      final l10n = await AppLocalizations.delegate.load(const Locale('en'));
      expect(find.text(l10n.whereToWatch), findsOneWidget);
      expect(find.text(l10n.moreWatchOptions), findsOneWidget);

      await tester.tap(find.text(l10n.moreWatchOptions));
      await tester.pump();

      expect(fakePlatform.launchedUrls, [
        'https://www.themoviedb.org/movie/1/watch?locale=US',
      ]);
    },
  );

  testWidgets('renders nothing when there are no providers for the region', (
    tester,
  ) async {
    final watchProviders = WatchProviders(link: null, categories: const {});

    await tester.pumpWidget(
      _wrap(const WhereToWatchMovie(movieId: 1), [
        watchProvidersForMovieProvider(
          1,
        ).overrideWith((ref) async => watchProviders),
      ]),
    );
    await tester.pump();
    await tester.pump();

    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    expect(find.text(l10n.whereToWatch), findsNothing);
  });

  testWidgets('shows an error state with a working retry', (tester) async {
    var attempts = 0;

    await tester.pumpWidget(
      _wrap(const WhereToWatchMovie(movieId: 1), [
        watchProvidersForMovieProvider(1).overrideWith((ref) {
          attempts++;
          throw Exception('boom');
        }),
      ]),
    );
    await tester.pump();
    await tester.pump();

    expect(find.byType(ErrorStateWidget), findsOneWidget);
    expect(attempts, 1);

    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await tester.tap(find.text(l10n.retry));
    await tester.pump();
    await tester.pump();

    expect(attempts, 2);
  });
}
