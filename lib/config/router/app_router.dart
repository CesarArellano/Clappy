import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/home/:page',
      builder: (_, state) {
        final String pageViewIndex = state.pathParameters['page'] ?? '0';
        return HomeScreen(pageIndex: int.parse(pageViewIndex));
      },
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (_, state) {
            final String movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          },
        ),
        GoRoute(
          path: 'person/:id',
          name: PersonScreen.name,
          builder: (_, state) {
            final String personId = state.pathParameters['id'] ?? 'no-id';
            return PersonScreen(personId: personId);
          },
        ),
        GoRoute(
          path: 'series/:id',
          name: SeriesScreen.name,
          builder: (_, state) {
            final String seriesId = state.pathParameters['id'] ?? 'no-id';
            return SeriesScreen(seriesId: seriesId);
          },
        ),
        GoRoute(
          path: 'preferences',
          name: PreferencesScreen.name,
          builder: (_, state) => const PreferencesScreen(),
        ),
        GoRoute(
          path: 'search',
          name: SearchScreen.name,
          builder: (_, state) => const SearchScreen(),
        ),
      ],
    ),
    GoRoute(path: '/', redirect: (_, _) => '/home/0'),
  ],
);
