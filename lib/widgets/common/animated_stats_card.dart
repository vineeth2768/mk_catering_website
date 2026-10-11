import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';

class AnimatedStatsCard extends StatefulWidget {
  final bool isMobile;
  final bool isDark;
  final Duration delay;

  const AnimatedStatsCard({
    super.key,
    required this.isMobile,
    this.isDark = true,
    this.delay = const Duration(milliseconds: 250),
  });

  @override
  State<AnimatedStatsCard> createState() => _AnimatedStatsCardState();
}

class _AnimatedStatsCardState extends State<AnimatedStatsCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 580),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          final expCount = (_animation.value * 35).round();
          final foodsCount = (_animation.value * 99).round();
          final staffsCount = (_animation.value * 35).round();

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: widget.isMobile
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              Expanded(
                child: _StatColumn(
                  count: '$expCount+',
                  label: 'YEARS OF\nEXPERIENCE',
                  isMobile: widget.isMobile,
                  isDark: widget.isDark,
                ),
              ),
              Container(
                height: widget.isMobile ? 36 : 46,
                width: 1,
                margin: EdgeInsets.symmetric(
                  horizontal: widget.isMobile ? 10 : 20,
                ),
                color: AppColors.gold.withValues(alpha: 0.35),
              ),
              Expanded(
                child: _StatColumn(
                  count: '$foodsCount+',
                  label: 'FOOD\nITEMS',
                  isMobile: widget.isMobile,
                  isDark: widget.isDark,
                ),
              ),
              Container(
                height: widget.isMobile ? 36 : 46,
                width: 1,
                margin: EdgeInsets.symmetric(
                  horizontal: widget.isMobile ? 10 : 20,
                ),
                color: AppColors.gold.withValues(alpha: 0.35),
              ),
              Expanded(
                child: _StatColumn(
                  count: '$staffsCount+',
                  label: 'DEDICATED\nSTAFFS',
                  isMobile: widget.isMobile,
                  isDark: widget.isDark,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String count;
  final String label;
  final bool isMobile;
  final bool isDark;

  const _StatColumn({
    required this.count,
    required this.label,
    required this.isMobile,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          count,
          style: GoogleFonts.cinzel(
            fontSize: isMobile ? 30 : 42,
            fontWeight: FontWeight.w700,
            color: isDark ? AppColors.white : AppColors.gold,
            letterSpacing: 1.0,
            height: 1.1,
            shadows: isDark
                ? [
                    Shadow(
                      offset: const Offset(0, 2),
                      blurRadius: 10,
                      color: Colors.black.withValues(alpha: 0.8),
                    ),
                  ]
                : null,
          ),
        ),
        SizedBox(height: isMobile ? 6 : 8),
        Text(
          label,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.plusJakartaSans(
            fontSize: isMobile ? 10 : 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.8,
            color: isDark ? AppColors.champagne : AppColors.charcoal,
            height: 1.35,
            shadows: isDark
                ? [
                    Shadow(
                      offset: const Offset(0, 1),
                      blurRadius: 6,
                      color: Colors.black.withValues(alpha: 0.8),
                    ),
                  ]
                : null,
          ),
        ),
      ],
    );
  }
}
