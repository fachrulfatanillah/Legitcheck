import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:legitcheck/view_models/view_Model_Profile.dart';
import 'package:legitcheck/views/bottom_NavBar.dart';
import 'package:legitcheck/views/loginOrRegister.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewModelSplash extends ChangeNotifier {
  String user_id = '';
  String user_username = '';
  String user_email = '';
  String user_password = '';
  String user_authExpired = '';
  DateTime parsedAuthExpired = DateTime(0);

  Future<void> getDataUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('authData');

    Map<String, dynamic>? myData =
        jsonString != null ? json.decode(jsonString) : null;

    user_id = myData?['id'] ?? '';
    user_username = myData?['username'] ?? '';
    user_email = myData?['email'] ?? '';
    user_password = myData?['password'] ?? '';
    user_authExpired = myData?['auth_Expired'] ?? '';
    parsedAuthExpired = DateTime.parse(user_authExpired);
    Provider.of<ViewModelProfile>(context, listen: false)
        .getDataUserProfile(user_id, user_username, user_email, user_password);
    notifyListeners();
  }

  Future<void> checkInternetConnection(BuildContext context) async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (parsedAuthExpired.isAfter(DateTime.now())) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => BottomNavBar()),
          );
        });
      } else {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const LoginOrRegisterPage()),
          );
        });
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Internet Connection Failed'),
            content: Text('Please check your internet connection.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  checkInternetConnection(context); // Perbarui dengan context
                },
                child: Text('Try Again'),
              ),
            ],
          );
        },
      );
    }
  }
}
