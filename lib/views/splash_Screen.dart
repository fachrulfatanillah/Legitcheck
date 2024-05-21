// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legitcheck/viewmodels/view_Model_Splash_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ViewModelSplash viewModelSplash = ViewModelSplash();
    viewModelSplash.getDataUser(context);
    viewModelSplash.checkInternetConnection(context);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bodyWidth = MediaQuery.of(context).size.width;
    final bodyHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: bodyWidth,
        height: bodyHeight,
        color: Colors.black,
        child: Center(
          child: Image.asset(
            "images/default_logo.png",
            width: bodyWidth,
            height: bodyHeight * 0.3,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
