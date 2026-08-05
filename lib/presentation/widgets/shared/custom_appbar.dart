import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../l10n/app_localizations.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  static double height(BuildContext context) {
    return kToolbarHeight + MediaQuery.of(context).padding.top;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final titleStyle = theme.textTheme.titleMedium;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          color: colors.surface.withValues(alpha: 0.7),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            bottom: false,
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                children: [
                  Icon(Icons.movie_outlined, color: colors.primary),
                  const SizedBox(width: 5),
                  Text('Clappy', style: titleStyle),
                  const Spacer(),
                  IconButton(
                    onPressed: () => context.push('/home/0/search'),
                    icon: const Icon(Icons.search),
                  ),
                  IconButton(
                    tooltip: AppLocalizations.of(context)!.preferencesTooltip,
                    onPressed: () => context.push('/home/0/preferences'),
                    icon: const Icon(Icons.settings_outlined),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
