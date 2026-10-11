import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../models/testimonial_model.dart';

class TestimonialCard extends StatelessWidget {
  final TestimonialModel testimonial;

  const TestimonialCard({
    super.key,
    required this.testimonial,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.charcoal,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.champagne.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Gold Star Rating Row
          Row(
            children: List.generate(
              testimonial.rating,
              (index) => const Icon(
                Icons.star_rounded,
                color: AppColors.gold,
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Quote text
          Text(
            '"${testimonial.quote}"',
            style: AppTextStyles.bodyLarge(
              color: AppColors.white.withOpacity(0.95),
            ),
          ),
          const SizedBox(height: 24),

          // Divider line
          Container(
            width: 40,
            height: 1.5,
            color: AppColors.gold,
          ),
          const SizedBox(height: 16),

          // Client Name & Event Details
          Text(
            testimonial.clientName,
            style: AppTextStyles.h3(color: AppColors.gold),
          ),
          const SizedBox(height: 4),
          Text(
            '${testimonial.eventType} • ${testimonial.date}',
            style: AppTextStyles.bodySmall(
              color: AppColors.cream.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
