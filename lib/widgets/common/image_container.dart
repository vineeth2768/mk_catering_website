import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Color? overlayColor;
  final double overlayOpacity;

  const ImageContainer({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.overlayColor,
    this.overlayOpacity = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(8);

    return ClipRRect(
      borderRadius: radius,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            width: width,
            height: height,
            fit: fit,
            placeholder: (context, url) => Container(
              width: width,
              height: height,
              color: AppColors.cream.withOpacity(0.5),
              child: const Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.gold),
                  ),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              width: width,
              height: height,
              color: AppColors.softCharcoal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.champagne.withOpacity(0.5)),
                    ),
                    child: const Icon(
                      Icons.restaurant_menu_rounded,
                      color: AppColors.champagne,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'MK CATERING',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                      color: AppColors.champagne.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (overlayColor != null || overlayOpacity > 0)
            Positioned.fill(
              child: Container(
                color: (overlayColor ?? AppColors.charcoal).withOpacity(overlayOpacity),
              ),
            ),
        ],
      ),
    );
  }
}
