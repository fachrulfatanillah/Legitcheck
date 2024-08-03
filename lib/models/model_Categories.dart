class Categories {
  final String id_category;
  final String category;

  Categories({
    required this.id_category,
    required this.category,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id_category: json['id_category'],
      category: json['category'],
    );
  }
}
