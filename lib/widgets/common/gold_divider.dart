import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';

class GoldDivider extends StatelessWidget {
  final double width;
  final double height;
  final Alignment alignment;
  final bool showDiamond;

  const GoldDivider({
    super.key,
    this.width = 60,
    this.height = 2,
    this.alignment = Alignment.centerLeft,
    this.showDiamond = false,
  });

  @override
  Widget build(BuildContext context) {
    if (width.isInfinite) {
      return Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          gradient: AppColors.goldGradient,
          borderRadius: BorderRadius.circular(height / 2),
        ),
      );
    }

    return Align(
      alignment: alignment,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: AppColors.goldGradient,
              borderRadius: BorderRadius.circular(height / 2),
            ),
          ),
          if (showDiamond) ...[
            const SizedBox(width: 8),
            Transform.rotate(
              angle: 0.785398, // 45 degrees
              child: Container(
                width: 6,
                height: 6,
                color: AppColors.gold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
