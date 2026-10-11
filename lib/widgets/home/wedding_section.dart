import 'package:flutter/material.dart';
import '../../app/constants/asset_constants.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_text_styles.dart';
import '../../utils/responsive_utils.dart';
import '../common/animated_reveal.dart';
import '../common/gold_divider.dart';
import '../common/image_container.dart';
import '../common/primary_button.dart';

class WeddingSection extends StatelessWidget {
  final VoidCallback onPlanWedding;

  const WeddingSection({
    super.key,
    required this.onPlanWedding,
  });

  final List<String> features = const [
    'Custom Wedding Menus',
    'Traditional Kerala Sadya',
    'Premium Buffet Setup',
    'Professional Serving Staff',
    'Live Food Counters',
    'Guest-Focused Service',
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.charcoal,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned.fill(
            child: ImageContainer(
              imageUrl: AppImages.weddingHero,
              fit: BoxFit.cover,
              overlayColor: AppColors.charcoal,
              overlayOpacity: 0.8,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveUtils.contentHorizontalPadding(context),
              vertical: isMobile ? AppSpacing.sectionSm : AppSpacing.sectionLg,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'WEDDING CATERING',
                      style: AppTextStyles.eyebrow(color: AppColors.champagne),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Your Special Day Deserves Exceptional Food.',
                      textAlign: TextAlign.center,
                      style: isMobile
                          ? AppTextStyles.h1Mobile(color: AppColors.white)
                          : AppTextStyles.h1(color: AppColors.white),
                    ),
                    const SizedBox(height: 16),
                    const GoldDivider(width: 80, alignment: Alignment.center, showDiamond: true),
                    const SizedBox(height: 20),
                    Text(
                      'From royal banquets to intimate wedding celebrations, our master chefs curate bespoke culinary journeys that delight your guests and honor your tradition.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyLarge(
                        color: AppColors.cream.withOpacity(0.85),
                      ),
                    ),
                    const SizedBox(height: 36),

                    // Feature Checklist Grid
                    _buildFeatureGrid(isMobile),

                    const SizedBox(height: 40),

                    AnimatedReveal(
                      direction: RevealDirection.scale,
                      child: PrimaryButton(
                        text: 'PLAN YOUR WEDDING',
                        onPressed: onPlanWedding,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureGrid(bool isMobile) {
    return Wrap(
      spacing: isMobile ? 12 : 32,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: features.map((feature) {
        return SizedBox(
          width: isMobile ? double.infinity : 240,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.gold,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  size: 14,
                  color: AppColors.charcoal,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  feature,
                  style: AppTextStyles.bodyMedium(color: AppColors.white),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
