class TestimonialModel {
  final String id;
  final String clientName;
  final String eventType;
  final String quote;
  final int rating;
  final String date;

  const TestimonialModel({
    required this.id,
    required this.clientName,
    required this.eventType,
    required this.quote,
    this.rating = 5,
    required this.date,
  });
}
