import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:legitcheck/models/api_config.dart';
import 'package:legitcheck/models/model_OwnOf_Products.dart';

class APIConfig {
  static final String baseUrl = '${APIConfigOwnofProducts.baseUrl}';
  static final String token = '${APIConfigOwnofProducts.token}';
}

class OwnOfProductsGet {
  String _baseUrl = APIConfig.baseUrl;
  String _token = APIConfig.token;

  OwnOfProductsGet();

  Future<List<OwnOfProducts>> getOwnOfProducts() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = jsonDecode(response.body);
        List<OwnOfProducts> users =
            jsonResponse.map((user) => OwnOfProducts.fromJson(user)).toList();
        return users;
      } else {
        throw Exception('Gagal mengambil data pemilik products dari API');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }
}

class OwnOfProductPost {
  String _baseUrl = APIConfig.baseUrl;
  String _token = APIConfig.token;

  OwnOfProductPost();

  Future<void> addOwnOfProduct(
    String qrcode_id,
    String user_id,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        body: jsonEncode({
          'qrcode_id': qrcode_id,
          'user_id': user_id,
          'status': 1,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 201) {
        print('User registered successfully');
      } else {
        print('Error registering user: ${response.body}');
      }
    } catch (e) {
      print('Error registering user: $e');
    }
  }
}

class OwnOfProductUpdate {
  final String _baseUrl = APIConfig.baseUrl;
  final String _token = APIConfig.token;

  OwnOfProductUpdate();

  Future<void> updateOwnOfProduct(String id) async {
    final url = '$_baseUrl/$id';

    try {
      final response = await http.put(
        Uri.parse(url),
        body: 'status=0',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        print('User updated successfully');
      } else {
        print('Error updating user: ${response.body}');
      }
    } catch (e) {
      print('Exception while updating user: $e');
    }
  }
}
