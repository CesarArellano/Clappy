import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/extensions/watch_region_extensions.dart';
import '../../../infrastructure/datasources/tv_moviedb_datasource.dart';
import '../../../infrastructure/repositories/series_repository_impl.dart';
import '../network/network_service_provider.dart';
import '../settings/watch_region_provider.dart';

// Inmutable Repository
final seriesRepositoryProvider = Provider<SeriesRepositoryImpl>((ref) {
  final regionCode = ref.watch(watchRegionProvider).countryCode;

  return SeriesRepositoryImpl(
    TvMovieDbDatasource(
      ref.watch(networkServiceProvider),
      regionCode: regionCode,
    ),
  );
});
