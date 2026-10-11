import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/scroll_utils.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();

  final RxDouble scrollOffset = 0.0.obs;
  final RxBool isNavbarScrolled = false.obs;
  final RxBool isMobileMenuOpen = false.obs;

  // Section Keys for smooth scrolling on Home Page
  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey foodShowcaseKey = GlobalKey();
  final GlobalKey weddingKey = GlobalKey();
  final GlobalKey eventMgmtKey = GlobalKey();
  final GlobalKey whyChooseKey = GlobalKey();
  final GlobalKey eventsKey = GlobalKey();
  final GlobalKey testimonialsKey = GlobalKey();
  final GlobalKey ctaKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.hasClients) {
      try {
        final double offset = scrollController.positions.last.pixels;
        scrollOffset.value = offset;
        isNavbarScrolled.value = offset > 50;
      } catch (_) {}
    }
  }

  void updateScrollOffset(double offset) {
    scrollOffset.value = offset;
    isNavbarScrolled.value = offset > 50;
  }

  void toggleMobileMenu() {
    isMobileMenuOpen.value = !isMobileMenuOpen.value;
  }

  void closeMobileMenu() {
    isMobileMenuOpen.value = false;
  }

  void scrollToSection(GlobalKey key) {
    closeMobileMenu();
    ScrollUtils.scrollToKey(key);
  }

  void scrollToTop() {
    closeMobileMenu();
    ScrollUtils.scrollToTop(scrollController);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
