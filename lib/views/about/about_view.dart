import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/constants/asset_constants.dart';
import '../../app/routes/app_routes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_text_styles.dart';
import '../../controllers/home_controller.dart';
import '../../utils/responsive_utils.dart';
import '../../widgets/common/animated_reveal.dart';
import '../../widgets/common/floating_whatsapp_button.dart';
import '../../widgets/common/gold_divider.dart';
import '../../widgets/common/image_container.dart';
import '../../widgets/common/primary_button.dart';
import '../../widgets/common/scroll_to_top_button.dart';
import '../../widgets/footer/app_footer.dart';
import '../../widgets/home/final_cta.dart';
import '../../widgets/home/why_choose_section.dart';
import '../../widgets/navigation/desktop_navbar.dart';
import '../../widgets/navigation/mobile_menu.dart';
import '../../widgets/navigation/mobile_navbar.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
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
                  controller.updateScrollOffset(scrollNotification.metrics.pixels);
                }
                return false;
              },
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                children: [
                  // PAGE HERO
                  Container(
                    height: 420,
                    width: double.infinity,
                    color: AppColors.charcoal,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        const ImageContainer(
                          imageUrl: AppImages.chefHospitality,
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
                                  'ABOUT MK CATERING',
                                  style: AppTextStyles.eyebrow(color: AppColors.champagne),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  '35 YEARS OF TRADITION.\nA LEGACY OF TASTE. A TOUCH OF LUXURY.',
                                  textAlign: TextAlign.center,
                                  style: isMobile
                                      ? AppTextStyles.h1Mobile(color: AppColors.white)
                                      : AppTextStyles.h1(color: AppColors.white),
                                ),
                                const SizedBox(height: 16),
                                const GoldDivider(width: 80, alignment: Alignment.center, showDiamond: true),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // OUR STORY & LEGACY MAIN SECTION
                  Container(
                    color: AppColors.warmIvory,
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveUtils.contentHorizontalPadding(context),
                      vertical: isMobile ? AppSpacing.sectionSm : AppSpacing.sectionMd,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
                        child: Column(
                          children: [
                            Flex(
                              direction: isMobile ? Axis.vertical : Axis.horizontal,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Story Text Narrative
                                Expanded(
                                  flex: isMobile ? 0 : 7,
                                  child: AnimatedReveal(
                                    direction: RevealDirection.slideRight,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'OUR HERITAGE',
                                          style: AppTextStyles.eyebrow(color: AppColors.deepGold),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          '35 YEARS OF HERITAGE.\nA LEGACY OF TASTE.',
                                          style: isMobile ? AppTextStyles.h1Mobile() : AppTextStyles.h1(),
                                        ),
                                        const SizedBox(height: 12),
                                        const GoldDivider(width: 60, showDiamond: true),
                                        const SizedBox(height: 24),

                                        Text(
                                          'For over 35 years, MK Catering has been built on a timeless tradition of authentic flavours, heartfelt hospitality, and a passion for exceptional food. What began with our grandfather’s vision, dedication, and love for traditional cooking has grown into a legacy that continues to bring people together through unforgettable dining experiences.',
                                          style: AppTextStyles.bodyLarge(color: AppColors.charcoal),
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          'Inspired by his values and the rich culinary traditions he passed down, we believe that catering is more than preparing food — it is about creating memories, celebrating togetherness, and honouring every occasion with care and elegance.',
                                          style: AppTextStyles.bodyMedium(),
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          'Today, MK Catering proudly blends the warmth of traditional recipes with the sophistication of modern luxury. From intimate family celebrations to grand weddings and prestigious events, we bring together authentic taste, premium presentation, meticulous attention to detail, and gracious service.',
                                          style: AppTextStyles.bodyMedium(),
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          'While our style evolves with time, our foundation remains unchanged: the principles our grandfather taught us — quality, trust, dedication, and hospitality from the heart.',
                                          style: AppTextStyles.bodyMedium(color: AppColors.charcoal),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                if (isMobile) const SizedBox(height: 40) else const SizedBox(width: 64),

                                // Image Frame & Legacy Badge
                                Expanded(
                                  flex: isMobile ? 0 : 5,
                                  child: AnimatedReveal(
                                    direction: RevealDirection.slideLeft,
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            ImageContainer(
                                              imageUrl: AppImages.diningSetup,
                                              height: 440,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            Positioned(
                                              bottom: 20,
                                              left: 20,
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 16, vertical: 10),
                                                decoration: BoxDecoration(
                                                  color: AppColors.charcoal,
                                                  borderRadius: BorderRadius.circular(6),
                                                  border: Border.all(color: AppColors.gold),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      '35+',
                                                      style: AppTextStyles.goldNumber(),
                                                    ),
                                                    const SizedBox(width: 12),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'YEARS OF LEGACY',
                                                          style: AppTextStyles.eyebrow(
                                                            color: AppColors.gold,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Three Generations of Passion',
                                                          style: AppTextStyles.bodySmall(
                                                            color: AppColors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 64),

                            // HIGHLIGHT BANNER
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
                              decoration: BoxDecoration(
                                color: AppColors.charcoal,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppColors.gold),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 20,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'OUR ESSENCE',
                                    style: AppTextStyles.eyebrow(color: AppColors.champagne),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Three and a half decades of heritage. Generations of passion. A timeless taste of luxury.',
                                    textAlign: TextAlign.center,
                                    style: isMobile
                                        ? AppTextStyles.h2(color: AppColors.gold)
                                        : AppTextStyles.h1(color: AppColors.gold),
                                  ),
                                  const SizedBox(height: 20),
                                  const GoldDivider(width: 60, alignment: Alignment.center),
                                  const SizedBox(height: 20),
                                  Text(
                                    'At MK Catering, we don\'t just serve food. We carry forward a legacy.',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.bodyLarge(
                                      color: AppColors.cream.withOpacity(0.9),
                                    ),
                                  ),
                                  const SizedBox(height: 28),
                                  PrimaryButton(
                                    text: 'PLAN YOUR EVENT WITH US',
                                    onPressed: () => Get.toNamed(AppRoutes.contact),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // WHY CHOOSE MK SECTION
                  const WhyChooseSection(),

                  // FINAL CTA
                  FinalCtaSection(
                    onGetQuote: () => Get.toNamed(AppRoutes.contact),
                  ),

                  // FOOTER
                  const AppFooter(),
                ],
              ),
            ),
          ),

            // NAVBAR
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: isDesktop
                  ? DesktopNavbar(
                      isScrolled: controller.isNavbarScrolled.value,
                      currentRoute: AppRoutes.about,
                    )
                  : MobileNavbar(
                      isScrolled: controller.isNavbarScrolled.value,
                      currentRoute: AppRoutes.about,
                      onMenuToggle: controller.toggleMobileMenu,
                    ),
            ),

            MobileMenu(
              isOpen: controller.isMobileMenuOpen.value,
              currentRoute: AppRoutes.about,
              onClose: controller.closeMobileMenu,
            ),

            Positioned(
              bottom: 24,
              right: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ScrollToTopButton(
                    visible: controller.isNavbarScrolled.value,
                    onTap: controller.scrollToTop,
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
