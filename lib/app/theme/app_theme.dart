import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.warmIvory,
      primaryColor: AppColors.gold,
      colorScheme: const ColorScheme.light(
        primary: AppColors.gold,
        secondary: AppColors.champagne,
        surface: AppColors.warmIvory,
        onPrimary: AppColors.charcoal,
        onSecondary: AppColors.charcoal,
        onSurface: AppColors.charcoal,
      ),
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
      dividerTheme: const DividerThemeData(
        color: AppColors.borderLight,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
