import 'package:flutter/material.dart';
import 'package:legitcheck/views/login.dart';
import 'package:legitcheck/views/register.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  @override
  Widget build(BuildContext context) {
    final bodyHeight = MediaQuery.of(context).size.height;
    final bodyWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        width: bodyWidth,
        height: bodyHeight,
        color: Colors.black,
        child: Center(
          child: Container(
            width: bodyWidth,
            height: bodyHeight * 0.5,
            // color: Colors.amber,
            child: Column(
              children: [
                Container(
                  width: bodyWidth,
                  height: bodyHeight * 0.3,
                  // color: Colors.green,
                  child: Center(
                    child: Image.asset(
                      "images/default_logo.png",
                      width: bodyWidth,
                      height: bodyHeight * 0.25,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  width: bodyWidth,
                  height: bodyHeight * 0.08,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 18),
                        minimumSize: Size(bodyWidth * 0.6, bodyHeight * 0.065),
                        backgroundColor: Color(0xC9C9C9),
                        side: BorderSide(color: Colors.white, width: 1.5),
                      ),
                      child: Text(
                        'Login',
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
                  height: bodyHeight * 0.075,
                  // color: Colors.grey,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 18),
                        minimumSize: Size(bodyWidth * 0.6, bodyHeight * 0.065),
                        backgroundColor: Color(0xC9C9C9),
                        side: BorderSide(color: Colors.white, width: 1.5),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
