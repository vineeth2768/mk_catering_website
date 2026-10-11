import 'package:get/get.dart';
import '../data/gallery_data.dart';
import '../models/gallery_model.dart';

class GalleryController extends GetxController {
  final RxList<GalleryItemModel> allItems = galleryData.obs;
  final RxString selectedCategory = 'ALL'.obs;

  // Lightbox State
  final RxBool isLightboxOpen = false.obs;
  final RxInt activeIndex = 0.obs;

  List<String> get categories => [
        'ALL',
        'FOOD',
        'WEDDINGS',
        'EVENTS',
        'BUFFET',
        'CELEBRATIONS',
      ];

  List<GalleryItemModel> get filteredItems {
    if (selectedCategory.value == 'ALL') {
      return allItems;
    }
    return allItems
        .where((item) => item.category.toUpperCase() == selectedCategory.value.toUpperCase())
        .toList();
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  void openLightbox(int index) {
    activeIndex.value = index;
    isLightboxOpen.value = true;
  }

  void closeLightbox() {
    isLightboxOpen.value = false;
  }

  void nextImage() {
    if (filteredItems.isNotEmpty) {
      activeIndex.value = (activeIndex.value + 1) % filteredItems.length;
    }
  }

  void previousImage() {
    if (filteredItems.isNotEmpty) {
      activeIndex.value =
          (activeIndex.value - 1 + filteredItems.length) % filteredItems.length;
    }
  }

  GalleryItemModel? get currentLightboxItem {
    if (!isLightboxOpen.value || filteredItems.isEmpty) return null;
    if (activeIndex.value >= filteredItems.length) return filteredItems.first;
    return filteredItems[activeIndex.value];
  }
}
