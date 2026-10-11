import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController guestCountController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final RxString selectedEventType = 'Wedding Catering'.obs;
  final RxBool isLoading = false.obs;
  final RxBool isSuccess = false.obs;
  final RxString errorMessage = ''.obs;

  final List<String> eventTypes = [
    'Wedding Catering',
    'Kerala Sadya Feast',
    'Malabar Cuisine Catering',
    'Corporate Catering',
    'Private Event / Birthday',
    'Large-Scale Event Catering',
    'Event Management & Coordination',
  ];

  void setEventType(String? type) {
    if (type != null) {
      selectedEventType.value = type;
    }
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your phone number';
    }
    if (value.trim().length < 8) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email address';
    }
    if (!GetUtils.isEmail(value.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validateGuestCount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please specify guest count';
    }
    final count = int.tryParse(value.trim());
    if (count == null || count <= 0) {
      return 'Enter a valid number of guests';
    }
    return null;
  }

  Future<void> submitEnquiry() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    // Simulate backend API call
    await Future.delayed(const Duration(milliseconds: 1200));

    isLoading.value = false;
    isSuccess.value = true;

    // Reset form after successful submission
    formKey.currentState?.reset();
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    dateController.clear();
    locationController.clear();
    guestCountController.clear();
    messageController.clear();
  }

  void resetStatus() {
    isSuccess.value = false;
    errorMessage.value = '';
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    dateController.dispose();
    locationController.dispose();
    guestCountController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
