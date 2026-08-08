import '../../domain/entities/watch_region.dart';

extension WatchRegionX on WatchRegion {
  String get countryCode => switch (this) {
    WatchRegion.us => 'US',
    WatchRegion.mx => 'MX',
    WatchRegion.es => 'ES',
    WatchRegion.gb => 'GB',
    WatchRegion.ca => 'CA',
    WatchRegion.ar => 'AR',
    WatchRegion.br => 'BR',
    WatchRegion.fr => 'FR',
    WatchRegion.de => 'DE',
    WatchRegion.it => 'IT',
  };
}
