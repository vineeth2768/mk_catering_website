import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';

class SecondaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isDarkSection;
  final bool fullWidth;
  final double height;
  final double? horizontalPadding;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isDarkSection = false,
    this.fullWidth = false,
    this.height = 52.0,
    this.horizontalPadding,
  });

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.isDarkSection
        ? (_isHovered ? AppColors.gold : AppColors.champagne)
        : (_isHovered ? AppColors.deepGold : AppColors.gold);

    final textColor = widget.isDarkSection
        ? (_isHovered ? AppColors.gold : AppColors.white)
        : (_isHovered ? AppColors.deepGold : AppColors.charcoal);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          height: widget.height,
          width: widget.fullWidth ? double.infinity : null,
          padding: EdgeInsets.symmetric(
            horizontal: widget.horizontalPadding ?? 24.0,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: _isHovered
                ? (widget.isDarkSection
                    ? AppColors.white.withOpacity(0.05)
                    : AppColors.gold.withOpacity(0.1))
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: borderColor, width: 1.5),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.text.toUpperCase(),
                  style: AppTextStyles.button(color: textColor),
                ),
                if (widget.icon != null) ...[
                  const SizedBox(width: 8),
                  Icon(widget.icon, size: 16, color: textColor),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
