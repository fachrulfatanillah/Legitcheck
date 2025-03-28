import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:legitcheck/models/api_config.dart';
import 'package:legitcheck/models/model_Categories.dart';

class APIConfig {
  static final String baseUrl = '${APIConfigCategories.baseUrl}';
  static final String token = '${APIConfigCategories.token}';
}

class CategoriesGet {
  String _baseUrl = APIConfig.baseUrl;
  String _token = APIConfig.token;

  CategoriesGet();

  Future<List<Categories>> getCategories() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = jsonDecode(response.body);
        List<Categories> categories = jsonResponse
            .map((categories) => Categories.fromJson(categories))
            .toList();
        return categories;
      } else {
        throw Exception('Gagal mengambil data pengguna dari API');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
