class QrData {
  final String decrypted;
  final String photo;
  final String category;
  final String name;
  final String size;
  final String description;

  QrData({
    required this.decrypted,
    required this.photo,
    required this.category,
    required this.name,
    required this.size,
    required this.description,
  });

  factory QrData.fromJson(Map<String, dynamic> json) {
    return QrData(
      decrypted: json['decrypted'],
      photo: json['photo'],
      category: json['category'],
      name: json['name'],
      size: json['size'],
      description: json['description'],
    );
  }
}
