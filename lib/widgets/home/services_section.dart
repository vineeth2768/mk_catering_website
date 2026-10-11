import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../data/services_data.dart';
import '../../utils/responsive_utils.dart';
import '../catering/service_card.dart';
import '../common/animated_reveal.dart';
import '../common/section_header.dart';

class ServicesSection extends StatelessWidget {
  final Function(String serviceId) onServiceSelect;

  const ServicesSection({
    super.key,
    required this.onServiceSelect,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);

    int crossAxisCount = 3;
    if (isMobile) {
      crossAxisCount = 1;
    } else if (isTablet) {
      crossAxisCount = 2;
    }

    return Container(
      color: AppColors.warmIvory,
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
                eyebrow: 'OUR SERVICES',
                title: 'Made for Every Occasion',
                description:
                    'From sacred Kerala traditional sadya feasts to grand royal receptions, corporate conferences, and private celebrations.',
              ),
              SizedBox(height: isMobile ? 32 : 56),

              // Grid of 6 Service Cards
              LayoutBuilder(
                builder: (context, constraints) {
                  final cardWidth =
                      (constraints.maxWidth - (crossAxisCount - 1) * 24) / crossAxisCount;

                  return Wrap(
                    spacing: 24,
                    runSpacing: 32,
                    children: servicesData.map((service) {
                      return SizedBox(
                        width: cardWidth,
                        child: AnimatedReveal(
                          direction: RevealDirection.slideUp,
                          child: ServiceCard(
                            service: service,
                            onTap: () => onServiceSelect(service.id),
                          ),
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
