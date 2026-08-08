import 'package:clappy/domain/entities/watch_region.dart';
import 'package:clappy/infrastructure/repositories/settings_repository_impl.dart';
import 'package:clappy/presentation/providers/settings/settings_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final watchRegionProvider =
    StateNotifierProvider<WatchRegionNotifier, WatchRegion>((ref) {
      return WatchRegionNotifier(ref.watch(settingsRepositoryProvider));
    });

class WatchRegionNotifier extends StateNotifier<WatchRegion> {
  WatchRegionNotifier(this._repository) : super(WatchRegion.us) {
    _loadPersisted();
  }

  final SettingsRepositoryImpl _repository;

  Future<void> _loadPersisted() async {
    final persisted = await _repository.getWatchRegion();
    if (!mounted || persisted == state) return;
    state = persisted;
  }

  Future<void> setWatchRegion(WatchRegion region) async {
    state = region;
    await _repository.setWatchRegion(region);
  }
}
