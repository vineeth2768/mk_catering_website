import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_text_styles.dart';
import '../../utils/responsive_utils.dart';
import '../common/animated_reveal.dart';
import '../common/section_header.dart';

class WhyChooseSection extends StatelessWidget {
  const WhyChooseSection({super.key});

  final List<Map<String, String>> blocks = const [
    {
      'number': '01',
      'title': 'QUALITY YOU CAN TASTE',
      'description':
          'Hand-selected fresh local ingredients, authentic cold-pressed spices, and master chefs dedicated to flavor consistency across thousands of plates.',
    },
    {
      'number': '02',
      'title': 'SERVICE YOU CAN TRUST',
      'description':
          'Polished, uniform-clad hospitality stewards trained to deliver respectful, attentive, and warm table service for every single guest.',
    },
    {
      'number': '03',
      'title': 'MENUS MADE FOR YOU',
      'description':
          'Complete culinary flexibility—from pure vegetarian traditional Kerala Sadya to international fusion buffet menus tailored to your taste.',
    },
    {
      'number': '04',
      'title': 'DETAILS THAT MATTER',
      'description':
          'Temperature-controlled food logistics, impeccably styled buffet setups, zero-queue dining flow, and pristine venue cleanup post event.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      color: AppColors.softCharcoal,
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
                eyebrow: 'THE MK DIFFERENCE',
                title: 'Good Food Is Only the Beginning.',
                description:
                    'We measure our success not just by the taste of our food, but by the peace of mind we give hosts and the memories we create for guests.',
                darkMode: true,
              ),
              SizedBox(height: isMobile ? 32 : 64),

              // 4 Columns Grid (Equalized Height Across All Cards Without Overflow)
              LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktopFourCol = constraints.maxWidth > 1000;
                  final isTabletTwoCol = !isMobile && !isDesktopFourCol;

                  if (isDesktopFourCol) {
                    const double desktopCardMinHeight = 360.0;
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < blocks.length; i++) ...[
                          if (i > 0) const SizedBox(width: 24),
                          Expanded(
                            child: AnimatedReveal(
                              direction: RevealDirection.slideUp,
                              delay: Duration(milliseconds: i * 120),
                              child: _buildCard(
                                blocks[i],
                                minHeight: desktopCardMinHeight,
                              ),
                            ),
                          ),
                        ],
                      ],
                    );
                  }

                  if (isTabletTwoCol) {
                    const double tabletCardMinHeight = 300.0;
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: AnimatedReveal(
                                direction: RevealDirection.slideUp,
                                delay: const Duration(milliseconds: 0),
                                child: _buildCard(
                                  blocks[0],
                                  minHeight: tabletCardMinHeight,
                                ),
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: AnimatedReveal(
                                direction: RevealDirection.slideUp,
                                delay: const Duration(milliseconds: 120),
                                child: _buildCard(
                                  blocks[1],
                                  minHeight: tabletCardMinHeight,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: AnimatedReveal(
                                direction: RevealDirection.slideUp,
                                delay: const Duration(milliseconds: 240),
                                child: _buildCard(
                                  blocks[2],
                                  minHeight: tabletCardMinHeight,
                                ),
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: AnimatedReveal(
                                direction: RevealDirection.slideUp,
                                delay: const Duration(milliseconds: 360),
                                child: _buildCard(
                                  blocks[3],
                                  minHeight: tabletCardMinHeight,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }

                  // Mobile: 1 column
                  return Column(
                    children: [
                      for (int i = 0; i < blocks.length; i++) ...[
                        if (i > 0) const SizedBox(height: 24),
                        AnimatedReveal(
                          direction: RevealDirection.slideUp,
                          delay: Duration(milliseconds: i * 120),
                          child: _buildCard(blocks[i]),
                        ),
                      ],
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(Map<String, String> block, {double? minHeight}) {
    return Container(
      width: double.infinity,
      constraints: minHeight != null
          ? BoxConstraints(minHeight: minHeight)
          : null,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
      decoration: BoxDecoration(
        color: AppColors.charcoal,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.champagne.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            block['number']!,
            style: AppTextStyles.goldNumber(),
          ),
          const SizedBox(height: 10),
          Container(
            width: 32,
            height: 2,
            color: AppColors.gold,
          ),
          const SizedBox(height: 14),
          Text(
            block['title']!,
            style: AppTextStyles.h3(color: AppColors.white),
          ),
          const SizedBox(height: 10),
          Text(
            block['description']!,
            style: AppTextStyles.bodyMedium(
              color: AppColors.cream.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
