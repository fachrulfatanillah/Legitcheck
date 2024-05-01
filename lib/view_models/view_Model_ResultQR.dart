import 'package:flutter/material.dart';

class ViewModelResultQR extends ChangeNotifier {
  bool condition = false;

  Future<void> checkCondition() async {
    // await Future.delayed(Duration(seconds: 1));
    condition = true;
    notifyListeners();
  }
}
