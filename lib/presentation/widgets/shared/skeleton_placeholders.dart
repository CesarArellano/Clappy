import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppImageSkeleton extends StatelessWidget {
  const AppImageSkeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius = BorderRadius.zero,
  });

  final double? width;
  final double? height;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    final resolvedWidth = (width != null && width!.isFinite) ? width : null;
    final resolvedHeight = (height != null && height!.isFinite) ? height : null;

    return Skeletonizer.zone(
      child: resolvedHeight == null
          ? AspectRatio(
              aspectRatio: 2 / 3,
              child: Bone(
                width: resolvedWidth ?? double.infinity,
                height: double.infinity,
                borderRadius: borderRadius,
              ),
            )
          : Bone(
              width: resolvedWidth,
              height: resolvedHeight,
              borderRadius: borderRadius,
            ),
    );
  }
}

class HorizontalContentSkeleton extends StatelessWidget {
  const HorizontalContentSkeleton({
    super.key,
    this.title,
    this.subtitle,
    this.itemCount = 5,
  });

  final String? title;
  final String? subtitle;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      child: SizedBox(
        height: 325,
        child: Column(
          children: [
            if (title != null || subtitle != null)
              Container(
                padding: const EdgeInsets.only(top: 10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    if (title != null)
                      const Bone.text(fontSize: 22, width: 120),
                    const Spacer(),
                    if (subtitle != null)
                      const Bone(width: 82, height: 32, uniRadius: 16),
                  ],
                ),
              ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: itemCount,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) => const PosterTileSkeleton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PosterTileSkeleton extends StatelessWidget {
  const PosterTileSkeleton({
    super.key,
    this.width = 150,
    this.posterHeight = 200,
  });

  final double width;
  final double posterHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Bone(width: width, height: posterHeight, uniRadius: 20),
          const SizedBox(height: 8),
          Bone.text(width: width * 0.88),
          const SizedBox(height: 6),
          Row(
            children: [
              const Bone.icon(size: 18),
              const SizedBox(width: 6),
              Bone.text(width: width * 0.32),
              const Spacer(),
              Bone.text(width: width * 0.28),
            ],
          ),
        ],
      ),
    );
  }
}

class SlideshowSkeleton extends StatelessWidget {
  const SlideshowSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 0.8;

    return SizedBox(
      height: 240,
      width: double.infinity,
      child: Center(
        child: Skeletonizer.zone(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Bone(width: width, height: 210, uniRadius: 20),
          ),
        ),
      ),
    );
  }
}

class MasonrySkeleton extends StatelessWidget {
  const MasonrySkeleton({super.key, this.topPadding = 0, this.itemCount = 12});

  final double topPadding;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width / 3;

    return GridView.builder(
      padding: EdgeInsets.fromLTRB(10, topPadding, 10, 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.58,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) => Skeletonizer.zone(
        child: Column(
          children: [
            if (index == 1) const SizedBox(height: 40),
            Bone(width: width, height: index.isEven ? 190 : 150, uniRadius: 20),
          ],
        ),
      ),
    );
  }
}

class CastListSkeleton extends StatelessWidget {
  const CastListSkeleton({super.key, this.titleWidth = 80});

  final double titleWidth;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Bone.text(fontSize: 22, width: titleWidth),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 250,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              itemCount: 5,
              separatorBuilder: (context, index) => const SizedBox(width: 4),
              itemBuilder: (context, index) => SizedBox(
                width: 140,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Bone(width: double.infinity, height: 160, uniRadius: 5),
                        SizedBox(height: 8),
                        Bone.text(width: 94),
                        SizedBox(height: 5),
                        Bone.text(width: 76),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VideoSkeleton extends StatelessWidget {
  const VideoSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Bone.text(fontSize: 22, width: 86),
            SizedBox(height: 8),
            Bone.text(width: 180),
            SizedBox(height: 8),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Bone(width: double.infinity, height: double.infinity),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreenSkeleton extends StatelessWidget {
  const DetailScreenSkeleton({super.key, this.heroHeightFactor = 0.7});

  final double heroHeightFactor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final posterWidth = size.width * 0.3;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Skeletonizer.zone(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Bone(width: size.width, height: size.height * heroHeightFactor),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Bone(
                      width: posterWidth,
                      height: posterWidth * 1.5,
                      uniRadius: 20,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 8),
                          Bone.text(fontSize: 22, width: 180),
                          SizedBox(height: 8),
                          Bone.text(width: 140),
                          SizedBox(height: 12),
                          Bone.button(width: 86, height: 34),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Bone.text(fontSize: 22, width: 110),
                    SizedBox(height: 8),
                    Bone.multiText(lines: 4),
                    SizedBox(height: 18),
                    Bone.text(fontSize: 22, width: 92),
                    SizedBox(height: 8),
                    Bone.multiText(lines: 3),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeContentSkeleton extends StatelessWidget {
  const HomeContentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Skeletonizer.zone(
          child: Row(
            children: [
              Bone(width: 82, height: 32, uniRadius: 16),
              SizedBox(width: 8),
              Bone(width: 82, height: 32, uniRadius: 16),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const SlideshowSkeleton(),
        const SizedBox(height: 8),
        const HorizontalContentSkeleton(title: ''),
        const SizedBox(height: 8),
        const HorizontalContentSkeleton(title: ''),
      ],
    );
  }
}
