import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:legitcheck/models/api_config.dart';

class APIConfig {
  static final String baseUrl = '${APIConfigOneTimePassword.baseUrl}';
  static final String token = '${APIConfigOneTimePassword.token}';
}

class Authentication {
  final String id;
  final String user_id;
  final String otp;
  final String date_created_at;
  final String time_created_at;
  final String date_expired_at;
  final String time_expired_at;
  final String status;

  Authentication({
    required this.id,
    required this.user_id,
    required this.otp,
    required this.date_created_at,
    required this.time_created_at,
    required this.date_expired_at,
    required this.time_expired_at,
    required this.status,
  });

  factory Authentication.fromJson(Map<String, dynamic> json) {
    return Authentication(
      id: json['id'],
      user_id: json['user_id'],
      otp: json['otp'],
      date_created_at: json['date_created_at'],
      time_created_at: json['time_created_at'],
      date_expired_at: json['date_expired_at'],
      time_expired_at: json['time_expired_at'],
      status: json['status'],
    );
  }
}

class OtpGet {
  String _baseUrl = APIConfig.baseUrl;
  String _token = APIConfig.token;

  OtpGet();

  Future<List<Authentication>> getAuthentication() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = jsonDecode(response.body);
        List<Authentication> authentication =
            jsonResponse.map((otp) => Authentication.fromJson(otp)).toList();
        return authentication;
      } else {
        throw Exception('Gagal mengambil data pengguna dari API');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }
}

class AuthenticationsPost {
  String _baseUrl = APIConfig.baseUrl;
  String _token = APIConfig.token;

  AuthenticationsPost();

  Future<void> onetimepasswordPost(
      String user_id,
      String email,
      String date_created,
      String time_created,
      String date_expired,
      String time_expired) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        body: jsonEncode({
          'user_id': user_id,
          'email': email,
          'date_created': date_created,
          'time_created': time_created,
          'date_expired': date_expired,
          'time_expired': time_expired,
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

class AuthenticationsUpdate {
  final String _baseUrl = APIConfig.baseUrl;
  final String _token = APIConfig.token;

  AuthenticationsUpdate();

  Future<void> updateOTP(String id) async {
    final url = '$_baseUrl/$id';

    try {
      final response = await http.put(
        Uri.parse(url),
        body: 'status=1',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        print('updated successfully');
      } else {
        print('Error updating: ${response.body}');
      }
    } catch (e) {
      print('Exception while updating: $e');
    }
  }
}
