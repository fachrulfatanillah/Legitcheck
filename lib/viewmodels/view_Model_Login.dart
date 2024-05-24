import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:legitcheck/models/model_User.dart';
import 'package:legitcheck/viewmodels/view_Model_Functions.dart';
import 'package:legitcheck/viewmodels/view_Model_User.dart';
import 'package:legitcheck/views/splash_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewModelLogin extends ChangeNotifier {
  String _email;
  String _password;
  BuildContext _context;

  ViewModelLogin(this._email, this._password, this._context);

  Future<void> login(String email, String password) async {
    try {
      UserGet userRepository = UserGet();

      List<User> users = await userRepository.getUsers();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final encryptionService = EncryptionService();
      final encryptedData = encryptionService.encrypt(_password);

      bool isValidCredentials = false;
      for (var user in users) {
        if (user.email == _email && user.password == encryptedData) {
          final myMapSprefs = jsonEncode({
            'id': user.id,
            'email': user.email,
            'username': user.username,
            'password': user.password,
            'auth_Expired':
                DateTime.now().add(Duration(days: 7)).toIso8601String(),
          });
          prefs.setString('authData', myMapSprefs);

          isValidCredentials = true;
          break;
        }
      }

      if (isValidCredentials) {
        Navigator.pushReplacement(
          _context,
          MaterialPageRoute(builder: (context) => SplashScreen()),
        );
      } else {
        return showDialog(
          context: _context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 23, 23, 23),
              title: null,
              content: Text('Email or password is incorrect.',
                  style: TextStyle(color: Colors.white)),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Text('Close', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }
}
