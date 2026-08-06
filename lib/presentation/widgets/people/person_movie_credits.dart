import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../config/extensions/network_exception_extensions.dart';
import '../../../config/extensions/null_extensions.dart';
import '../../../config/network/network_exceptions.dart';
import '../../../domain/entities/movie_credit.dart';
import '../../../l10n/app_localizations.dart';
import '../../providers/providers.dart';
import '../shared/cast_card.dart';
import '../shared/error_state.dart';
import '../shared/skeleton_placeholders.dart';

final personMovieCreditsProvider = FutureProvider.family((ref, int personId) {
  final peopleRepository = ref.watch(peopleRepositoryProvider);
  return peopleRepository.getMovieCreditsByPerson(personId);
});

class PersonMovieCredits extends ConsumerWidget {
  const PersonMovieCredits({super.key, required this.personId});

  final int personId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creditsFuture = ref.watch(personMovieCreditsProvider(personId));

    return creditsFuture.when(
      data: (credits) => _CreditsList(credits: credits),
      error: (err, _) {
        final l10n = AppLocalizations.of(context)!;
        return ErrorStateWidget(
          message: err is NetworkException
              ? err.localizedMessage(l10n)
              : l10n.couldNotLoadContent,
          onRetry: () => ref.invalidate(personMovieCreditsProvider(personId)),
        );
      },
      loading: () => const CastListSkeleton(titleWidth: 94),
    );
  }
}

class _CreditsList extends StatelessWidget {
  const _CreditsList({required this.credits});
  final List<MovieCredit> credits;

  @override
  Widget build(BuildContext context) {
    if (credits.isEmpty) return const SizedBox();

    final i18n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            AppLocalizations.of(context)!.moviesLabel,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: credits.length,
            itemBuilder: (context, index) {
              final credit = credits[index];
              return CastCard(
                onTap: () => context.push('/home/0/movie/${credit.id}'),
                photoPath: credit.posterPath,
                title: credit.title,
                subtitle: credit.character.nonNullValue(i18n.noCharacter),
              );
            },
          ),
        ),
      ],
    );
  }
}
