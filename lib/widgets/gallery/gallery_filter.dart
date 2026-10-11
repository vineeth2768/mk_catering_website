import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';

class GalleryFilter extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String category) onCategorySelected;

  const GalleryFilter({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: categories.map((cat) {
          final isSelected = cat.toUpperCase() == selectedCategory.toUpperCase();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => onCategorySelected(cat),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.charcoal : AppColors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: isSelected ? AppColors.gold : AppColors.borderLight,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    cat,
                    style: AppTextStyles.button(
                      color: isSelected ? AppColors.gold : AppColors.charcoal,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
