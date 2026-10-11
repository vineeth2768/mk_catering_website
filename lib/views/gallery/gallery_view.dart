import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/constants/asset_constants.dart';
import '../../app/routes/app_routes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_text_styles.dart';
import '../../controllers/gallery_controller.dart';
import '../../controllers/home_controller.dart';
import '../../utils/responsive_utils.dart';
import '../../widgets/common/floating_whatsapp_button.dart';
import '../../widgets/common/gold_divider.dart';
import '../../widgets/common/image_container.dart';
import '../../widgets/common/scroll_to_top_button.dart';
import '../../widgets/footer/app_footer.dart';
import '../../widgets/gallery/gallery_filter.dart';
import '../../widgets/gallery/gallery_grid.dart';
import '../../widgets/gallery/gallery_lightbox.dart';
import '../../widgets/home/final_cta.dart';
import '../../widgets/navigation/desktop_navbar.dart';
import '../../widgets/navigation/mobile_menu.dart';
import '../../widgets/navigation/mobile_navbar.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final galleryController = Get.put(GalleryController());
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
                          imageUrl: AppImages.eventDecor,
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
                                  'VISUAL GALLERY',
                                  style: AppTextStyles.eyebrow(color: AppColors.champagne),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Moments Crafted to Perfection.',
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

                  // GALLERY CONTENT
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
                            // Gallery Filter Bar
                            GalleryFilter(
                              categories: galleryController.categories,
                              selectedCategory: galleryController.selectedCategory.value,
                              onCategorySelected: galleryController.selectCategory,
                            ),
                            const SizedBox(height: 48),

                            // Interactive Gallery Grid
                            GalleryGrid(
                              items: galleryController.filteredItems,
                              onItemTap: galleryController.openLightbox,
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
                      currentRoute: AppRoutes.gallery,
                    )
                  : MobileNavbar(
                      isScrolled: homeController.isNavbarScrolled.value,
                      currentRoute: AppRoutes.gallery,
                      onMenuToggle: homeController.toggleMobileMenu,
                    ),
            ),

            MobileMenu(
              isOpen: homeController.isMobileMenuOpen.value,
              currentRoute: AppRoutes.gallery,
              onClose: homeController.closeMobileMenu,
            ),

            // LIGHTBOX OVERLAY
            GalleryLightbox(
              isOpen: galleryController.isLightboxOpen.value,
              item: galleryController.currentLightboxItem,
              currentIndex: galleryController.activeIndex.value,
              totalItems: galleryController.filteredItems.length,
              onClose: galleryController.closeLightbox,
              onNext: galleryController.nextImage,
              onPrevious: galleryController.previousImage,
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
