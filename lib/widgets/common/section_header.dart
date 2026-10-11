import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../utils/responsive_utils.dart';
import 'gold_divider.dart';

class SectionHeader extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String? description;
  final Alignment alignment;
  final bool darkMode;

  const SectionHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    this.description,
    this.alignment = Alignment.center,
    this.darkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final titleColor = darkMode ? AppColors.white : AppColors.charcoal;
    final bodyColor = darkMode ? AppColors.cream.withOpacity(0.8) : AppColors.textMuted;
    final isCentered = alignment == Alignment.center;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Small gold eyebrow label
        Text(
          eyebrow.toUpperCase(),
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
          style: AppTextStyles.eyebrow(
            color: darkMode ? AppColors.champagne : AppColors.deepGold,
          ),
        ),
        const SizedBox(height: 8),

        // Title in Playfair Display
        Text(
          title,
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
          style: isMobile
              ? AppTextStyles.h1Mobile(color: titleColor)
              : AppTextStyles.h1(color: titleColor),
        ),
        const SizedBox(height: 12),

        // Subtle Gold Line Divider
        GoldDivider(
          alignment: alignment,
          width: 50,
          showDiamond: true,
        ),

        // Optional Description text
        if (description != null) ...[
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(
              description!,
              textAlign: isCentered ? TextAlign.center : TextAlign.start,
              style: AppTextStyles.bodyLarge(color: bodyColor),
            ),
          ),
        ],
      ],
    );
  }
}
