import 'package:flutter/material.dart';
import '../../app/constants/asset_constants.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_text_styles.dart';
import '../../utils/responsive_utils.dart';
import '../common/animated_reveal.dart';
import '../common/gold_divider.dart';
import '../common/image_container.dart';
import '../common/secondary_button.dart';

class EventManagementSection extends StatelessWidget {
  final VoidCallback onExploreEvents;

  const EventManagementSection({
    super.key,
    required this.onExploreEvents,
  });

  final List<String> eventCapabilities = const [
    'Complete Event Planning',
    'Venue Styling & Coordination',
    'Full Catering Management',
    'VIP Guest Experience',
    'Staff & Steward Coordination',
    'On-Site Event Day Execution',
  ];

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
              final leftContent = AnimatedReveal(
                direction: RevealDirection.slideRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BEYOND CATERING',
                      style: AppTextStyles.eyebrow(color: AppColors.deepGold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your Vision.\nOur Planning.\nA Celebration to Remember.',
                      style: isMobile
                          ? AppTextStyles.h1Mobile()
                          : AppTextStyles.h1(),
                    ),
                    const SizedBox(height: 12),
                    const GoldDivider(width: 60, showDiamond: true),
                    const SizedBox(height: 16),
                    Text(
                      'We extend our culinary hospitality into full end-to-end event management. From seating arrangements to floral styling, dining logistics, and host support, we handle the intricacies so you can cherish every moment.',
                      style: AppTextStyles.bodyLarge(),
                    ),
                    const SizedBox(height: 28),

                    // Capabilities Grid
                    Wrap(
                      spacing: 20,
                      runSpacing: 12,
                      children: eventCapabilities.map((item) {
                        return SizedBox(
                          width: isMobile ? double.infinity : 240,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star_outline_rounded,
                                color: AppColors.deepGold,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  item,
                                  style: AppTextStyles.bodyMedium(
                                    color: AppColors.charcoal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 36),

                    SecondaryButton(
                      text: isMobile ? 'EVENT MANAGEMENT' : 'EXPLORE EVENT MANAGEMENT',
                      icon: Icons.arrow_forward_rounded,
                      onPressed: onExploreEvents,
                    ),
                  ],
                ),
              );

              final rightImage = AnimatedReveal(
                direction: RevealDirection.slideLeft,
                child: Stack(
                  children: [
                    ImageContainer(
                      imageUrl: AppImages.eventDecor,
                      height: isMobile ? 340 : 500,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.charcoal.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.gold),
                        ),
                        child: Text(
                          'END-TO-END COORDINATION',
                          style: AppTextStyles.eyebrow(color: AppColors.gold),
                        ),
                      ),
                    ),
                  ],
                ),
              );

              if (isMobile) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    leftContent,
                    const SizedBox(height: 40),
                    rightImage,
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 6, child: leftContent),
                  const SizedBox(width: 64),
                  Expanded(flex: 5, child: rightImage),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
