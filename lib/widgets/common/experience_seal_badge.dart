import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/theme/app_colors.dart';

class ExperienceSealBadge extends StatelessWidget {
  final double size;

  const ExperienceSealBadge({super.key, this.size = 130});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // Metallic circular gold bevel rim
          gradient: const SweepGradient(
            colors: [
              Color(0xFF9A7414),
              Color(0xFFF7E6B8),
              Color(0xFFC9A227),
              Color(0xFFFFF2D1),
              Color(0xFF8A650C),
              Color(0xFFF7E6B8),
              Color(0xFF9A7414),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.gold.withValues(alpha: 0.4),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(size * 0.024), // Outer gold metallic bevel
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF141414),
          ),
          padding: EdgeInsets.all(size * 0.026), // Fine dark gap
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const RadialGradient(
                colors: [
                  Color(0xFF2A2A2A),
                  Color(0xFF161616),
                  Color(0xFF0C0C0C),
                ],
                radius: 0.85,
              ),
              border: Border.all(color: const Color(0xFFE5C565), width: 1.2),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: size * 0.08,
              vertical: size * 0.065,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TOP: ★ EXPERIENCE ★
                  Text(
                    '★ EXPERIENCE ★',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: size * 0.058,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.1,
                      color: const Color(0xFFE5C565),
                      height: 1.0,
                    ),
                  ),
                  SizedBox(height: size * 0.010),

                  // CENTER: 35 with Golden Metallic Gradient
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Color(0xFFFFF8DE),
                        Color(0xFFE8C868),
                        Color(0xFFB58A18),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds),
                    child: Text(
                      '35',
                      style: GoogleFonts.cinzel(
                        fontSize: size * 0.25,
                        fontWeight: FontWeight.w900,
                        height: 0.95,
                        color: Colors.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),

                  // MIDDLE: YEARS
                  Text(
                    'YEARS',
                    style: GoogleFonts.cinzel(
                      fontSize: size * 0.090,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2.4,
                      color: AppColors.white,
                      height: 1.05,
                    ),
                  ),
                  SizedBox(height: size * 0.014),

                  // BOTTOM: OF EXCELLENCE (In framed pill to prevent circular clipping)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: size * 0.045,
                      vertical: size * 0.010,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.gold.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(size * 0.06),
                      border: Border.all(
                        color: const Color(0xFFE5C565).withValues(alpha: 0.65),
                        width: 0.85,
                      ),
                    ),
                    child: Text(
                      'OF EXCELLENCE',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: size * 0.050,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.0,
                        color: const Color(0xFFFFF0C2),
                        height: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
