import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  String username = '';
  String email = '';

  void updateData(dataUsername, dataEmail) {
    username = dataUsername;
    email = dataEmail;
    notifyListeners();
  }
}
