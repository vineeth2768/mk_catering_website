import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/constants/asset_constants.dart';
import '../../app/routes/app_routes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_text_styles.dart';
import '../../controllers/home_controller.dart';
import '../../data/services_data.dart';
import '../../utils/responsive_utils.dart';
import '../../widgets/catering/catering_category_card.dart';
import '../../widgets/common/floating_whatsapp_button.dart';
import '../../widgets/common/gold_divider.dart';
import '../../widgets/common/image_container.dart';
import '../../widgets/common/scroll_to_top_button.dart';
import '../../widgets/footer/app_footer.dart';
import '../../widgets/home/final_cta.dart';
import '../../widgets/navigation/desktop_navbar.dart';
import '../../widgets/navigation/mobile_menu.dart';
import '../../widgets/navigation/mobile_navbar.dart';

class CateringView extends StatelessWidget {
  const CateringView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
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
                  // HERO BANNER
                  Container(
                    height: 380,
                    width: double.infinity,
                    color: AppColors.charcoal,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        const ImageContainer(
                          imageUrl: AppImages.cateringHero,
                          fit: BoxFit.cover,
                          overlayColor: AppColors.charcoal,
                          overlayOpacity: 0.7,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 80,
                              left: 24,
                              right: 24,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'CATERING SERVICES',
                                  style: AppTextStyles.eyebrow(
                                    color: AppColors.champagne,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Food That Makes Every Occasion Special.',
                                  textAlign: TextAlign.center,
                                  style: isMobile
                                      ? AppTextStyles.h1Mobile(
                                          color: AppColors.white,
                                        )
                                      : AppTextStyles.h1(
                                          color: AppColors.white,
                                        ),
                                ),
                                const SizedBox(height: 16),
                                const GoldDivider(
                                  width: 60,
                                  alignment: Alignment.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // SERVICES ALTERNATING LIST
                  Container(
                    color: AppColors.warmIvory,
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveUtils.contentHorizontalPadding(
                        context,
                      ),
                      vertical: isMobile
                          ? AppSpacing.sectionSm
                          : AppSpacing.sectionMd,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: AppSpacing.maxContentWidth,
                        ),
                        child: Column(
                          children: servicesData.asMap().entries.map((entry) {
                            final index = entry.key;
                            final service = entry.value;

                            return CateringCategoryCard(
                              service: service,
                              isReversed: index % 2 != 0,
                              onInquire: () => Get.toNamed(AppRoutes.contact),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),

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

            // STICKY NAVBAR
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: isDesktop
                  ? DesktopNavbar(
                      isScrolled: homeController.isNavbarScrolled.value,
                      currentRoute: AppRoutes.catering,
                    )
                  : MobileNavbar(
                      isScrolled: homeController.isNavbarScrolled.value,
                      currentRoute: AppRoutes.catering,
                      onMenuToggle: homeController.toggleMobileMenu,
                    ),
            ),

            MobileMenu(
              isOpen: homeController.isMobileMenuOpen.value,
              currentRoute: AppRoutes.catering,
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
