import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../models/menu_model.dart';
import '../common/image_container.dart';

class MenuItemCard extends StatefulWidget {
  final MenuItemModel item;
  final VoidCallback? onRequestItem;

  const MenuItemCard({
    super.key,
    required this.item,
    this.onRequestItem,
  });

  @override
  State<MenuItemCard> createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
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
                  ? AppColors.gold.withOpacity(0.12)
                  : Colors.black.withOpacity(0.03),
              blurRadius: _isHovered ? 16 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Stack
            Stack(
              children: [
                ImageContainer(
                  imageUrl: widget.item.image,
                  height: 200,
                  width: double.infinity,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                if (widget.item.isSpecialty)
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.deepGold,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'CHEF SPECIALTY',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            // Content Body
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.category,
                    style: AppTextStyles.eyebrow(color: AppColors.deepGold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.item.name,
                    style: AppTextStyles.h3(color: AppColors.charcoal),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.item.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyMedium(color: AppColors.textMuted),
                  ),
                  const SizedBox(height: 16),

                  // Tags Wrap
                  if (widget.item.tags.isNotEmpty)
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.item.tags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.warmIvory,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: AppColors.borderLight,
                            ),
                          ),
                          child: Text(
                            tag,
                            style: AppTextStyles.bodySmall(
                              color: AppColors.textDark,
                            ).copyWith(fontSize: 11),
                          ),
                        );
                      }).toList(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
