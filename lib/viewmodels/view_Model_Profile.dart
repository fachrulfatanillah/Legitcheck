import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:legitcheck/models/model_User.dart';
import 'package:legitcheck/viewmodels/view_Model_Functions.dart';
import 'package:legitcheck/views/loginOrRegister.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordValidator {
  static bool isValidPassword(String password) {
    RegExp regex = RegExp(
        r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}|":<>?])[A-Za-z\d!@#$%^&*()_+{}|":<>?]{8,}$');
    return regex.hasMatch(password);
  }
}

class ViewModelProfile extends ChangeNotifier {
  String id = '';
  String username = '';
  String email = '';
  String password = '';

  Future<void> updateUserPasswordRef(String newPassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? jsonString = prefs.getString('authData');

    if (jsonString != null) {
      Map<String, dynamic> myMap = json.decode(jsonString);

      myMap['password'] = newPassword;

      String updatedJsonString = jsonEncode(myMap);

      await prefs.setString('authData', updatedJsonString);

      print('Password berhasil diupdate.');
    } else {
      print('Data tidak ditemukan.');
    }
  }

  Future<void> changePassword(
      String userId,
      String userPassword,
      String oldPassword,
      String newPassword,
      String verifyPassword,
      BuildContext context) async {
    final encryptionService = EncryptionService();
    final encryptedData_oldPassword = encryptionService.encrypt(oldPassword);

    if (oldPassword.isEmpty || newPassword.isEmpty || verifyPassword.isEmpty) {
      return showDialog(
        context: context,
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

    if (userPassword != encryptedData_oldPassword) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 23, 23, 23),
            title: null,
            content: Text('Incorrect Password',
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

    if (newPassword != verifyPassword) {
      return showDialog(
        context: context,
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

    if (!PasswordValidator.isValidPassword(newPassword)) {
      return showDialog(
        context: context,
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
    try {
      final encryptedData = encryptionService.encrypt(newPassword);

      UserUpdate userUpdate = UserUpdate();
      await userUpdate.updateUser(userId, encryptedData);

      updateUserPasswordRef(encryptedData);

      password = encryptedData;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonString = prefs.getString('authData');

      Map<String, dynamic>? myData =
          jsonString != null ? json.decode(jsonString) : null;
      Provider.of<ViewModelProfile>(context, listen: false).getDataUserProfile(
          myData?['id'] ?? '',
          myData?['username'] ?? '',
          myData?['email'] ?? '',
          myData?['password'] ?? '');
      notifyListeners();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 23, 23, 23),
            title: null,
            content: Text(
              'Change Password Successful',
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context, 2);
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

  void getDataUserProfile(dataId, dataUsername, dataEmail, dataPassword) {
    id = dataId;
    username = dataUsername;
    email = dataEmail;
    password = dataPassword;
    notifyListeners();
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('authData');

    if (jsonString != null) {
      Map<String, dynamic> userData = json.decode(jsonString);
      username = userData['username'];
      email = userData['email'];
      notifyListeners();
    }
  }

  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('authData');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => LoginOrRegisterPage()),
    );
  }
}
