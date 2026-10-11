import 'package:get/get.dart';
import '../data/events_data.dart';
import '../models/event_model.dart';

class EventsController extends GetxController {
  final RxList<EventModel> allEvents = eventsData.obs;
  final RxString selectedCategory = 'ALL'.obs;
  final Rxn<EventModel> selectedEventModal = Rxn<EventModel>();

  List<String> get categories => [
        'ALL',
        'WEDDINGS',
        'ENGAGEMENTS',
        'CORPORATE',
        'PRIVATE CELEBRATIONS',
        'LARGE EVENTS',
      ];

  List<EventModel> get filteredEvents {
    if (selectedCategory.value == 'ALL') {
      return allEvents;
    }
    return allEvents
        .where((e) => e.category.toUpperCase() == selectedCategory.value.toUpperCase())
        .toList();
  }

  void setCategory(String category) {
    selectedCategory.value = category;
  }

  void openEventModal(EventModel event) {
    selectedEventModal.value = event;
  }

  void closeEventModal() {
    selectedEventModal.value = null;
  }
}
