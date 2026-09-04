import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/app_colors.dart';
import 'shimmer_box.dart';

/// Renders an image from either a bundled asset (seed/offline data) or a
/// remote URL (future live API), including local SVGs. Falls back to a
/// gold placeholder icon if a remote URL fails to load.
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

  bool get _isAsset => url.startsWith('assets/');
  bool get _isSvg => url.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    Widget image;
    if (_isAsset) {
      image = _isSvg
          ? SvgPicture.asset(url, fit: fit)
          : Image.asset(url, fit: fit);
    } else {
      image = CachedNetworkImage(
        imageUrl: url,
        fit: fit,
        placeholder: (context, _) => const ShimmerCard(),
        errorWidget: (context, _, _) => Container(
          color: AppColors.navySurfaceAlt,
          alignment: Alignment.center,
          child: const Icon(Icons.image_outlined, color: AppColors.gold, size: 32),
        ),
      );
    }
    if (borderRadius == null) return image;
    return ClipRRect(borderRadius: borderRadius!, child: image);
  }
}
