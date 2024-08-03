import 'package:flutter/material.dart';
import 'package:legitcheck/viewmodels/view_Model_Authentications.dart';
import 'package:legitcheck/views/loginOrRegister.dart';
import 'package:legitcheck/views/register.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool isLoading = false;
  final TextEditingController _emailController = TextEditingController();

  void forgotPassword() {
    setState(() {
      isLoading = true;
      FocusScope.of(context).unfocus();
    });

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        isLoading = false;
      });
      String email = _emailController.text;
      Authentications viewModelForgotPassword = Authentications();
      viewModelForgotPassword.sendOtp(email, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final appBar = AppBar(
      backgroundColor: Colors.black,
      title: Row(
        children: [
          InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              Future.delayed(Duration(milliseconds: 100), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginOrRegisterPage()),
                );
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Row(
              children: [
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final bodyHeight = mediaQueryHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final bodyWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
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
                            "Forgot Password",
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
                            "Enter to your account",
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "Email",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: bodyWidth,
                              height: bodyHeight * 0.06,
                              padding: EdgeInsets.symmetric(),
                              child: TextField(
                                controller: _emailController,
                                autocorrect: false,
                                autofocus: false,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.black,
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 35, 35, 35),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 3.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: bodyWidth,
                              height: bodyHeight * 0.15,
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: isLoading ? null : forgotPassword,
                                  style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(fontSize: 18),
                                    minimumSize: Size(
                                        bodyWidth * 0.5, bodyHeight * 0.07),
                                    backgroundColor: Colors.black,
                                    side: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: isLoading
                                      ? CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text(
                                          'Continue',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            Container(
                              width: bodyWidth,
                              height: bodyHeight * 0.05,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterPage()),
                                        );
                                      },
                                      child: Text(
                                        "SignUp",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
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
    );
  }
}
