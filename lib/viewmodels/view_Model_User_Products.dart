import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:legitcheck/models/api_config.dart';
import 'package:legitcheck/models/model_User_Products.dart';

class APIConfig {
  static final String baseUrl = '${APIConfigUserProducts.baseUrl}';
  static final String token = '${APIConfigUserProducts.token}';
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
