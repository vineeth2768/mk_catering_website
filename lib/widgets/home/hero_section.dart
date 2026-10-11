import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/constants/app_constants.dart';
import '../../app/constants/asset_constants.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../utils/responsive_utils.dart';
import '../common/animated_reveal.dart';
import '../common/animated_stats_card.dart';
import '../common/experience_seal_badge.dart';
import '../common/primary_button.dart';
import '../common/secondary_button.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onPlanEvent;
  final VoidCallback onExploreServices;

  const HeroSection({
    super.key,
    required this.onPlanEvent,
    required this.onExploreServices,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  int _currentIndex = 0;
  Timer? _timer;
  final List<String> _images = AppImages.heroBackgroundImages;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _images.length;
        });
      }
    });
  }

  void _goToSlide(int index) {
    if (_currentIndex == index) return;
    setState(() {
      _currentIndex = index;
    });
    _startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (final img in _images) {
      precacheImage(AssetImage(img), context);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = ResponsiveUtils.isMobile(context);
    final heroHeight = isMobile
        ? (screenSize.height >= 720 ? screenSize.height : 720.0)
        : (screenSize.height >= 660 ? screenSize.height : 660.0);

    return Container(
      width: double.infinity,
      height: heroHeight,
      color: AppColors.charcoal,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Automatic Background Images Slider (Smooth Cross-fade)
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 1400),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            layoutBuilder: (currentChild, previousChildren) {
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  ...previousChildren,
                  ?currentChild,
                ],
              );
            },
            child: Image.asset(
              _images[_currentIndex],
              key: ValueKey<String>(_images[_currentIndex]),
              fit: BoxFit.cover,
              alignment: Alignment.center,
              errorBuilder: (context, error, stackTrace) => Image.network(
                AppImages.heroFallback,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Luxury Dark Gradient Tint Overlay for text legibility
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.charcoal.withValues(alpha: isMobile ? 0.85 : 0.80),
                  AppColors.charcoal.withValues(alpha: isMobile ? 0.72 : 0.65),
                  AppColors.charcoal.withValues(alpha: isMobile ? 0.90 : 0.88),
                ],
                stops: const [0.0, 0.45, 1.0],
              ),
            ),
          ),

          // Horizontal Editorial Vignette (Darker on Left behind text, clearer on Right)
          if (!isMobile)
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.charcoal.withValues(alpha: 0.75),
                    AppColors.charcoal.withValues(alpha: 0.40),
                    AppColors.charcoal.withValues(alpha: 0.10),
                  ],
                  stops: const [0.0, 0.55, 1.0],
                ),
              ),
            ),

            // Main Hero Content Container
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1100),
                padding: EdgeInsets.only(
                  left: isMobile ? 20 : 48,
                  right: isMobile ? 20 : 48,
                  top: isMobile ? 85 : 60,
                  bottom: isMobile ? 45 : 60,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:
                      isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                  children: [
                    // 35 Years Experience Seal Badge on Mobile (Centered gracefully above headline)
                    if (isMobile) ...[
                      AnimatedReveal(
                        direction: RevealDirection.fade,
                        delay: const Duration(milliseconds: 100),
                        child: const ExperienceSealBadge(
                          size: 80,
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],

                    // Large Editorial Heading
                    AnimatedReveal(
                      direction: RevealDirection.slideUp,
                      delay: const Duration(milliseconds: 150),
                      child: Text(
                        '35 YEARS OF TRADITION.\nA LEGACY OF TASTE. A TOUCH OF LUXURY.',
                        textAlign: isMobile ? TextAlign.center : TextAlign.start,
                        style: (isMobile
                            ? AppTextStyles.displayHeroMobile(color: AppColors.white)
                            : AppTextStyles.displayHero(color: AppColors.white)).copyWith(
                          shadows: [
                            Shadow(
                              offset: const Offset(0, 2),
                              blurRadius: 16,
                              color: Colors.black.withValues(alpha: 0.9),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: isMobile ? 12 : 15),

                    // Cuisines & Event Categories Details (Integrated Directly in Hero)
                    AnimatedReveal(
                      direction: RevealDirection.slideUp,
                      delay: const Duration(milliseconds: 220),
                      child: Column(
                        crossAxisAlignment: isMobile
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // 1. VEG & NON VEG
                          Text(
                            AppConstants.appSubBrand,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: isMobile ? 12 : 13.5,
                              fontWeight: FontWeight.w900,
                              letterSpacing: isMobile ? 2.0 : 2.5,
                              color: const Color(0xFFE5A910),
                              shadows: [
                                Shadow(
                                  offset: const Offset(0, 1),
                                  blurRadius: 8,
                                  color: Colors.black.withValues(alpha: 0.8),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),

                          // 2. CUISINES ROW (• ARABIC • INDIAN • CHINESE • CONTINENTAL FOOD)
                          Wrap(
                            alignment:
                                isMobile ? WrapAlignment.center : WrapAlignment.start,
                            spacing: isMobile ? 10 : 18,
                            runSpacing: 4,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: AppConstants.cuisines.map((cuisine) {
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    '• ',
                                    style: TextStyle(
                                      color: Color(0xFFE5A910),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    cuisine,
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: isMobile ? 10.5 : 12,
                                      letterSpacing: 1.4,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFFF3ECE0),
                                      shadows: [
                                        Shadow(
                                          offset: const Offset(0, 1),
                                          blurRadius: 6,
                                          color: Colors.black.withValues(alpha: 0.8),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 8),

                          // 3. EVENT CATEGORIES GOLD STRIP
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 10 : 16,
                              vertical: isMobile ? 5 : 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE0A31B),
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFE0A31B).withValues(alpha: 0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Wrap(
                              alignment:
                                  isMobile ? WrapAlignment.center : WrapAlignment.start,
                              spacing: isMobile ? 6 : 12,
                              runSpacing: 4,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                for (int i = 0;
                                    i < AppConstants.eventTypesTagline.length;
                                    i++) ...[
                                  Text(
                                    AppConstants.eventTypesTagline[i],
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: isMobile ? 9.5 : 11,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.2,
                                      color: const Color(0xFF161410),
                                    ),
                                  ),
                                  if (i < AppConstants.eventTypesTagline.length - 1)
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 2.0),
                                      child: Text(
                                        '|',
                                        style: TextStyle(
                                          color: const Color(0xFF161410)
                                              .withValues(alpha: 0.45),
                                          fontSize: isMobile ? 10 : 11.5,
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
                    SizedBox(height: isMobile ? 16 : 20),

                    // Animated Stats Counter (35+ Years of Experience, 99+ foods Items, 35+ Staffs)
                    AnimatedReveal(
                      direction: RevealDirection.slideUp,
                      delay: const Duration(milliseconds: 280),
                      child: AnimatedStatsCard(isMobile: isMobile),
                    ),
                    SizedBox(height: isMobile ? 18 : 22),

                    // Action Buttons
                    AnimatedReveal(
                      direction: RevealDirection.slideUp,
                      delay: const Duration(milliseconds: 400),
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                        children: [
                          PrimaryButton(
                            text: 'PLAN YOUR EVENT',
                            onPressed: widget.onPlanEvent,
                          ),
                          SecondaryButton(
                            text: 'EXPLORE SERVICES',
                            isDarkSection: true,
                            onPressed: widget.onExploreServices,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 35 Years Experience Seal Badge on Desktop (Floats gracefully in top-right)
            if (!isMobile)
              Positioned(
                top: 115,
                right: 55,
                child: AnimatedReveal(
                  direction: RevealDirection.fade,
                  delay: const Duration(milliseconds: 500),
                  child: const ExperienceSealBadge(
                    size: 130,
                  ),
                ),
              ),

            // Bottom Bar Indicators
            Positioned(
              left: isMobile ? 20 : 64,
              right: isMobile ? 20 : 64,
              bottom: isMobile ? 20 : 28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.south_rounded,
                        color: AppColors.gold,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'SCROLL TO EXPLORE',
                        style: AppTextStyles.eyebrow(color: AppColors.champagne),
                      ),
                    ],
                  ),
                  // Background Images Slider Indicator Bars
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(_images.length, (index) {
                      final isActive = _currentIndex == index;
                      return GestureDetector(
                        onTap: () => _goToSlide(index),
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeOut,
                            height: 4,
                            width: isActive ? (isMobile ? 22 : 32) : 10,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? AppColors.gold
                                  : AppColors.champagne.withValues(alpha: 0.35),
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: isActive
                                  ? [
                                      BoxShadow(
                                        color: AppColors.gold.withValues(alpha: 0.6),
                                        blurRadius: 6,
                                        offset: const Offset(0, 1),
                                      ),
                                    ]
                                  : null,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
