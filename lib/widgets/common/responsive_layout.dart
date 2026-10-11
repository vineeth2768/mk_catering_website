import 'package:flutter/material.dart';
import '../../utils/responsive_utils.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    if (ResponsiveUtils.isDesktop(context)) {
      return desktop;
    } else if (ResponsiveUtils.isTablet(context)) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }
}
