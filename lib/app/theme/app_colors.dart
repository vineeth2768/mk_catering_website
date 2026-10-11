import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Gold Palette
  static const Color gold = Color(0xFFC9A227);
  static const Color lightGold = Color(0xFFE1C45A);
  static const Color champagne = Color(0xFFD6B76A);
  static const Color paleGold = Color(0xFFF0DFAD);
  static const Color deepGold = Color(0xFF9A7414);

  // Neutral Palette
  static const Color charcoal = Color(0xFF171717);
  static const Color softCharcoal = Color(0xFF242424);
  static const Color warmIvory = Color(0xFFFAF7F0);
  static const Color cream = Color(0xFFF3EBDD);
  static const Color white = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textDark = Color(0xFF171717);
  static const Color textMuted = Color(0xFF6E6A61);
  static const Color textLight = Color(0xFFFAF7F0);

  // Borders
  static const Color borderLight = Color(0xFFE5DDD0);
  static const Color borderGold = Color(0x66D6B76A);

  // Gold Gradient
  static const LinearGradient goldGradient = LinearGradient(
    colors: [deepGold, gold, lightGold],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [charcoal, softCharcoal],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
