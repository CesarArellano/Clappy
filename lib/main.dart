import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/extensions/app_language_extensions.dart';
import 'config/extensions/theme_preference_extensions.dart';
import 'config/router/app_router.dart';
import 'config/theme/app_theme.dart';
import 'infrastructure/datasources/shared_preferences_datasource.dart';
import 'infrastructure/repositories/settings_repository_impl.dart';
import 'l10n/app_localizations.dart';
import 'presentation/providers/providers.dart';

void main() async {
  await dotenv.load();
  final settingsRepository = SettingsRepositoryImpl(
    datasource: SharedPreferencesDatasource(),
  );
  final initialThemePreference = await settingsRepository.getThemePreference();
  final initialAppLanguage = await settingsRepository.getAppLanguage();

  runApp(
    ProviderScope(
      overrides: [
        settingsRepositoryProvider.overrideWithValue(settingsRepository),
        themePreferenceProvider.overrideWith(
          (ref) => ThemePreferenceNotifier(
            settingsRepository,
            initialValue: initialThemePreference,
          ),
        ),
        appLanguageProvider.overrideWith(
          (ref) => AppLanguageNotifier(
            settingsRepository,
            initialValue: initialAppLanguage,
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Clappy',
      theme: const AppTheme().light,
      darkTheme: const AppTheme().dark,
      themeMode: ref.watch(themePreferenceProvider).themeMode,
      locale: ref.watch(appLanguageProvider).locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
