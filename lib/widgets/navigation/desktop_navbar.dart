import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/routes/app_routes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../common/app_logo.dart';
import '../common/primary_button.dart';

class DesktopNavbar extends StatelessWidget {
  final bool isScrolled;
  final String currentRoute;
  final Function(String path)? onNavClick;

  const DesktopNavbar({
    super.key,
    required this.isScrolled,
    required this.currentRoute,
    this.onNavClick,
  });

  @override
  Widget build(BuildContext context) {
    final bool isHome = currentRoute == AppRoutes.home;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 10),
      decoration: BoxDecoration(
        color: isScrolled
            ? AppColors.charcoal.withValues(alpha: 0.96)
            : (isHome ? Colors.transparent : AppColors.charcoal),
        boxShadow: isScrolled
            ? [
                BoxShadow(
                  color: AppColors.gold.withValues(alpha: 0.25),
                  blurRadius: 20,
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
          // Logo
          AppLogo(
            variant: AppLogoVariant.light,
            height: 85,
            alignment: Alignment.centerLeft,
            onTap: () {
              if (onNavClick != null) {
                onNavClick!(AppRoutes.home);
              } else {
                Get.toNamed(AppRoutes.home);
              }
            },
          ),

          // Nav Links
          Row(
            children: [
              _NavItem(
                title: 'HOME',
                route: AppRoutes.home,
                currentRoute: currentRoute,
                isDarkText: false,
                onTap: () => _handleNav(AppRoutes.home),
              ),
              const SizedBox(width: 32),
              _NavItem(
                title: 'ABOUT',
                route: AppRoutes.about,
                currentRoute: currentRoute,
                isDarkText: false,
                onTap: () => _handleNav(AppRoutes.about),
              ),
              const SizedBox(width: 32),
              _NavItem(
                title: 'CATERING',
                route: AppRoutes.catering,
                currentRoute: currentRoute,
                isDarkText: false,
                onTap: () => _handleNav(AppRoutes.catering),
              ),
              const SizedBox(width: 32),
              _NavItem(
                title: 'EVENTS',
                route: AppRoutes.events,
                currentRoute: currentRoute,
                isDarkText: false,
                onTap: () => _handleNav(AppRoutes.events),
              ),
              const SizedBox(width: 32),
              _NavItem(
                title: 'MENU',
                route: AppRoutes.menu,
                currentRoute: currentRoute,
                isDarkText: false,
                onTap: () => _handleNav(AppRoutes.menu),
              ),
              const SizedBox(width: 32),
              _NavItem(
                title: 'GALLERY',
                route: AppRoutes.gallery,
                currentRoute: currentRoute,
                isDarkText: false,
                onTap: () => _handleNav(AppRoutes.gallery),
              ),
              const SizedBox(width: 32),
              _NavItem(
                title: 'CONTACT',
                route: AppRoutes.contact,
                currentRoute: currentRoute,
                isDarkText: false,
                onTap: () => _handleNav(AppRoutes.contact),
              ),
            ],
          ),

          // Action Button
          PrimaryButton(
            text: 'GET A QUOTE',
            height: 46,
            horizontalPadding: 24,
            onPressed: () => _handleNav(AppRoutes.contact),
          ),
        ],
      ),
    );
  }

  void _handleNav(String route) {
    if (onNavClick != null) {
      onNavClick!(route);
    } else {
      Get.toNamed(route);
    }
  }
}

class _NavItem extends StatefulWidget {
  final String title;
  final String route;
  final String currentRoute;
  final bool isDarkText;
  final VoidCallback onTap;

  const _NavItem({
    required this.title,
    required this.route,
    required this.currentRoute,
    required this.isDarkText,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isActive = widget.currentRoute == widget.route;
    final Color textColor = widget.isDarkText
        ? (isActive || _isHovered ? AppColors.deepGold : AppColors.charcoal)
        : (isActive || _isHovered ? AppColors.gold : AppColors.white);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: AppTextStyles.navLink(
                color: textColor,
                isActive: isActive,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: (isActive || _isHovered) ? 20 : 0,
              decoration: const BoxDecoration(
                gradient: AppColors.goldGradient,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
