import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'shimmer_box.dart';

/// Cached remote image with shimmer placeholder and a graceful fallback
/// icon when a URL fails (useful pre-launch, before real media is hosted).
class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  final String url;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final image = CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      placeholder: (context, _) => const ShimmerCard(),
      errorWidget: (context, _, _) => Container(
        color: AppColors.navySurfaceAlt,
        alignment: Alignment.center,
        child: const Icon(Icons.image_outlined, color: AppColors.gold, size: 32),
      ),
    );
    if (borderRadius == null) return image;
    return ClipRRect(borderRadius: borderRadius!, child: image);
  }
}
