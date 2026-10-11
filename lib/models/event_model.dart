class EventModel {
  final String id;
  final String title;
  final String category;
  final String description;
  final String location;
  final String image;
  final String guestCount;
  final List<String> highlights;

  const EventModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.location,
    required this.image,
    required this.guestCount,
    required this.highlights,
  });
}
