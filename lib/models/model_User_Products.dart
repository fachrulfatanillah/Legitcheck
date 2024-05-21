import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:legitcheck/models/api_config.dart';

class APIConfig {
  static final String baseUrl = '${APIConfigUserProducts.baseUrl}';
  static final String token = '${APIConfigUserProducts.token}';
}

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

class UserProductsGet {
  String _baseUrl = APIConfig.baseUrl;
  String _token = APIConfig.token;

  UserProductsGet();

  Future<List<UserProducts>> getUserProducts(String userId) async {
    final url = '$_baseUrl/$userId';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = jsonDecode(response.body);
        List<UserProducts> userProducts = jsonResponse
            .map((products) => UserProducts.fromJson(products))
            .toList();
        return userProducts;
      } else {
        throw Exception('Gagal mengambil data pengguna dari API');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }
}
