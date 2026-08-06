import 'package:flutter/material.dart';

import 'package:clappy/presentation/widgets/shared/app_network_image.dart';

class CastCard extends StatelessWidget {
  const CastCard({
    super.key, 
    required this.title,
    required this.photoPath,
    required this.subtitle,
    this.onTap,
  });

  final VoidCallback? onTap;
  final String title;
  final String photoPath;
  final String subtitle;

  @override
  Widget build(BuildContext context) {

    return Semantics(
      button: true,
      label: title,
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 140,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: AppNetworkImage(
                    imageUrl: photoPath,
                    width: double.infinity,
                    height: 160,
                    cacheWidth: 150,
                  ),
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: Text(
                    title,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Text(
                      subtitle,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
