import 'package:clappy/domain/entities/movie.dart';
import 'package:clappy/presentation/widgets/movies/movie_poster_link.dart';
import 'package:clappy/presentation/widgets/shared/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Movie _buildMovie() => Movie(
  adult: false,
  backdropPath: '',
  genreIds: const [],
  id: 1,
  originalLanguage: 'en',
  originalTitle: 'Interstellar',
  overview: '',
  popularity: 0,
  posterPath: 'https://image.tmdb.org/t/p/w500/poster.jpg',
  releaseDate: null,
  title: 'Interstellar',
  video: false,
  voteAverage: 0,
  voteCount: 0,
  budget: 0,
  revenue: 0,
  runtime: 0,
);

void main() {
  testWidgets('renders the poster image with an accessible label', (
    tester,
  ) async {
    final movie = _buildMovie();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: MoviePosterLink(movie: movie)),
      ),
    );
    await tester.pump();

    expect(find.byType(AppNetworkImage), findsOneWidget);
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Semantics && widget.properties.label == 'Interstellar',
      ),
      findsOneWidget,
    );
  });
}
