import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/constants/app_constants.dart';
import '../../app/routes/app_routes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_text_styles.dart';
import '../../utils/responsive_utils.dart';
import '../../utils/url_launcher_utils.dart';
import '../common/app_logo.dart';
import '../common/gold_divider.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);

    return Container(
      color: AppColors.charcoal,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.contentHorizontalPadding(context),
        vertical: isMobile ? 48 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: Column(
            children: [
              // Top Grid Content
              if (isMobile) _buildMobileLayout() else _buildDesktopLayout(isTablet),

              const SizedBox(height: 48),
              const GoldDivider(width: double.infinity, height: 1),
              const SizedBox(height: 32),

              // Bottom Copyright Strip
              Wrap(
                alignment:
                    isMobile ? WrapAlignment.center : WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 12,
                spacing: 20,
                children: [
                  Text(
                    '© 2026 ${AppConstants.appName}. All Rights Reserved.',
                    style: AppTextStyles.bodySmall(
                      color: AppColors.cream.withValues(alpha: 0.5),
                    ),
                    textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  ),
                  Text(
                    'Crafted with Luxury Hospitality & Culinary Excellence',
                    style: AppTextStyles.bodySmall(
                      color: AppColors.champagne.withValues(alpha: 0.7),
                    ),
                    textAlign: isMobile ? TextAlign.center : TextAlign.end,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Brand Info Column
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppLogo(
                variant: AppLogoVariant.gold,
                height: 135,
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(height: 20),
              Text(
                AppConstants.appSubtitle,
                style: AppTextStyles.bodyMedium(
                  color: AppColors.cream.withOpacity(0.7),
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),
              // Social Icons Row
              Row(
                children: [
                  _SocialIconButton(
                    icon: Icons.camera_alt_outlined,
                    label: 'Instagram',
                    onTap: () => UrlLauncherUtils.openExternalUrl(AppConstants.instagramUrl),
                  ),
                  const SizedBox(width: 12),
                  _SocialIconButton(
                    icon: Icons.facebook_rounded,
                    label: 'Facebook',
                    onTap: () => UrlLauncherUtils.openExternalUrl(AppConstants.facebookUrl),
                  ),
                  const SizedBox(width: 12),
                  _SocialIconButton(
                    icon: Icons.play_circle_outline_rounded,
                    label: 'YouTube',
                    onTap: () => UrlLauncherUtils.openExternalUrl(AppConstants.youtubeUrl),
                  ),
                  const SizedBox(width: 12),
                  _SocialIconButton(
                    icon: Icons.chat_bubble_outline_rounded,
                    label: 'WhatsApp',
                    onTap: () => UrlLauncherUtils.openWhatsApp(),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 48),

        // Company Column
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'COMPANY',
                style: AppTextStyles.eyebrow(color: AppColors.gold),
              ),
              const SizedBox(height: 20),
              _FooterLink(label: 'Home', route: AppRoutes.home),
              _FooterLink(label: 'About Us', route: AppRoutes.about),
              _FooterLink(label: 'Catering Services', route: AppRoutes.catering),
              _FooterLink(label: 'Event Management', route: AppRoutes.events),
              _FooterLink(label: 'Culinary Menu', route: AppRoutes.menu),
              _FooterLink(label: 'Photo Gallery', route: AppRoutes.gallery),
              _FooterLink(label: 'Contact Us', route: AppRoutes.contact),
            ],
          ),
        ),

        // Services Column
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SERVICES',
                style: AppTextStyles.eyebrow(color: AppColors.gold),
              ),
              const SizedBox(height: 20),
              _FooterLink(label: 'Wedding Catering', route: AppRoutes.catering),
              _FooterLink(label: 'Corporate Catering', route: AppRoutes.catering),
              _FooterLink(label: 'Kerala Sadya Feasts', route: AppRoutes.catering),
              _FooterLink(label: 'Malabar Cuisine', route: AppRoutes.catering),
              _FooterLink(label: 'Private Celebrations', route: AppRoutes.catering),
              _FooterLink(label: 'Event Coordination', route: AppRoutes.events),
            ],
          ),
        ),

        // Contact Column
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CONTACT',
                style: AppTextStyles.eyebrow(color: AppColors.gold),
              ),
              const SizedBox(height: 20),
              _ContactInfoRow(
                icon: Icons.phone_outlined,
                text: AppConstants.phone,
                onTap: () => UrlLauncherUtils.openPhone(),
              ),
              const SizedBox(height: 12),
              _ContactInfoRow(
                icon: Icons.email_outlined,
                text: AppConstants.email,
                onTap: () => UrlLauncherUtils.openEmail(),
              ),
              const SizedBox(height: 12),
              _ContactInfoRow(
                icon: Icons.location_on_outlined,
                text: AppConstants.location,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppLogo(
          variant: AppLogoVariant.gold,
          height: 110,
          alignment: Alignment.centerLeft,
        ),
        const SizedBox(height: 16),
        Text(
          AppConstants.appSubtitle,
          style: AppTextStyles.bodyMedium(
            color: AppColors.cream.withOpacity(0.7),
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 32),

        Row(
          children: [
            _SocialIconButton(
              icon: Icons.camera_alt_outlined,
              label: 'Instagram',
              onTap: () => UrlLauncherUtils.openExternalUrl(AppConstants.instagramUrl),
            ),
            const SizedBox(width: 12),
            _SocialIconButton(
              icon: Icons.facebook_rounded,
              label: 'Facebook',
              onTap: () => UrlLauncherUtils.openExternalUrl(AppConstants.facebookUrl),
            ),
            const SizedBox(width: 12),
            _SocialIconButton(
              icon: Icons.play_circle_outline_rounded,
              label: 'YouTube',
              onTap: () => UrlLauncherUtils.openExternalUrl(AppConstants.youtubeUrl),
            ),
            const SizedBox(width: 12),
            _SocialIconButton(
              icon: Icons.chat_bubble_outline_rounded,
              label: 'WhatsApp',
              onTap: () => UrlLauncherUtils.openWhatsApp(),
            ),
          ],
        ),

        const SizedBox(height: 40),
        Text('COMPANY', style: AppTextStyles.eyebrow(color: AppColors.gold)),
        const SizedBox(height: 16),
        _FooterLink(label: 'About Us', route: AppRoutes.about),
        _FooterLink(label: 'Catering Services', route: AppRoutes.catering),
        _FooterLink(label: 'Event Management', route: AppRoutes.events),
        _FooterLink(label: 'Photo Gallery', route: AppRoutes.gallery),

        const SizedBox(height: 32),
        Text('CONTACT', style: AppTextStyles.eyebrow(color: AppColors.gold)),
        const SizedBox(height: 16),
        _ContactInfoRow(
          icon: Icons.phone_outlined,
          text: AppConstants.phone,
          onTap: () => UrlLauncherUtils.openPhone(),
        ),
        const SizedBox(height: 12),
        _ContactInfoRow(
          icon: Icons.email_outlined,
          text: AppConstants.email,
          onTap: () => UrlLauncherUtils.openEmail(),
        ),
        const SizedBox(height: 12),
        _ContactInfoRow(
          icon: Icons.location_on_outlined,
          text: AppConstants.location,
        ),
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String label;
  final String route;

  const _FooterLink({required this.label, required this.route});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Get.toNamed(widget.route),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            widget.label,
            style: AppTextStyles.bodyMedium(
              color: _isHovered ? AppColors.gold : AppColors.cream.withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const _ContactInfoRow({
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(icon, size: 18, color: AppColors.gold),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.bodyMedium(
                color: AppColors.cream.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialIconButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SocialIconButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.gold : AppColors.softCharcoal,
            shape: BoxShape.circle,
            border: Border.all(
              color: _isHovered ? AppColors.lightGold : AppColors.champagne.withOpacity(0.3),
            ),
          ),
          child: Icon(
            widget.icon,
            size: 18,
            color: _isHovered ? AppColors.charcoal : AppColors.gold,
          ),
        ),
      ),
    );
  }
}
