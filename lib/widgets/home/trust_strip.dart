import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';

class TrustStrip extends StatelessWidget {
  const TrustStrip({super.key});

  final List<String> items = const [
    'WEDDINGS',
    'CORPORATE EVENTS',
    'PRIVATE CELEBRATIONS',
    'KERALA CUISINE',
    'EVENT MANAGEMENT',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.cream,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _buildItemsWithSeparators(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildItemsWithSeparators() {
    final List<Widget> widgets = [];
    for (int i = 0; i < items.length; i++) {
      widgets.add(
        Text(items[i], style: AppTextStyles.eyebrow(color: AppColors.charcoal)),
      );
      if (i < items.length - 1) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                color: AppColors.gold,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      }
    }
    return widgets;
  }
}
