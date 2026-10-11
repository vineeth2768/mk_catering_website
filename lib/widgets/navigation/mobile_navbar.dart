import 'package:flutter/material.dart';
import '../../app/routes/app_routes.dart';
import '../../app/theme/app_colors.dart';
import '../common/app_logo.dart';

class MobileNavbar extends StatelessWidget {
  final bool isScrolled;
  final String currentRoute;
  final VoidCallback onMenuToggle;

  const MobileNavbar({
    super.key,
    required this.isScrolled,
    required this.currentRoute,
    required this.onMenuToggle,
  });

  @override
  Widget build(BuildContext context) {
    final bool isHome = currentRoute == AppRoutes.home;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: isScrolled
            ? AppColors.charcoal.withValues(alpha: 0.96)
            : (isHome ? Colors.transparent : AppColors.charcoal),
        boxShadow: isScrolled
            ? [
                BoxShadow(
                  color: AppColors.gold.withValues(alpha: 0.2),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                )
              ]
            : null,
        border: Border(
          bottom: BorderSide(
            color: isScrolled ? AppColors.gold : AppColors.gold.withValues(alpha: 0.15),
            width: isScrolled ? 1.5 : 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppLogo(
            variant: AppLogoVariant.light,
            height: 60,
            alignment: Alignment.centerLeft,
          ),
          IconButton(
            onPressed: onMenuToggle,
            icon: const Icon(
              Icons.menu_rounded,
              size: 28,
              color: AppColors.gold,
            ),
          ),
        ],
      ),
    );
  }
}
