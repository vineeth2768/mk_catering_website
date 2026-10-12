import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../models/service_model.dart';
import '../common/gold_divider.dart';
import '../common/image_container.dart';
import '../common/primary_button.dart';

class CateringCategoryCard extends StatelessWidget {
  final ServiceModel service;
  final bool isReversed;
  final VoidCallback onInquire;

  const CateringCategoryCard({
    super.key,
    required this.service,
    this.isReversed = false,
    required this.onInquire,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 64),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 768;

          final imageWidget = Stack(
            children: [
              ImageContainer(
                imageUrl: service.image,
                height: isMobile ? 260 : 380,
                width: double.infinity,
                borderRadius: BorderRadius.circular(8),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.charcoal,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.gold),
                  ),
                  child: Text(
                    'SERVICE ${service.number}',
                    style: AppTextStyles.button(color: AppColors.gold),
                  ),
                ),
              ),
            ],
          );

          final textWidget = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                  service.title,
                  style: isMobile ? AppTextStyles.h1Mobile() : AppTextStyles.h1(),
                ),
                const SizedBox(height: 8),
                Text(
                  service.subtitle,
                  style: AppTextStyles.eyebrow(color: AppColors.deepGold),
                ),
                const SizedBox(height: 12),
                const GoldDivider(width: 60, showDiamond: true),
                const SizedBox(height: 16),
                Text(
                  service.description,
                  style: AppTextStyles.bodyLarge(),
                ),
                const SizedBox(height: 20),

                // Feature Checklist
                Column(
                  children: service.features.map((feature) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle_outline_rounded,
                            color: AppColors.deepGold,
                            size: 18,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              feature,
                              style: AppTextStyles.bodyMedium(color: AppColors.charcoal),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 28),

                PrimaryButton(
                  text: 'BOOK THIS SERVICE',
                  onPressed: onInquire,
                ),
              ],
            );

          if (isMobile) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageWidget,
                const SizedBox(height: 24),
                textWidget,
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: isReversed
                ? [
                    Expanded(flex: 6, child: textWidget),
                    const SizedBox(width: 48),
                    Expanded(flex: 6, child: imageWidget),
                  ]
                : [
                    Expanded(flex: 6, child: imageWidget),
                    const SizedBox(width: 48),
                    Expanded(flex: 6, child: textWidget),
                  ],
          );
        },
      ),
    );
  }
}
