import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/constants/asset_constants.dart';
import '../../app/theme/app_colors.dart';

enum AppLogoVariant { dark, light, gold }

class AppLogo extends StatelessWidget {
  final AppLogoVariant variant;
  final double scale;
  final double? height;
  final double? width;
  final Alignment alignment;
  final bool showText;
  final VoidCallback? onTap;

  const AppLogo({
    super.key,
    this.variant = AppLogoVariant.dark,
    this.scale = 1.0,
    this.height,
    this.width,
    this.alignment = Alignment.centerLeft,
    this.showText = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color goldMainColor = switch (variant) {
      AppLogoVariant.dark => AppColors.deepGold,
      AppLogoVariant.light => AppColors.gold,
      AppLogoVariant.gold => AppColors.gold,
    };

    final Color textMainColor = switch (variant) {
      AppLogoVariant.dark => AppColors.charcoal,
      AppLogoVariant.light => AppColors.white,
      AppLogoVariant.gold => AppColors.gold,
    };

    final Color subTextColor = switch (variant) {
      AppLogoVariant.dark => AppColors.deepGold,
      AppLogoVariant.light => AppColors.champagne,
      AppLogoVariant.gold => AppColors.lightGold,
    };

    final double effectiveHeight = (height ?? (showText ? 85.0 : 110.0)) * scale;

    final Widget logoImage = Image.asset(
      AppImages.companyLogo,
      height: effectiveHeight,
      width: width,
      fit: BoxFit.contain,
      alignment: alignment,
      filterQuality: FilterQuality.high,
      errorBuilder: (context, error, stackTrace) {
        return CustomPaint(
          size: Size(effectiveHeight * 1.73, effectiveHeight),
          painter: _MkLogoVectorPainter(color: goldMainColor),
        );
      },
    );

    final CrossAxisAlignment crossAlign = alignment == Alignment.center
        ? CrossAxisAlignment.center
        : (alignment == Alignment.centerRight
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start);

    final Widget content = showText
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: crossAlign,
            children: [
              logoImage,
              SizedBox(height: 6 * scale),
              Text(
                'MK CATERS & EVENTS',
                style: GoogleFonts.cinzel(
                  fontSize: 13 * scale,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                  color: textMainColor,
                ),
              ),
              SizedBox(height: 2 * scale),
              Text(
                'VEG & NON VEG',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 9 * scale,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                  color: subTextColor,
                ),
              ),
            ],
          )
        : logoImage;

    return MouseRegion(
      cursor: onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: onTap,
        child: Align(
          alignment: alignment,
          widthFactor: 1.0,
          child: content,
        ),
      ),
    );
  }
}

class _MkLogoVectorPainter extends CustomPainter {
  final Color color;

  _MkLogoVectorPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final center = Offset(size.width / 2, size.height * 0.55);
    final radius = size.height * 0.28;

    // 1. Draw Outer & Inner Gold Circle Ring
    canvas.drawCircle(center, radius, paint);
    canvas.drawCircle(center, radius - 2.5, paint..strokeWidth = 1.0);

    // 2. Draw "MK" Monogram Text in Center
    final textPainter = TextPainter(
      text: TextSpan(
        text: 'MK',
        style: GoogleFonts.cormorantGaramond(
          fontSize: radius * 1.15,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
          letterSpacing: -1.0,
          color: color,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      ),
    );

    // TM mark
    final tmPainter = TextPainter(
      text: TextSpan(
        text: 'TM',
        style: GoogleFonts.plusJakartaSans(
          fontSize: 6.5,
          fontWeight: FontWeight.w800,
          color: color,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    tmPainter.paint(
      canvas,
      Offset(center.dx + radius * 0.8, center.dy - radius * 1.1),
    );

    // 3. Draw Chef Toque Hat on Top of Ring
    final hatPath = Path();
    final hatTop = center.dy - radius - 18;
    hatPath.moveTo(center.dx - 14, center.dy - radius + 2);
    hatPath.quadraticBezierTo(
      center.dx - 22,
      hatTop + 8,
      center.dx - 18,
      hatTop,
    );
    hatPath.quadraticBezierTo(
      center.dx - 10,
      hatTop - 10,
      center.dx,
      hatTop - 6,
    );
    hatPath.quadraticBezierTo(
      center.dx + 10,
      hatTop - 10,
      center.dx + 18,
      hatTop,
    );
    hatPath.quadraticBezierTo(
      center.dx + 22,
      hatTop + 8,
      center.dx + 14,
      center.dy - radius + 2,
    );
    hatPath.close();

    canvas.drawPath(hatPath, paint..strokeWidth = 1.8);
    // Band on hat
    canvas.drawLine(
      Offset(center.dx - 13, center.dy - radius),
      Offset(center.dx + 13, center.dy - radius),
      paint..strokeWidth = 2.0,
    );

    // 4. Draw Calligraphic Royal Wings (Left & Right Swirls)
    // Left Wing
    final leftWing = Path();
    leftWing.moveTo(center.dx - radius - 2, center.dy);
    leftWing.cubicTo(
      center.dx - radius - 20,
      center.dy - 30,
      center.dx - radius - 45,
      center.dy - 10,
      center.dx - radius - 30,
      center.dy + 15,
    );
    leftWing.cubicTo(
      center.dx - radius - 15,
      center.dy + 35,
      center.dx - radius - 60,
      center.dy + 25,
      center.dx - size.width / 2 + 5,
      center.dy + 20,
    );
    canvas.drawPath(leftWing, paint..strokeWidth = 1.6);

    // Right Wing
    final rightWing = Path();
    rightWing.moveTo(center.dx + radius + 2, center.dy);
    rightWing.cubicTo(
      center.dx + radius + 20,
      center.dy - 30,
      center.dx + radius + 45,
      center.dy - 10,
      center.dx + radius + 30,
      center.dy + 15,
    );
    rightWing.cubicTo(
      center.dx + radius + 15,
      center.dy + 35,
      center.dx + radius + 60,
      center.dy + 25,
      center.dx + size.width / 2 - 5,
      center.dy + 20,
    );
    canvas.drawPath(rightWing, paint..strokeWidth = 1.6);
  }

  @override
  bool shouldRepaint(covariant _MkLogoVectorPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
