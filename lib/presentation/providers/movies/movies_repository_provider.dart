import 'package:clappy/config/extensions/watch_region_extensions.dart';
import 'package:clappy/infrastructure/datasources/movie_db_datasource.dart';
import 'package:clappy/infrastructure/repositories/movies_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../network/network_service_provider.dart';
import '../settings/watch_region_provider.dart';

// Inmutable Repository
final moviesRepositoryProvider = Provider<MoviesRepositoryImpl>((ref) {
  final regionCode = ref.watch(watchRegionProvider).countryCode;

  return MoviesRepositoryImpl(
    MovieDbDatasource(
      ref.watch(networkServiceProvider),
      regionCode: regionCode,
    ),
  );
});
