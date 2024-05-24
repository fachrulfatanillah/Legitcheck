class OwnOfProducts {
  final String id;
  final String qrcode_id;
  final String user_id;
  final String status;

  OwnOfProducts({
    required this.id,
    required this.qrcode_id,
    required this.user_id,
    required this.status,
  });

  factory OwnOfProducts.fromJson(Map<String, dynamic> json) {
    return OwnOfProducts(
      id: json['id'],
      qrcode_id: json['qrcode_id'],
      user_id: json['user_id'],
      status: json['status'],
    );
  }
}
