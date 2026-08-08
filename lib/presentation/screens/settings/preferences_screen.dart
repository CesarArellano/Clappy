import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/app_language.dart';
import '../../../domain/entities/theme_preference.dart';
import '../../../domain/entities/watch_region.dart';
import '../../../l10n/app_localizations.dart';
import '../../providers/providers.dart';

String _watchRegionLabel(AppLocalizations l10n, WatchRegion region) =>
    switch (region) {
      WatchRegion.us => l10n.regionUs,
      WatchRegion.mx => l10n.regionMx,
      WatchRegion.es => l10n.regionEs,
      WatchRegion.gb => l10n.regionGb,
      WatchRegion.ca => l10n.regionCa,
      WatchRegion.ar => l10n.regionAr,
      WatchRegion.br => l10n.regionBr,
      WatchRegion.fr => l10n.regionFr,
      WatchRegion.de => l10n.regionDe,
      WatchRegion.it => l10n.regionIt,
    };

class PreferencesScreen extends ConsumerWidget {
  const PreferencesScreen({super.key});

  static const name = 'preferences-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final themePreference = ref.watch(themePreferenceProvider);
    final appLanguage = ref.watch(appLanguageProvider);
    final watchRegion = ref.watch(watchRegionProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.preferencesTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.themeLabel,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(l10n.lightLabel),
                    selected: themePreference == ThemePreference.light,
                    onSelected: (_) => ref
                        .read(themePreferenceProvider.notifier)
                        .setThemePreference(ThemePreference.light),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(l10n.darkLabel),
                    selected: themePreference == ThemePreference.dark,
                    onSelected: (_) => ref
                        .read(themePreferenceProvider.notifier)
                        .setThemePreference(ThemePreference.dark),
                  ),
                ),
                ChoiceChip(
                  label: Text(l10n.systemLabel),
                  selected: themePreference == ThemePreference.system,
                  onSelected: (_) => ref
                      .read(themePreferenceProvider.notifier)
                      .setThemePreference(ThemePreference.system),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              l10n.languageLabel,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(l10n.englishLabel),
                    selected: appLanguage == AppLanguage.en,
                    onSelected: (_) => ref
                        .read(appLanguageProvider.notifier)
                        .setAppLanguage(AppLanguage.en),
                  ),
                ),
                ChoiceChip(
                  label: Text(l10n.spanishLabel),
                  selected: appLanguage == AppLanguage.es,
                  onSelected: (_) => ref
                      .read(appLanguageProvider.notifier)
                      .setAppLanguage(AppLanguage.es),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              l10n.watchRegionLabel,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final region in WatchRegion.values)
                  ChoiceChip(
                    label: Text(_watchRegionLabel(l10n, region)),
                    selected: watchRegion == region,
                    onSelected: (_) => ref
                        .read(watchRegionProvider.notifier)
                        .setWatchRegion(region),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
