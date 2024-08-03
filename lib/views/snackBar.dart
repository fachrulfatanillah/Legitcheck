import 'package:flutter/material.dart';

class TopSnackBar extends StatelessWidget {
  final String message;

  TopSnackBar({required this.message});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        // margin: EdgeInsets.only(top: 35.0),
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 28.0),
        color: Colors.black,
        child: Center(
          child: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
