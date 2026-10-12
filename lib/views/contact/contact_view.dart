import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/constants/app_constants.dart';
import '../../app/constants/asset_constants.dart';
import '../../app/routes/app_routes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_text_styles.dart';
import '../../controllers/contact_controller.dart';
import '../../controllers/home_controller.dart';
import '../../utils/responsive_utils.dart';
import '../../utils/url_launcher_utils.dart';
import '../../widgets/common/floating_whatsapp_button.dart';
import '../../widgets/common/gold_divider.dart';
import '../../widgets/common/image_container.dart';
import '../../widgets/common/primary_button.dart';
import '../../widgets/common/scroll_to_top_button.dart';
import '../../widgets/footer/app_footer.dart';
import '../../widgets/navigation/desktop_navbar.dart';
import '../../widgets/navigation/mobile_menu.dart';
import '../../widgets/navigation/mobile_navbar.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final contactController = Get.put(ContactController());
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: Obx(
        () => Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification.metrics.axis == Axis.vertical) {
                  homeController.updateScrollOffset(scrollNotification.metrics.pixels);
                }
                return false;
              },
              child: SingleChildScrollView(
                controller: homeController.scrollController,
                child: Column(
                children: [
                  // PAGE HERO
                  Container(
                    height: 380,
                    width: double.infinity,
                    color: AppColors.charcoal,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        const ImageContainer(
                          imageUrl: AppImages.contactHero,
                          fit: BoxFit.cover,
                          overlayColor: AppColors.charcoal,
                          overlayOpacity: 0.75,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'GET IN TOUCH',
                                  style: AppTextStyles.eyebrow(color: AppColors.champagne),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  "Let's Plan Something Special.",
                                  textAlign: TextAlign.center,
                                  style: isMobile
                                      ? AppTextStyles.h1Mobile(color: AppColors.white)
                                      : AppTextStyles.h1(color: AppColors.white),
                                ),
                                const SizedBox(height: 16),
                                const GoldDivider(width: 60, alignment: Alignment.center),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // MAIN CONTENT SECTION
                  Container(
                    color: AppColors.warmIvory,
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveUtils.contentHorizontalPadding(context),
                      vertical: isMobile ? AppSpacing.sectionSm : AppSpacing.sectionMd,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
                        child: Builder(
                          builder: (context) {
                            final leftColumn = Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CONTACT INFORMATION',
                                  style: AppTextStyles.eyebrow(color: AppColors.deepGold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'We Would Love to Hear From You.',
                                  style: isMobile ? AppTextStyles.h2() : AppTextStyles.h1(),
                                ),
                                const SizedBox(height: 12),
                                const GoldDivider(width: 60, showDiamond: true),
                                const SizedBox(height: 20),
                                Text(
                                  'Planning a wedding, corporate conference, or private celebration? Reach out directly or fill out our enquiry form to schedule a tasting session.',
                                  style: AppTextStyles.bodyLarge(),
                                ),
                                const SizedBox(height: 36),

                                _ContactCard(
                                  icon: Icons.phone_in_talk_rounded,
                                  title: 'PHONE / WHATSAPP',
                                  content: AppConstants.phone,
                                  subtitle: 'Mon - Sun: 8:00 AM - 10:00 PM',
                                  onTap: () => UrlLauncherUtils.openPhone(),
                                ),
                                const SizedBox(height: 16),
                                _ContactCard(
                                  icon: Icons.mark_email_read_rounded,
                                  title: 'EMAIL INQUIRIES',
                                  content: AppConstants.email,
                                  subtitle: 'We reply within 24 hours',
                                  onTap: () => UrlLauncherUtils.openEmail(),
                                ),
                                const SizedBox(height: 16),
                                _ContactCard(
                                  icon: Icons.location_on_rounded,
                                  title: 'OFFICE & KITCHEN LOCATION',
                                  content: AppConstants.location,
                                  subtitle: 'Serving all across Kerala & neighbouring states',
                                ),
                              ],
                            );

                            final rightColumn = Container(
                              padding: EdgeInsets.all(isMobile ? 24 : 40),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: AppColors.borderLight),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.04),
                                      blurRadius: 20,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Form(
                                  key: contactController.formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'EVENT ENQUIRY FORM',
                                        style: AppTextStyles.eyebrow(color: AppColors.deepGold),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Request a Custom Quote',
                                        style: AppTextStyles.h2(),
                                      ),
                                      const SizedBox(height: 24),

                                      // Success Notification Banner
                                      if (contactController.isSuccess.value)
                                        Container(
                                          margin: const EdgeInsets.only(bottom: 24),
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: AppColors.paleGold,
                                            borderRadius: BorderRadius.circular(6),
                                            border: Border.all(color: AppColors.gold),
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.check_circle_rounded,
                                                color: AppColors.deepGold,
                                                size: 24,
                                              ),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: Text(
                                                  'Thank you! Your enquiry has been submitted. Our event team will contact you shortly.',
                                                  style: AppTextStyles.bodyMedium(
                                                    color: AppColors.charcoal,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                      // Form Fields
                                      _CustomTextField(
                                        label: 'Full Name *',
                                        controller: contactController.nameController,
                                        validator: contactController.validateName,
                                        icon: Icons.person_outline_rounded,
                                      ),
                                      const SizedBox(height: 16),

                                      Row(
                                        children: [
                                          Expanded(
                                            child: _CustomTextField(
                                              label: 'Phone Number *',
                                              controller: contactController.phoneController,
                                              validator: contactController.validatePhone,
                                              icon: Icons.phone_outlined,
                                              keyboardType: TextInputType.phone,
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: _CustomTextField(
                                              label: 'Email Address *',
                                              controller: contactController.emailController,
                                              validator: contactController.validateEmail,
                                              icon: Icons.email_outlined,
                                              keyboardType: TextInputType.emailAddress,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),

                                      // Event Type Dropdown
                                      Text(
                                        'Event Type *',
                                        style: AppTextStyles.button(color: AppColors.charcoal),
                                      ),
                                      const SizedBox(height: 6),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        decoration: BoxDecoration(
                                          color: AppColors.warmIvory,
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(color: AppColors.borderLight),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            value: contactController.selectedEventType.value,
                                            isExpanded: true,
                                            dropdownColor: AppColors.warmIvory,
                                            items: contactController.eventTypes.map((type) {
                                              return DropdownMenuItem(
                                                value: type,
                                                child: Text(
                                                  type,
                                                  style: AppTextStyles.bodyMedium(
                                                    color: AppColors.charcoal,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: contactController.setEventType,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),

                                      Row(
                                        children: [
                                          Expanded(
                                            child: _CustomTextField(
                                              label: 'Event Date',
                                              controller: contactController.dateController,
                                              icon: Icons.calendar_today_rounded,
                                              hintText: 'DD/MM/YYYY',
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: _CustomTextField(
                                              label: 'Number of Guests *',
                                              controller: contactController.guestCountController,
                                              validator: contactController.validateGuestCount,
                                              icon: Icons.people_outline_rounded,
                                              keyboardType: TextInputType.number,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),

                                      _CustomTextField(
                                        label: 'Event Location / Venue',
                                        controller: contactController.locationController,
                                        icon: Icons.location_on_outlined,
                                      ),
                                      const SizedBox(height: 16),

                                      _CustomTextField(
                                        label: 'Additional Message / Dietary Notes',
                                        controller: contactController.messageController,
                                        icon: Icons.notes_rounded,
                                        maxLines: 4,
                                      ),
                                      const SizedBox(height: 28),

                                      PrimaryButton(
                                        text: contactController.isLoading.value
                                            ? 'SUBMITTING...'
                                            : 'REQUEST A QUOTE',
                                        fullWidth: true,
                                        height: 54,
                                        onPressed: contactController.isLoading.value
                                            ? () {}
                                            : contactController.submitEnquiry,
                                      ),
                                    ],
                                  ),
                                ),
                              );

                              if (isMobile) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    leftColumn,
                                    const SizedBox(height: 48),
                                    rightColumn,
                                  ],
                                );
                              }

                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(flex: 5, child: leftColumn),
                                  const SizedBox(width: 64),
                                  Expanded(flex: 7, child: rightColumn),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                  // FOOTER
                  const AppFooter(),
                ],
              ),
            ),
          ),

            // STICKY NAVBAR
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: isDesktop
                  ? DesktopNavbar(
                      isScrolled: homeController.isNavbarScrolled.value,
                      currentRoute: AppRoutes.contact,
                    )
                  : MobileNavbar(
                      isScrolled: homeController.isNavbarScrolled.value,
                      currentRoute: AppRoutes.contact,
                      onMenuToggle: homeController.toggleMobileMenu,
                    ),
            ),

            MobileMenu(
              isOpen: homeController.isMobileMenuOpen.value,
              currentRoute: AppRoutes.contact,
              onClose: homeController.closeMobileMenu,
            ),

            Positioned(
              bottom: 24,
              right: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ScrollToTopButton(
                    visible: homeController.isNavbarScrolled.value,
                    onTap: homeController.scrollToTop,
                  ),
                  const SizedBox(height: 12),
                  const FloatingWhatsappButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final String subtitle;
  final VoidCallback? onTap;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.content,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                color: AppColors.charcoal,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.gold, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.eyebrow(color: AppColors.deepGold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: AppTextStyles.h3(color: AppColors.charcoal),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodySmall(color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData icon;
  final String? hintText;
  final int maxLines;
  final TextInputType keyboardType;

  const _CustomTextField({
    required this.label,
    required this.controller,
    this.validator,
    required this.icon,
    this.hintText,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.button(color: AppColors.charcoal),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: AppTextStyles.bodyMedium(color: AppColors.charcoal),
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon, color: AppColors.deepGold, size: 20),
            filled: true,
            fillColor: AppColors.warmIvory,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: AppColors.borderLight),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: AppColors.borderLight),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: AppColors.gold, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
          ),
        ),
      ],
    );
  }
}
