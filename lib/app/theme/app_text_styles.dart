import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle displayHero({Color color = AppColors.charcoal}) {
    return GoogleFonts.cinzel(
      fontSize: 52,
      fontWeight: FontWeight.w700,
      height: 1.2,
      letterSpacing: 1.2,
      color: color,
    );
  }

  static TextStyle displayHeroMobile({Color color = AppColors.charcoal}) {
    return GoogleFonts.cinzel(
      fontSize: 25,
      fontWeight: FontWeight.w700,
      height: 1.22,
      letterSpacing: 0.6,
      color: color,
    );
  }

  static TextStyle h1({Color color = AppColors.charcoal}) {
    return GoogleFonts.cinzel(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      height: 1.2,
      letterSpacing: 0.8,
      color: color,
    );
  }

  static TextStyle h1Mobile({Color color = AppColors.charcoal}) {
    return GoogleFonts.cinzel(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      height: 1.25,
      letterSpacing: 0.5,
      color: color,
    );
  }

  static TextStyle h2({Color color = AppColors.charcoal}) {
    return GoogleFonts.cinzel(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      height: 1.3,
      letterSpacing: 0.6,
      color: color,
    );
  }

  static TextStyle h3({Color color = AppColors.charcoal}) {
    return GoogleFonts.cinzel(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      height: 1.35,
      letterSpacing: 0.5,
      color: color,
    );
  }

  static TextStyle eyebrow({Color color = AppColors.deepGold}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      letterSpacing: 2.5,
      color: color,
    );
  }

  static TextStyle bodyLarge({Color color = AppColors.textMuted}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      height: 1.6,
      color: color,
    );
  }

  static TextStyle bodyMedium({Color color = AppColors.textMuted}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.6,
      color: color,
    );
  }

  static TextStyle bodySmall({Color color = AppColors.textMuted}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle button({Color color = AppColors.charcoal}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 13,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.5,
      color: color,
    );
  }

  static TextStyle navLink({Color color = AppColors.charcoal, bool isActive = false}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 13,
      fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
      letterSpacing: 1.2,
      color: color,
    );
  }

  static TextStyle goldNumber({Color color = AppColors.gold}) {
    return GoogleFonts.cinzel(
      fontSize: 48,
      fontWeight: FontWeight.w800,
      letterSpacing: 1.0,
      color: color,
    );
  }
}
