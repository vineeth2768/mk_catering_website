import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../data/testimonials_data.dart';
import '../../utils/responsive_utils.dart';
import '../common/animated_reveal.dart';
import '../common/section_header.dart';
import '../testimonials/testimonial_card.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);

    return Container(
      color: AppColors.softCharcoal,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.contentHorizontalPadding(context),
        vertical: isMobile ? AppSpacing.sectionSm : AppSpacing.sectionMd,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: Column(
            children: [
              const SectionHeader(
                eyebrow: 'CLIENT FEEDBACK',
                title: 'Memories Made Better Together',
                description:
                    'Hear what couples, families, and corporate organizations say about MK Catering & Event Management.',
                darkMode: true,
              ),
              SizedBox(height: isMobile ? 32 : 56),

              // Grid of Testimonial Cards
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossCount = isMobile ? 1 : (isTablet ? 1 : 2);
                  final width =
                      (constraints.maxWidth - (crossCount - 1) * 24) / crossCount;

                  return Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: testimonialsData.map((item) {
                      return SizedBox(
                        width: width,
                        child: AnimatedReveal(
                          direction: RevealDirection.slideUp,
                          child: TestimonialCard(testimonial: item),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
