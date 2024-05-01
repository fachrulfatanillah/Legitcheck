import 'dart:convert';
import 'package:http/http.dart' as http;

class APIConfig {
  static final String baseUrl = 'https://api.legitcheck.online/user';
  static final String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImZhY2hydXJAZ21haWwuY29tIiwiaWF0IjoxNzE0Mzc2ODYzLCJleHAiOjE3MTY5Njg4NjN9.bGcQZcDVU2mSf1DJtcVWRoTP2j9aWl6LSsqv9mtrT4M';
}

class User {
  final String id;
  final String username;
  final String email;
  final String password;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }
}

class UserGet {
  String _baseUrl = APIConfig.baseUrl;
  String _token = APIConfig.token;

  UserGet();

  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = jsonDecode(response.body);
        List<User> users =
            jsonResponse.map((user) => User.fromJson(user)).toList();
        return users;
      } else {
        throw Exception('Gagal mengambil data pengguna dari API');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }
}

class UserPost {
  String _baseUrl = APIConfig.baseUrl;
  String _token = APIConfig.token;

  UserPost();

  Future<void> registerUser(
      String username, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
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

class UserUpdate {
  final String _baseUrl = APIConfig.baseUrl;
  final String _token = APIConfig.token;

  UserUpdate();

  Future<void> updateUser(String userId, String newPassword) async {
    final url = '$_baseUrl/$userId';

    try {
      final response = await http.put(
        Uri.parse(url),
        body: 'password=$newPassword',
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
