import 'package:flutter/material.dart';
import '../../app/constants/asset_constants.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_text_styles.dart';
import '../../utils/responsive_utils.dart';
import '../../utils/url_launcher_utils.dart';
import '../common/animated_reveal.dart';
import '../common/gold_divider.dart';
import '../common/image_container.dart';
import '../common/primary_button.dart';
import '../common/secondary_button.dart';

class FinalCtaSection extends StatelessWidget {
  final VoidCallback onGetQuote;

  const FinalCtaSection({
    super.key,
    required this.onGetQuote,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.charcoal,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned.fill(
            child: ImageContainer(
              imageUrl: AppImages.finalCtaBg,
              fit: BoxFit.cover,
              overlayColor: AppColors.charcoal,
              overlayOpacity: 0.85,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveUtils.contentHorizontalPadding(context),
              vertical: isMobile ? AppSpacing.sectionSm : AppSpacing.sectionLg,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "LET'S CREATE SOMETHING SPECIAL",
                      style: AppTextStyles.eyebrow(color: AppColors.champagne),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Planning Your Next Event?',
                      textAlign: TextAlign.center,
                      style: isMobile
                          ? AppTextStyles.h1Mobile(color: AppColors.white)
                          : AppTextStyles.h1(color: AppColors.white),
                    ),
                    const SizedBox(height: 16),
                    const GoldDivider(width: 80, alignment: Alignment.center, showDiamond: true),
                    const SizedBox(height: 20),
                    Text(
                      "Let's create an unforgettable experience together. Contact our event specialists today for a customized quote and tasting session.",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyLarge(
                        color: AppColors.cream.withOpacity(0.85),
                      ),
                    ),
                    const SizedBox(height: 40),

                    AnimatedReveal(
                      direction: RevealDirection.scale,
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        children: [
                          PrimaryButton(
                            text: 'GET A QUOTE',
                            onPressed: onGetQuote,
                          ),
                          SecondaryButton(
                            text: 'WHATSAPP US',
                            isDarkSection: true,
                            icon: Icons.chat_bubble_outline_rounded,
                            onPressed: () => UrlLauncherUtils.openWhatsApp(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
