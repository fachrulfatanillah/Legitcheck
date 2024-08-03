import 'dart:async';

import 'package:flutter/material.dart';
import 'package:legitcheck/viewmodels/view_Model_Authentications.dart';
import 'package:pinput/pinput.dart';

class AuthenticationPage extends StatefulWidget {
  final String user_id;
  final String email;

  const AuthenticationPage(
      {Key? key, required this.user_id, required this.email});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  int _counter = 100;
  late Timer _timer;
  bool isExpired = false;
  bool isLoading = false;
  final TextEditingController _pinController = TextEditingController();

  void authnticationPin(String pin) {
    setState(() {
      isLoading = true;
      FocusScope.of(context).unfocus();
    });
    Authentications authentications = Authentications();
    authentications.checkOtp(widget.user_id, widget.email, pin, context);
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {});
      _pinController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          timer.cancel();
          isExpired = true;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pinController.dispose();
    super.dispose();
  }

  void resetTimer() {
    setState(() {
      Authentications authentications = Authentications();
      authentications.reSendOtp(widget.user_id, widget.email, context);
      isExpired = false;
      _counter = 100;
      _pinController.clear();
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    final appBar = AppBar(
      backgroundColor: Colors.black,
    );

    final bodyHeight = mediaQueryHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final bodyWidth = MediaQuery.of(context).size.width;

    final defaultPinTheme = PinTheme(
        textStyle: TextStyle(fontSize: 18, color: Colors.white),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color.fromARGB(255, 144, 144, 144))));

    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: appBar,
            body: Container(
                width: bodyWidth,
                height: bodyHeight,
                color: Colors.black,
                child: Column(
                  children: [
                    Container(
                      width: bodyWidth * 0.9,
                      height: bodyHeight * 0.55,
                      child: Column(
                        children: [
                          Container(
                            width: bodyWidth,
                            height: bodyHeight * 0.05,
                            child: Center(
                              child: Text(
                                "Authentication",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            width: bodyWidth,
                            height: bodyHeight * 0.05,
                            child: Center(
                              child: Text(
                                "Enter your verification code",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            width: bodyWidth * 0.8,
                            height: bodyHeight * 0.44,
                            child: Column(
                              children: [
                                Container(
                                  width: bodyWidth,
                                  height: bodyHeight * 0.05,
                                ),
                                Container(
                                    width: bodyWidth,
                                    height: bodyHeight * 0.06,
                                    padding: EdgeInsets.symmetric(),
                                    child: Pinput(
                                      controller: _pinController,
                                      length: 4,
                                      defaultPinTheme: defaultPinTheme,
                                      focusedPinTheme: defaultPinTheme.copyWith(
                                          decoration: defaultPinTheme
                                              .decoration!
                                              .copyWith(
                                                  border: Border.all(
                                                      color: Colors.white))),
                                      onCompleted: (pin) =>
                                          authnticationPin(pin),
                                    )),
                                Container(
                                    width: bodyWidth,
                                    height: bodyHeight * 0.15,
                                    child: Center(
                                      child: isExpired
                                          ? TextButton(
                                              onPressed: () {
                                                resetTimer();
                                              },
                                              child: Text(
                                                "Resend OTP",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor: Colors.white,
                                                ),
                                              ),
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Expired OTP ",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  "$_counter",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    decorationColor:
                                                        Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  "s",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    decorationColor:
                                                        Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: bodyWidth * 0.9,
                      height: bodyHeight * 0.45,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: bodyWidth * 0.4,
                              height: bodyHeight * 0.3,
                              child: Image.asset(
                                "images/default_logo.png",
                                width: bodyWidth,
                                height: bodyHeight * 0.25,
                                fit: BoxFit.contain,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
