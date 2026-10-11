import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../models/gallery_model.dart';
import '../../utils/responsive_utils.dart';
import '../common/image_container.dart';

class GalleryGrid extends StatelessWidget {
  final List<GalleryItemModel> items;
  final Function(int index) onItemTap;

  const GalleryGrid({
    super.key,
    required this.items,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);

    int crossCount = 3;
    if (isMobile) {
      crossCount = 1;
    } else if (isTablet) {
      crossCount = 2;
    }

    if (items.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(48),
        alignment: Alignment.center,
        child: Text(
          'No photos available for this category.',
          style: AppTextStyles.bodyLarge(),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth =
            (constraints.maxWidth - (crossCount - 1) * 20) / crossCount;

        return Wrap(
          spacing: 20,
          runSpacing: 20,
          children: items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;

            return SizedBox(
              width: cardWidth,
              child: _GalleryGridCard(
                item: item,
                onTap: () => onItemTap(index),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _GalleryGridCard extends StatefulWidget {
  final GalleryItemModel item;
  final VoidCallback onTap;

  const _GalleryGridCard({
    required this.item,
    required this.onTap,
  });

  @override
  State<_GalleryGridCard> createState() => _GalleryGridCardState();
}

class _GalleryGridCardState extends State<_GalleryGridCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered ? AppColors.gold : AppColors.borderLight,
              width: _isHovered ? 1.5 : 1.0,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 280,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AnimatedScale(
                    scale: _isHovered ? 1.06 : 1.0,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOutCubic,
                    child: ImageContainer(
                      imageUrl: widget.item.imageUrl,
                      fit: BoxFit.cover,
                      overlayColor: AppColors.charcoal,
                      overlayOpacity: _isHovered ? 0.35 : 0.50,
                    ),
                  ),

                  // Overlay Caption on Hover
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.gold,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              widget.item.category,
                              style: const TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.5,
                                color: AppColors.charcoal,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            widget.item.title,
                            style: AppTextStyles.h3(color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
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
