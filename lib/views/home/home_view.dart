import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/routes/app_routes.dart';
import '../../app/theme/app_colors.dart';
import '../../controllers/home_controller.dart';
import '../../utils/responsive_utils.dart';
import '../../widgets/common/floating_whatsapp_button.dart';
import '../../widgets/common/scroll_to_top_button.dart';
import '../../widgets/footer/app_footer.dart';
import '../../widgets/home/about_preview.dart';
import '../../widgets/home/event_management_section.dart';
import '../../widgets/home/featured_events.dart';
import '../../widgets/home/final_cta.dart';
import '../../widgets/home/food_showcase.dart';
import '../../widgets/home/hero_section.dart';
import '../../widgets/home/services_section.dart';
import '../../widgets/home/testimonials_section.dart';
import '../../widgets/home/trust_strip.dart';
import '../../widgets/home/wedding_section.dart';
import '../../widgets/home/why_choose_section.dart';
import '../../widgets/navigation/desktop_navbar.dart';
import '../../widgets/navigation/mobile_menu.dart';
import '../../widgets/navigation/mobile_navbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final isDesktop = ResponsiveUtils.isDesktop(context);

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
                    // HERO SECTION
                    Container(
                      key: controller.heroKey,
                      child: HeroSection(
                        onPlanEvent: () => Get.toNamed(AppRoutes.contact),
                        onExploreServices: () =>
                            controller.scrollToSection(controller.servicesKey),
                      ),
                    ),

                    // TRUST STRIP
                    const TrustStrip(),

                    // ABOUT PREVIEW SECTION
                    Container(
                      key: controller.aboutKey,
                      child: AboutPreviewSection(
                        onDiscoverMore: () => Get.toNamed(AppRoutes.about),
                      ),
                    ),

                    // CATERING SERVICES SECTION
                    Container(
                      key: controller.servicesKey,
                      child: ServicesSection(
                        onServiceSelect: (serviceId) =>
                            Get.toNamed(AppRoutes.catering),
                      ),
                    ),

                    // FOOD SHOWCASE SECTION
                    Container(
                      key: controller.foodShowcaseKey,
                      child: FoodShowcaseSection(
                        onExploreMenu: () => Get.toNamed(AppRoutes.menu),
                      ),
                    ),

                    // WEDDING EXPERIENCE SECTION
                    Container(
                      key: controller.weddingKey,
                      child: WeddingSection(
                        onPlanWedding: () => Get.toNamed(AppRoutes.contact),
                      ),
                    ),

                    // EVENT MANAGEMENT SECTION
                    Container(
                      key: controller.eventMgmtKey,
                      child: EventManagementSection(
                        onExploreEvents: () => Get.toNamed(AppRoutes.events),
                      ),
                    ),

                    // WHY CHOOSE MK SECTION
                    Container(
                      key: controller.whyChooseKey,
                      child: const WhyChooseSection(),
                    ),

                    // FEATURED EVENTS SECTION
                    Container(
                      key: controller.eventsKey,
                      child: FeaturedEventsSection(
                        onViewAllEvents: () => Get.toNamed(AppRoutes.events),
                        onSelectEvent: (eventId) => Get.toNamed(AppRoutes.events),
                      ),
                    ),

                    // TESTIMONIALS SECTION
                    Container(
                      key: controller.testimonialsKey,
                      child: const TestimonialsSection(),
                    ),

                    // FINAL CTA SECTION
                    Container(
                      key: controller.ctaKey,
                      child: FinalCtaSection(
                        onGetQuote: () => Get.toNamed(AppRoutes.contact),
                      ),
                    ),

                    // APP FOOTER
                    const AppFooter(),
                  ],
                ),
              ),
            ),

            // STICKY NAVBAR (DESKTOP OR MOBILE)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: isDesktop
                  ? DesktopNavbar(
                      isScrolled: controller.isNavbarScrolled.value,
                      currentRoute: AppRoutes.home,
                      onNavClick: (path) => _handleNavScroll(controller, path),
                    )
                  : MobileNavbar(
                      isScrolled: controller.isNavbarScrolled.value,
                      currentRoute: AppRoutes.home,
                      onMenuToggle: controller.toggleMobileMenu,
                    ),
            ),

            // MOBILE MENU DRAWER OVERLAY
            MobileMenu(
              isOpen: controller.isMobileMenuOpen.value,
              currentRoute: AppRoutes.home,
              onClose: controller.closeMobileMenu,
              onNavClick: (path) => _handleNavScroll(controller, path),
            ),

            // FLOATING BUTTONS (BOTTOM RIGHT)
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

  void _handleNavScroll(HomeController controller, String path) {
    if (path == AppRoutes.home) {
      controller.scrollToTop();
    } else {
      Get.toNamed(path);
    }
  }
}
