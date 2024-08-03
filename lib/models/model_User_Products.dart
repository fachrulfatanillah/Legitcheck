class UserProducts {
  final String id;
  final String qrcode_id;
  final String id_product;
  final String photo;
  final String name;
  final String description;
  final String size;
  final String category;

  UserProducts({
    required this.id,
    required this.qrcode_id,
    required this.id_product,
    required this.photo,
    required this.name,
    required this.description,
    required this.size,
    required this.category,
  });

  factory UserProducts.fromJson(Map<String, dynamic> json) {
    return UserProducts(
      id: json['id'],
      qrcode_id: json['qrcode_id'],
      id_product: json['id_product'],
      photo: json['photo'],
      name: json['name'],
      description: json['description'],
      size: json['size'],
      category: json['category'],
    );
  }
}
