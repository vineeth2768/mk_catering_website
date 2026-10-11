import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';

class ScrollToTopButton extends StatelessWidget {
  final bool visible;
  final VoidCallback onTap;

  const ScrollToTopButton({
    super.key,
    required this.visible,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutBack,
      child: Tooltip(
        message: 'Scroll to Top',
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.charcoal,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.gold, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.keyboard_arrow_up_rounded,
                color: AppColors.gold,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
