import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../utils/url_launcher_utils.dart';

class FloatingWhatsappButton extends StatefulWidget {
  const FloatingWhatsappButton({super.key});

  @override
  State<FloatingWhatsappButton> createState() => _FloatingWhatsappButtonState();
}

class _FloatingWhatsappButtonState extends State<FloatingWhatsappButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: 'Chat on WhatsApp',
        child: GestureDetector(
          onTap: () => UrlLauncherUtils.openWhatsApp(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.charcoal,
              shape: BoxShape.circle,
              border: Border.all(
                color: _isHovered ? AppColors.lightGold : AppColors.gold,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.gold.withOpacity(_isHovered ? 0.4 : 0.2),
                  blurRadius: _isHovered ? 14 : 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Center(
              child: Icon(
                Icons.chat_bubble_outline_rounded,
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
