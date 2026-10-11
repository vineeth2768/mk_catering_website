import 'package:get/get.dart';
import '../data/services_data.dart';
import '../models/service_model.dart';

class CateringController extends GetxController {
  final RxList<ServiceModel> services = servicesData.obs;
  final RxString selectedCategory = 'ALL'.obs;
  final Rxn<ServiceModel> selectedService = Rxn<ServiceModel>();

  void setCategory(String category) {
    selectedCategory.value = category;
  }

  void selectService(ServiceModel service) {
    selectedService.value = service;
  }
}
