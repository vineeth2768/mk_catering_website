import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/constants/asset_constants.dart';
import '../../app/routes/app_routes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_text_styles.dart';
import '../../controllers/events_controller.dart';
import '../../controllers/home_controller.dart';
import '../../models/event_model.dart';
import '../../utils/responsive_utils.dart';
import '../../widgets/common/floating_whatsapp_button.dart';
import '../../widgets/common/gold_divider.dart';
import '../../widgets/common/image_container.dart';
import '../../widgets/common/primary_button.dart';
import '../../widgets/common/scroll_to_top_button.dart';
import '../../widgets/events/event_category_card.dart';
import '../../widgets/footer/app_footer.dart';
import '../../widgets/gallery/gallery_filter.dart';
import '../../widgets/home/final_cta.dart';
import '../../widgets/navigation/desktop_navbar.dart';
import '../../widgets/navigation/mobile_menu.dart';
import '../../widgets/navigation/mobile_navbar.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final eventsController = Get.put(EventsController());
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
                          imageUrl: AppImages.eventsHero,
                          fit: BoxFit.cover,
                          overlayColor: AppColors.charcoal,
                          overlayOpacity: 0.7,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'PORTFOLIO & EVENT MANAGEMENT',
                                  style: AppTextStyles.eyebrow(color: AppColors.champagne),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Celebrations, Beautifully Executed.',
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

                  // FILTER & EVENTS GRID
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
                            // Category Filter Bar
                            GalleryFilter(
                              categories: eventsController.categories,
                              selectedCategory: eventsController.selectedCategory.value,
                              onCategorySelected: eventsController.setCategory,
                            ),
                            const SizedBox(height: 48),

                            // Events Grid
                            LayoutBuilder(
                              builder: (context, constraints) {
                                int crossCount = isMobile ? 1 : 2;
                                final cardWidth = (constraints.maxWidth -
                                        (crossCount - 1) * 24) /
                                    crossCount;

                                return Wrap(
                                  spacing: 24,
                                  runSpacing: 32,
                                  children: eventsController.filteredEvents.map((event) {
                                    return SizedBox(
                                      width: cardWidth,
                                      child: EventCategoryCard(
                                        event: event,
                                        onTap: () => eventsController.openEventModal(event),
                                      ),
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                          ],
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
                      currentRoute: AppRoutes.events,
                    )
                  : MobileNavbar(
                      isScrolled: homeController.isNavbarScrolled.value,
                      currentRoute: AppRoutes.events,
                      onMenuToggle: homeController.toggleMobileMenu,
                    ),
            ),

            MobileMenu(
              isOpen: homeController.isMobileMenuOpen.value,
              currentRoute: AppRoutes.events,
              onClose: homeController.closeMobileMenu,
            ),

            // EVENT DETAIL MODAL
            if (eventsController.selectedEventModal.value != null)
              _buildEventDetailModal(
                eventsController.selectedEventModal.value!,
                eventsController.closeEventModal,
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

  Widget _buildEventDetailModal(EventModel event, VoidCallback onClose) {
    return Material(
      color: Colors.black.withOpacity(0.8),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 650),
          margin: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.gold, width: 1.5),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ImageContainer(
                    imageUrl: event.image,
                    height: 260,
                    width: double.infinity,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: IconButton(
                      onPressed: onClose,
                      icon: const Icon(
                        Icons.close_rounded,
                        color: AppColors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.category,
                          style: AppTextStyles.eyebrow(color: AppColors.deepGold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          event.title,
                          style: AppTextStyles.h2(),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${event.location} • ${event.guestCount}',
                          style: AppTextStyles.bodyMedium(color: AppColors.textMuted),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          event.description,
                          style: AppTextStyles.bodyLarge(),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'EVENT HIGHLIGHTS',
                          style: AppTextStyles.button(color: AppColors.charcoal),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          children: event.highlights.map((h) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    color: AppColors.gold,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(h, style: AppTextStyles.bodyMedium()),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 24),
                        PrimaryButton(
                          text: 'PLAN SIMILAR EVENT',
                          fullWidth: true,
                          onPressed: () {
                            onClose();
                            Get.toNamed(AppRoutes.contact);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
