import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../models/event_model.dart';
import '../common/image_container.dart';

class EventCard extends StatefulWidget {
  final EventModel event;
  final VoidCallback onTap;

  const EventCard({
    super.key,
    required this.event,
    required this.onTap,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered ? AppColors.gold : AppColors.borderLight,
              width: _isHovered ? 1.5 : 1.0,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 340,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AnimatedScale(
                    scale: _isHovered ? 1.05 : 1.0,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOutCubic,
                    child: ImageContainer(
                      imageUrl: widget.event.image,
                      fit: BoxFit.cover,
                      overlayColor: AppColors.charcoal,
                      overlayOpacity: _isHovered ? 0.45 : 0.60,
                    ),
                  ),

                  // Top Category Tag
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.charcoal.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.gold),
                      ),
                      child: Text(
                        widget.event.category,
                        style: AppTextStyles.eyebrow(color: AppColors.gold),
                      ),
                    ),
                  ),

                  // Bottom Animated Text Box
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 20,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      transform: Matrix4.identity()
                        ..translate(0.0, _isHovered ? -6.0 : 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.event.title,
                            style: AppTextStyles.h3(color: AppColors.white),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(
                                Icons.people_outline_rounded,
                                color: AppColors.gold,
                                size: 14,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                widget.event.guestCount,
                                style: AppTextStyles.bodySmall(
                                  color: AppColors.gold,
                                ),
                              ),
                            ],
                          ),
                        ],
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
