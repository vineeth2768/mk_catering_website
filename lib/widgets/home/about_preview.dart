import 'package:flutter/material.dart';
import '../../app/constants/asset_constants.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_text_styles.dart';
import '../../utils/responsive_utils.dart';
import '../common/animated_reveal.dart';
import '../common/experience_seal_badge.dart';
import '../common/gold_divider.dart';
import '../common/image_container.dart';
import '../common/secondary_button.dart';

class AboutPreviewSection extends StatelessWidget {
  final VoidCallback onDiscoverMore;

  const AboutPreviewSection({
    super.key,
    required this.onDiscoverMore,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      color: AppColors.warmIvory,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.contentHorizontalPadding(context),
        vertical: isMobile ? AppSpacing.sectionSm : AppSpacing.sectionMd,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: Builder(
            builder: (context) {
              final leftImage = AnimatedReveal(
                direction: RevealDirection.slideRight,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ImageContainer(
                      imageUrl: AppImages.chefHospitality,
                      height: isMobile ? 360 : 520,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: Container(
                        width: isMobile ? 100 : 140,
                        height: isMobile ? 100 : 140,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.gold, width: 2),
                        ),
                      ),
                    ),
                    Positioned(
                      top: isMobile ? 16 : 24,
                      right: isMobile ? 16 : 24,
                      child: ExperienceSealBadge(size: isMobile ? 85 : 110),
                    ),
                  ],
                ),
              );

              final rightContent = AnimatedReveal(
                direction: RevealDirection.slideLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ABOUT MK CATERING',
                      style: AppTextStyles.eyebrow(color: AppColors.deepGold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '35 YEARS OF HERITAGE.\nA LEGACY OF TASTE.',
                      style: isMobile
                          ? AppTextStyles.h1Mobile()
                          : AppTextStyles.h1(),
                    ),
                    const SizedBox(height: 12),
                    const GoldDivider(width: 60, showDiamond: true),
                    const SizedBox(height: 16),
                    Text(
                      'For over 35 years, MK Catering has been built on a timeless tradition of authentic flavours, heartfelt hospitality, and a passion for exceptional food. What began with our grandfather’s vision and love for traditional cooking has grown into a legacy that blends the warmth of traditional recipes with modern luxury.',
                      style: AppTextStyles.bodyLarge(),
                    ),
                    const SizedBox(height: 32),

                    SecondaryButton(
                      text: 'DISCOVER OUR LEGACY',
                      icon: Icons.arrow_forward_rounded,
                      onPressed: onDiscoverMore,
                    ),
                  ],
                ),
              );

              if (isMobile) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    leftImage,
                    const SizedBox(height: 40),
                    rightContent,
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 5, child: leftImage),
                  const SizedBox(width: 64),
                  Expanded(flex: 6, child: rightContent),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
