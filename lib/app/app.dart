import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/app_constants.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

class MkCateringApp extends StatelessWidget {
  const MkCateringApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
    );
  }
}
