import 'package:flutter/material.dart';
import '../app/constants/app_constants.dart';

class ResponsiveUtils {
  ResponsiveUtils._();

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AppConstants.mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppConstants.mobileBreakpoint &&
      MediaQuery.of(context).size.width < AppConstants.tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppConstants.tabletBreakpoint;

  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppConstants.desktopBreakpoint;

  static double contentHorizontalPadding(BuildContext context) {
    if (isMobile(context)) return 20.0;
    if (isTablet(context)) return 40.0;
    return 64.0;
  }
}
