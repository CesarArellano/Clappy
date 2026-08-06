import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../config/extensions/network_exception_extensions.dart';
import '../../../config/network/network_exceptions.dart';
import '../../../domain/entities/entities.dart';
import '../../../l10n/app_localizations.dart';
import '../../providers/providers.dart';
import '../shared/app_network_image.dart';
import '../shared/error_state.dart';

final FutureProviderFamily<List<Video>, int> videosFromMovieProvider =
    FutureProvider.family((ref, int movieId) {
      final movieRepository = ref.watch(moviesRepositoryProvider);
      return movieRepository.getYoutubeVideosById(movieId);
    });

class VideosFromMovie extends ConsumerWidget {
  const VideosFromMovie({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesFromVideo = ref.watch(videosFromMovieProvider(movieId));

    return moviesFromVideo.when(
      data: (videos) => _VideosList(videos: videos),
      error: (err, _) {
        final l10n = AppLocalizations.of(context)!;
        return ErrorStateWidget(
          message: err is NetworkException
              ? err.localizedMessage(l10n)
              : l10n.couldNotLoadContent,
          onRetry: () => ref.invalidate(videosFromMovieProvider(movieId)),
        );
      },
      loading: () =>
          const Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }
}

class _VideosList extends StatefulWidget {
  const _VideosList({required this.videos});

  final List<Video> videos;

  @override
  State<_VideosList> createState() => _VideosListState();
}

class _VideosListState extends State<_VideosList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.videos.isEmpty) {
      return const SizedBox();
    }

    final selected = widget.videos[_selectedIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            AppLocalizations.of(context)!.videos,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        _YouTubeVideoPlayer(
          youtubeId: selected.youtubeKey,
          name: selected.name,
        ),
        if (widget.videos.length > 1) ...[
          const SizedBox(height: 8),
          _VideoThumbnailList(
            videos: widget.videos,
            selectedIndex: _selectedIndex,
            onSelect: (index) => setState(() => _selectedIndex = index),
          ),
        ],
      ],
    );
  }
}

class _VideoThumbnailList extends StatelessWidget {
  const _VideoThumbnailList({
    required this.videos,
    required this.selectedIndex,
    required this.onSelect,
  });

  final List<Video> videos;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          final isSelected = index == selectedIndex;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Semantics(
              button: true,
              label: video.name,
              selected: isSelected,
              child: GestureDetector(
                onTap: () => onSelect(index),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      border: isSelected
                          ? Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2,
                            )
                          : null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: AppNetworkImage(
                      imageUrl:
                          'https://img.youtube.com/vi/${video.youtubeKey}/hqdefault.jpg',
                      width: 160,
                      height: 90,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _YouTubeVideoPlayer extends StatefulWidget {
  const _YouTubeVideoPlayer({required this.youtubeId, required this.name});

  final String youtubeId;
  final String name;

  @override
  State<_YouTubeVideoPlayer> createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<_YouTubeVideoPlayer> {
  // The controller is created once and reused: [YoutubePlayer] captures it in
  // its own initState and ignores later controller swaps, so replacing it here
  // would leave the WebView bound to a closed controller and every JS call on
  // the new one would hang until the 30s readiness timeout.
  late final YoutubePlayerController _controller =
      YoutubePlayerController.fromVideoId(videoId: widget.youtubeId);

  @override
  void didUpdateWidget(covariant _YouTubeVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.youtubeId != oldWidget.youtubeId) {
      unawaited(_loadSelectedVideo());
    }
  }

  Future<void> _loadSelectedVideo() async {
    try {
      await _controller.loadVideoById(videoId: widget.youtubeId);
    } on Object catch (error) {
      debugPrint('Failed to load YouTube video ${widget.youtubeId}: $error');
    }
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.name),
          YoutubePlayer(controller: _controller),
        ],
      ),
    );
  }
}
