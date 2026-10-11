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
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Editorial Image Frame
              Expanded(
                flex: isMobile ? 0 : 5,
                child: AnimatedReveal(
                  direction: RevealDirection.slideRight,
                  child: Stack(
                    children: [
                      const ImageContainer(
                        imageUrl: AppImages.chefHospitality,
                        height: 520,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: -10,
                        right: -10,
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.gold, width: 2),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 24,
                        right: 24,
                        child: ExperienceSealBadge(size: 110),
                      ),
                    ],
                  ),
                ),
              ),

              if (isMobile) const SizedBox(height: 40) else const SizedBox(width: 64),

              // Right Editorial Content
              Expanded(
                flex: isMobile ? 0 : 6,
                child: AnimatedReveal(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
