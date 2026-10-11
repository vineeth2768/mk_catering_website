import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../models/gallery_model.dart';
import '../common/image_container.dart';

class GalleryLightbox extends StatelessWidget {
  final bool isOpen;
  final GalleryItemModel? item;
  final int currentIndex;
  final int totalItems;
  final VoidCallback onClose;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const GalleryLightbox({
    super.key,
    required this.isOpen,
    required this.item,
    required this.currentIndex,
    required this.totalItems,
    required this.onClose,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    if (!isOpen || item == null) return const SizedBox.shrink();

    return AnimatedOpacity(
      opacity: isOpen ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      child: Material(
        color: Colors.black.withOpacity(0.92),
        child: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Image Container centered
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.gold, width: 2),
                            ),
                            child: ImageContainer(
                              imageUrl: item!.imageUrl,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        item!.title,
                        style: AppTextStyles.h2(color: AppColors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item!.caption,
                        style: AppTextStyles.bodyMedium(
                          color: AppColors.cream.withOpacity(0.8),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              // Close Button (Top Right)
              Positioned(
                top: 20,
                right: 20,
                child: IconButton(
                  onPressed: onClose,
                  icon: const Icon(
                    Icons.close_rounded,
                    color: AppColors.gold,
                    size: 32,
                  ),
                ),
              ),

              // Counter (Top Left)
              Positioned(
                top: 24,
                left: 24,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.charcoal,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.gold),
                  ),
                  child: Text(
                    '${currentIndex + 1} / $totalItems',
                    style: AppTextStyles.button(color: AppColors.gold),
                  ),
                ),
              ),

              // Previous Button (Left)
              Positioned(
                left: 20,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    onPressed: onPrevious,
                    icon: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: AppColors.charcoal,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.gold,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),

              // Next Button (Right)
              Positioned(
                right: 20,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    onPressed: onNext,
                    icon: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: AppColors.charcoal,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.gold,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
