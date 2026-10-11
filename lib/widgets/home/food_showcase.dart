import 'package:flutter/material.dart';
import '../../app/constants/asset_constants.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_text_styles.dart';
import '../../utils/responsive_utils.dart';
import '../common/animated_reveal.dart';
import '../common/image_container.dart';
import '../common/section_header.dart';

class FoodShowcaseSection extends StatelessWidget {
  final VoidCallback onExploreMenu;

  const FoodShowcaseSection({
    super.key,
    required this.onExploreMenu,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      color: AppColors.charcoal,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.contentHorizontalPadding(context),
        vertical: isMobile ? AppSpacing.sectionSm : AppSpacing.sectionMd,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: Column(
            children: [
              const SectionHeader(
                eyebrow: 'OUR CULINARY EXPERIENCE',
                title: 'Flavours That Bring Everyone Together',
                description:
                    'Thoughtfully prepared menus, authentic regional flavours and beautiful presentation make every meal memorable.',
                darkMode: true,
              ),
              SizedBox(height: isMobile ? 32 : 56),

              // Asymmetric Grid Gallery
              if (isMobile)
                Column(
                  children: [
                    _FoodGalleryItem(
                      imageUrl: AppImages.sadya,
                      title: 'Kerala Sadya',
                      subtitle: '26+ Traditional Items',
                      height: 240,
                    ),
                    const SizedBox(height: 16),
                    _FoodGalleryItem(
                      imageUrl: AppImages.biriyani,
                      title: 'Thalassery Biriyani',
                      subtitle: 'Aromatic Kaima Rice',
                      height: 240,
                    ),
                    const SizedBox(height: 16),
                    _FoodGalleryItem(
                      imageUrl: AppImages.starters,
                      title: 'Live Starters & Kebabs',
                      subtitle: 'Hot Tawa Stations',
                      height: 240,
                    ),
                    const SizedBox(height: 16),
                    _FoodGalleryItem(
                      imageUrl: AppImages.buffet,
                      title: 'Grand Buffet Spread',
                      subtitle: 'Multi-Cuisine Delicacies',
                      height: 240,
                    ),
                    const SizedBox(height: 16),
                    _FoodGalleryItem(
                      imageUrl: AppImages.desserts,
                      title: 'Royal Payasam & Desserts',
                      subtitle: 'Artisanal Sweets',
                      height: 240,
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    // Top Row: 2 Large Feature Images
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: AnimatedReveal(
                            direction: RevealDirection.slideRight,
                            child: _FoodGalleryItem(
                              imageUrl: AppImages.sadya,
                              title: 'Traditional Kerala Sadya',
                              subtitle: 'Authentic 26+ Item Feast on Fresh Banana Leaves',
                              height: 380,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 5,
                          child: AnimatedReveal(
                            direction: RevealDirection.slideLeft,
                            child: _FoodGalleryItem(
                              imageUrl: AppImages.biriyani,
                              title: 'Malabar Heritage Biriyani',
                              subtitle: 'Slow Dum Cooked Short-Grain Kaima Rice',
                              height: 380,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Bottom Row: 3 Images
                    Row(
                      children: [
                        Expanded(
                          child: AnimatedReveal(
                            direction: RevealDirection.slideUp,
                            delay: const Duration(milliseconds: 100),
                            child: _FoodGalleryItem(
                              imageUrl: AppImages.starters,
                              title: 'Gourmet Starters',
                              subtitle: 'Live Tandoor & Seafood Counters',
                              height: 280,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: AnimatedReveal(
                            direction: RevealDirection.slideUp,
                            delay: const Duration(milliseconds: 200),
                            child: _FoodGalleryItem(
                              imageUrl: AppImages.buffet,
                              title: 'Grand Buffet spread',
                              subtitle: 'Global & Regional Specialties',
                              height: 280,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: AnimatedReveal(
                            direction: RevealDirection.slideUp,
                            delay: const Duration(milliseconds: 300),
                            child: _FoodGalleryItem(
                              imageUrl: AppImages.desserts,
                              title: 'Artisanal Desserts',
                              subtitle: 'Palada Payasam & Halwa Lounge',
                              height: 280,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              const SizedBox(height: 48),

              // Gold CTA Link
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: onExploreMenu,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'EXPLORE OUR FULL MENU',
                        style: AppTextStyles.button(color: AppColors.gold),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        color: AppColors.gold,
                        size: 18,
                      ),
                    ],
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

class _FoodGalleryItem extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double height;

  const _FoodGalleryItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.height,
  });

  @override
  State<_FoodGalleryItem> createState() => _FoodGalleryItemState();
}

class _FoodGalleryItemState extends State<_FoodGalleryItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _isHovered ? AppColors.gold : AppColors.softCharcoal,
            width: _isHovered ? 1.5 : 1.0,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedScale(
                scale: _isHovered ? 1.06 : 1.0,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutCubic,
                child: ImageContainer(
                  imageUrl: widget.imageUrl,
                  fit: BoxFit.cover,
                  overlayColor: AppColors.charcoal,
                  overlayOpacity: _isHovered ? 0.35 : 0.5,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: AppTextStyles.h3(color: AppColors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      style: AppTextStyles.bodySmall(
                        color: AppColors.champagne.withOpacity(0.9),
                      ),
                    ),
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
