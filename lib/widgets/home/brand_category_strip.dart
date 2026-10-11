import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/constants/app_constants.dart';
import '../../app/theme/app_colors.dart';
import '../../utils/responsive_utils.dart';

class BrandCategoryStrip extends StatelessWidget {
  final bool isTransparentBg;

  const BrandCategoryStrip({
    super.key,
    this.isTransparentBg = false,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 32,
        vertical: isMobile ? 18 : 26,
      ),
      decoration: isTransparentBg
          ? null
          : BoxDecoration(
              color: const Color(0xFF141210), // Rich dark royal banquet tone
              border: Border(
                top: BorderSide(
                  color: AppColors.gold.withValues(alpha: 0.35),
                  width: 1.0,
                ),
                bottom: BorderSide(
                  color: AppColors.gold.withValues(alpha: 0.35),
                  width: 1.0,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.45),
                  blurRadius: 18,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1080),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1. VEG & NON VEG (Pure Bold Gold Typography, exactly like the banner)
              Text(
                AppConstants.appSubBrand,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: isMobile ? 13 : 16,
                  fontWeight: FontWeight.w900,
                  letterSpacing: isMobile ? 2.2 : 3.0,
                  color: const Color(0xFFE5A910),
                  height: 1.0,
                ),
              ),
              SizedBox(height: isMobile ? 10 : 13),

              // 2. CUISINES ROW (• ARABIC • INDIAN • CHINESE • CONTINENTAL FOOD)
              Wrap(
                alignment: WrapAlignment.center,
                spacing: isMobile ? 12 : 24,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: AppConstants.cuisines.map((cuisine) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '• ',
                        style: TextStyle(
                          color: Color(0xFFE5A910),
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        cuisine,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: isMobile ? 11.5 : 13.5,
                          letterSpacing: 1.6,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFF3ECE0),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: isMobile ? 12 : 16),

              // 3. FILLED GOLD BANNER STRIP (WEDDING | ANNIVERSARIES | PARTY ORDERS | BUFFETS | EVENTS)
              Container(
                width: isMobile ? double.infinity : null,
                constraints: const BoxConstraints(maxWidth: 860),
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 12 : 28,
                  vertical: isMobile ? 7 : 9,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0A31B), // Solid vibrant luxury gold
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFE0A31B).withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: isMobile ? 6 : 14,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    for (int i = 0; i < AppConstants.eventTypesTagline.length; i++) ...[
                      Text(
                        AppConstants.eventTypesTagline[i],
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: isMobile ? 10 : 12.5,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.4,
                          color: const Color(0xFF161410), // Solid dark charcoal/black
                        ),
                      ),
                      if (i < AppConstants.eventTypesTagline.length - 1)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Text(
                            '|',
                            style: TextStyle(
                              color: const Color(0xFF161410).withValues(alpha: 0.5),
                              fontSize: isMobile ? 11 : 13,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
