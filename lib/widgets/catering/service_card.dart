import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../models/service_model.dart';
import '../common/image_container.dart';

class ServiceCard extends StatefulWidget {
  final ServiceModel service;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.service,
    required this.onTap,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
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
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()..translate(0.0, _isHovered ? -8.0 : 0.0),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered ? AppColors.gold : AppColors.borderLight,
              width: _isHovered ? 1.5 : 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.gold.withOpacity(0.18)
                    : Colors.black.withOpacity(0.04),
                blurRadius: _isHovered ? 20 : 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Stack with Gold Number Overlay
              Stack(
                children: [
                  AnimatedScale(
                    scale: _isHovered ? 1.04 : 1.0,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOutCubic,
                    child: ImageContainer(
                      imageUrl: widget.service.image,
                      height: 220,
                      width: double.infinity,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.charcoal.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.gold, width: 1),
                      ),
                      child: Text(
                        widget.service.number,
                        style: AppTextStyles.button(color: AppColors.gold),
                      ),
                    ),
                  ),
                ],
              ),

              // Content Details
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.service.title,
                      style: AppTextStyles.h3(color: AppColors.charcoal),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.service.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodyMedium(color: AppColors.textMuted),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'EXPLORE SERVICE',
                          style: AppTextStyles.button(
                            color: _isHovered ? AppColors.deepGold : AppColors.charcoal,
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: EdgeInsets.only(left: _isHovered ? 12 : 6),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 16,
                            color: _isHovered ? AppColors.deepGold : AppColors.charcoal,
                          ),
                        ),
                      ],
                    ),
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
