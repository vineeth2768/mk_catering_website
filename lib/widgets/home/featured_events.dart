import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../data/events_data.dart';
import '../../utils/responsive_utils.dart';
import '../common/animated_reveal.dart';
import '../common/secondary_button.dart';
import '../common/section_header.dart';
import '../events/event_card.dart';

class FeaturedEventsSection extends StatelessWidget {
  final VoidCallback onViewAllEvents;
  final Function(String eventId) onSelectEvent;

  const FeaturedEventsSection({
    super.key,
    required this.onViewAllEvents,
    required this.onSelectEvent,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);

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
                eyebrow: 'PORTFOLIO & CELEBRATIONS',
                title: 'Celebrations, Beautifully Brought Together',
                description:
                    'Explore a curated glimpse of past weddings, high-profile corporate summits, and intimate family gatherings executed by MK.',
              ),
              SizedBox(height: isMobile ? 32 : 56),

              // Event Cards Layout
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossCount = isMobile ? 1 : (isTablet ? 2 : 3);
                  final width =
                      (constraints.maxWidth - (crossCount - 1) * 24) / crossCount;

                  return Wrap(
                    spacing: 24,
                    runSpacing: 32,
                    children: eventsData.take(6).map((event) {
                      return SizedBox(
                        width: width,
                        child: AnimatedReveal(
                          direction: RevealDirection.slideUp,
                          child: EventCard(
                            event: event,
                            onTap: () => onSelectEvent(event.id),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),

              const SizedBox(height: 48),

              SecondaryButton(
                text: 'VIEW ALL EVENTS',
                icon: Icons.arrow_forward_rounded,
                onPressed: onViewAllEvents,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
