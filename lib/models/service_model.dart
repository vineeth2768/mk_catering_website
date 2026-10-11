class ServiceModel {
  final String id;
  final String number;
  final String title;
  final String subtitle;
  final String description;
  final String image;
  final List<String> features;
  final String category;

  const ServiceModel({
    required this.id,
    required this.number,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
    required this.features,
    this.category = 'Catering',
  });
}
