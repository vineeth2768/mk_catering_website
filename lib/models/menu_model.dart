class MenuItemModel {
  final String id;
  final String name;
  final String category;
  final String description;
  final String image;
  final List<String> tags;
  final bool isSpecialty;

  const MenuItemModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.image,
    this.tags = const [],
    this.isSpecialty = false,
  });
}
