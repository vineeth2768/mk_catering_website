import 'package:get/get.dart';
import '../data/menu_data.dart';
import '../models/menu_model.dart';

class MenuPageController extends GetxController {
  final RxList<MenuItemModel> allMenuItems = menuData.obs;
  final RxString selectedCategory = 'ALL'.obs;

  List<String> get categories => [
        'ALL',
        'KERALA SADYA',
        'MALABAR SPECIALS',
        'WEDDING MENU',
        'BUFFET',
        'CORPORATE',
        'DESSERTS',
      ];

  List<MenuItemModel> get filteredMenuItems {
    if (selectedCategory.value == 'ALL') {
      return allMenuItems;
    }
    return allMenuItems
        .where((item) => item.category.toUpperCase() == selectedCategory.value.toUpperCase())
        .toList();
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }
}
