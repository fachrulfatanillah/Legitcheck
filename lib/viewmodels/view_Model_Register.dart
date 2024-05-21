import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:legitcheck/models/model_User.dart';
import 'package:legitcheck/viewmodels/view_Model_Functions.dart';
import 'package:legitcheck/views/splash_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailValidator {
  static bool isValidEmail(String email) {
    RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }
}

class PasswordValidator {
  static bool isValidPassword(String password) {
    RegExp regex = RegExp(
        r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}|":<>?])[A-Za-z\d!@#$%^&*()_+{}|":<>?]{8,}$');
    return regex.hasMatch(password);
  }
}

class ViewModelRegister extends ChangeNotifier {
  String username;
  String _email;
  String _password;
  String _confirmPassword;
  BuildContext _context;

  ViewModelRegister(this.username, this._email, this._password,
      this._confirmPassword, this._context);

  Future<void> register(String username, String email, String password,
      String confirmPassword) async {
    try {
      UserGet userRepository = UserGet();

      List<User> users = await userRepository.getUsers();

      bool isEmailRegistered = false;
      for (var user in users) {
        if (user.email == _email) {
          isEmailRegistered = true;
          break;
        }
      }

      if (username.isEmpty ||
          email.isEmpty ||
          password.isEmpty ||
          confirmPassword.isEmpty) {
        return showDialog(
          context: _context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 23, 23, 23),
              title: null,
              content: Text('Column cannot be empty',
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

      if (!EmailValidator.isValidEmail(email)) {
        return showDialog(
          context: _context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 23, 23, 23),
              title: null,
              content: Text('Email does not match',
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

      if (isEmailRegistered) {
        return showDialog(
          context: _context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 23, 23, 23),
              title: null,
              content: Text('Email is registered',
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

      if (_password != _confirmPassword) {
        return showDialog(
          context: _context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 23, 23, 23),
              title: null,
              content: Text('Password does not match',
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

      if (!PasswordValidator.isValidPassword(password)) {
        return showDialog(
          context: _context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 23, 23, 23),
              title: null,
              content: Text(
                'Password must contain at least 1 uppercase letter, 1 number, and 1 special character.',
                style: TextStyle(color: Colors.white),
              ),
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
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final encryptionService = EncryptionService();
      final encryptedData = encryptionService.encrypt(password);

      UserPost userPost = UserPost();
      await userPost.registerUser(username, email, encryptedData);

      UserGet userRepository = UserGet();
      List<User> users = await userRepository.getUsers();

      for (var user in users) {
        if (user.email == email && user.password == encryptedData) {
          final myMapSprefs = jsonEncode({
            'id': user.id,
            'email': user.email,
            'username': user.username,
            'password': user.password,
            'auth_Expired':
                DateTime.now().add(Duration(days: 7)).toIso8601String(),
          });
          prefs.setString('authData', myMapSprefs);

          break;
        }
      }

      showDialog(
        context: _context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 23, 23, 23),
            title: null,
            content: Text(
              'Registration successful',
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    _context,
                    MaterialPageRoute(builder: (context) => SplashScreen()),
                  );
                },
                child: Center(
                  child: Text('Oke', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('Error registering user: $e');
    }
  }
}
