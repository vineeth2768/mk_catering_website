import 'package:flutter/material.dart';

class ScrollUtils {
  ScrollUtils._();

  static void scrollToKey(GlobalKey key, {Duration duration = const Duration(milliseconds: 600)}) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: duration,
        curve: Curves.easeInOutCubic,
        alignment: 0.0,
      );
    }
  }

  static void scrollToTop(ScrollController controller, {Duration duration = const Duration(milliseconds: 600)}) {
    if (controller.hasClients) {
      controller.animateTo(
        0,
        duration: duration,
        curve: Curves.easeInOutCubic,
      );
    }
  }
}
