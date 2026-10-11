import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/constants/asset_constants.dart';
import '../../app/routes/app_routes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_text_styles.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/menu_controller.dart';
import '../../utils/responsive_utils.dart';
import '../../widgets/common/floating_whatsapp_button.dart';
import '../../widgets/common/gold_divider.dart';
import '../../widgets/common/image_container.dart';
import '../../widgets/common/primary_button.dart';
import '../../widgets/common/scroll_to_top_button.dart';
import '../../widgets/footer/app_footer.dart';
import '../../widgets/home/final_cta.dart';
import '../../widgets/menu/menu_category_tab.dart';
import '../../widgets/menu/menu_item_card.dart';
import '../../widgets/navigation/desktop_navbar.dart';
import '../../widgets/navigation/mobile_menu.dart';
import '../../widgets/navigation/mobile_navbar.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final menuController = Get.put(MenuPageController());
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
                          imageUrl: AppImages.sadya,
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
                                  'THE MK CULINARY COLLECTION',
                                  style: AppTextStyles.eyebrow(color: AppColors.champagne),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'A Menu for Every Celebration.',
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

                  // MENU TABS & ITEMS GRID
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
                            // Category Tabs
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: menuController.categories.map((cat) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 6),
                                    child: MenuCategoryTab(
                                      label: cat,
                                      isSelected: cat.toUpperCase() ==
                                          menuController.selectedCategory.value.toUpperCase(),
                                      onTap: () => menuController.selectCategory(cat),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 48),

                            // Items Grid
                            LayoutBuilder(
                              builder: (context, constraints) {
                                int crossCount = isMobile ? 1 : (constraints.maxWidth > 1000 ? 3 : 2);
                                final cardWidth = (constraints.maxWidth -
                                        (crossCount - 1) * 24) /
                                    crossCount;

                                return Wrap(
                                  spacing: 24,
                                  runSpacing: 28,
                                  children: menuController.filteredMenuItems.map((item) {
                                    return SizedBox(
                                      width: cardWidth,
                                      child: MenuItemCard(item: item),
                                    );
                                  }).toList(),
                                );
                              },
                            ),

                            const SizedBox(height: 56),

                            // Custom Menu Request CTA Box
                            Container(
                              padding: const EdgeInsets.all(36),
                              decoration: BoxDecoration(
                                color: AppColors.charcoal,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppColors.gold),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'HAVE A CUSTOM MENU IN MIND?',
                                    style: AppTextStyles.eyebrow(color: AppColors.gold),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'We customize menus for dietary preferences, regional traditions, and unique party themes.',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.h3(color: AppColors.white),
                                  ),
                                  const SizedBox(height: 24),
                                  PrimaryButton(
                                    text: 'REQUEST A CUSTOM MENU',
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
                      currentRoute: AppRoutes.menu,
                    )
                  : MobileNavbar(
                      isScrolled: homeController.isNavbarScrolled.value,
                      currentRoute: AppRoutes.menu,
                      onMenuToggle: homeController.toggleMobileMenu,
                    ),
            ),

            MobileMenu(
              isOpen: homeController.isMobileMenuOpen.value,
              currentRoute: AppRoutes.menu,
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
