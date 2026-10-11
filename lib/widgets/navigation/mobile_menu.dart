import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/routes/app_routes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../common/app_logo.dart';
import '../common/gold_divider.dart';
import '../common/primary_button.dart';

class MobileMenu extends StatelessWidget {
  final bool isOpen;
  final String currentRoute;
  final VoidCallback onClose;
  final Function(String route)? onNavClick;

  const MobileMenu({
    super.key,
    required this.isOpen,
    required this.currentRoute,
    required this.onClose,
    this.onNavClick,
  });

  @override
  Widget build(BuildContext context) {
    if (!isOpen) return const SizedBox.shrink();

    return AnimatedOpacity(
      opacity: isOpen ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: Material(
        color: AppColors.charcoal,
        child: SafeArea(
          child: Column(
            children: [
              // Mobile Menu Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppLogo(
                      variant: AppLogoVariant.gold,
                      height: 60,
                      alignment: Alignment.centerLeft,
                    ),
                    IconButton(
                      onPressed: onClose,
                      icon: const Icon(
                        Icons.close_rounded,
                        color: AppColors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),

              const GoldDivider(width: 80, alignment: Alignment.center),
              const SizedBox(height: 32),

              // Menu Links
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  children: [
                    _MobileMenuItem(
                      title: 'HOME',
                      route: AppRoutes.home,
                      isActive: currentRoute == AppRoutes.home,
                      onTap: () => _navigate(AppRoutes.home),
                    ),
                    _MobileMenuItem(
                      title: 'ABOUT',
                      route: AppRoutes.about,
                      isActive: currentRoute == AppRoutes.about,
                      onTap: () => _navigate(AppRoutes.about),
                    ),
                    _MobileMenuItem(
                      title: 'CATERING',
                      route: AppRoutes.catering,
                      isActive: currentRoute == AppRoutes.catering,
                      onTap: () => _navigate(AppRoutes.catering),
                    ),
                    _MobileMenuItem(
                      title: 'EVENTS',
                      route: AppRoutes.events,
                      isActive: currentRoute == AppRoutes.events,
                      onTap: () => _navigate(AppRoutes.events),
                    ),
                    _MobileMenuItem(
                      title: 'MENU',
                      route: AppRoutes.menu,
                      isActive: currentRoute == AppRoutes.menu,
                      onTap: () => _navigate(AppRoutes.menu),
                    ),
                    _MobileMenuItem(
                      title: 'GALLERY',
                      route: AppRoutes.gallery,
                      isActive: currentRoute == AppRoutes.gallery,
                      onTap: () => _navigate(AppRoutes.gallery),
                    ),
                    _MobileMenuItem(
                      title: 'CONTACT',
                      route: AppRoutes.contact,
                      isActive: currentRoute == AppRoutes.contact,
                      onTap: () => _navigate(AppRoutes.contact),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),

              // Large Gold CTA
              Padding(
                padding: const EdgeInsets.all(24),
                child: PrimaryButton(
                  text: 'PLAN YOUR EVENT',
                  fullWidth: true,
                  height: 54,
                  onPressed: () => _navigate(AppRoutes.contact),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigate(String route) {
    onClose();
    if (onNavClick != null) {
      onNavClick!(route);
    } else {
      Get.toNamed(route);
    }
  }
}

class _MobileMenuItem extends StatelessWidget {
  final String title;
  final String route;
  final bool isActive;
  final VoidCallback onTap;

  const _MobileMenuItem({
    required this.title,
    required this.route,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.h3(
                color: isActive ? AppColors.gold : AppColors.white,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: isActive ? AppColors.gold : AppColors.champagne.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
