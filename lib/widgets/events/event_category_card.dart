import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../models/event_model.dart';
import '../common/gold_divider.dart';
import '../common/image_container.dart';
import '../common/primary_button.dart';

class EventCategoryCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback onTap;

  const EventCategoryCard({
    super.key,
    required this.event,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ImageContainer(
                imageUrl: event.image,
                height: 240,
                width: double.infinity,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.charcoal,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.gold),
                  ),
                  child: Text(
                    event.category,
                    style: AppTextStyles.eyebrow(color: AppColors.gold),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: AppTextStyles.h3(color: AppColors.charcoal),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.people_outline_rounded,
                      color: AppColors.deepGold,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      event.guestCount,
                      style: AppTextStyles.bodySmall(color: AppColors.textMuted),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const GoldDivider(width: 40),
                const SizedBox(height: 12),
                Text(
                  event.description,
                  style: AppTextStyles.bodyMedium(color: AppColors.textMuted),
                ),
                const SizedBox(height: 20),

                PrimaryButton(
                  text: 'VIEW EVENT DETAILS',
                  height: 44,
                  horizontalPadding: 20,
                  onPressed: onTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
