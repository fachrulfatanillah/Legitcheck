import 'package:flutter/material.dart';
import 'package:legitcheck/view_models/view_Model_Login.dart';
import 'package:legitcheck/views/loginOrRegister.dart';
import 'package:legitcheck/views/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() {
    setState(() {
      isLoading = true;
      FocusScope.of(context).unfocus();
    });

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        isLoading = false;
      });
      String email = _emailController.text;
      String password = _passwordController.text;

      ViewModelLogin viewModel = ViewModelLogin(email, password, context);

      viewModel.login(email, password);
    });
    // String email = _emailController.text;
    // String password = _passwordController.text;

    // ViewModelLogin viewModel = ViewModelLogin(email, password, context);

    // viewModel.login(email, password);
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
                  height: bodyHeight * 0.5,
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //   color: Colors.white,
                  //   width: 2.0,
                  // )),
                  child: Column(
                    children: [
                      Container(
                        width: bodyWidth,
                        height: bodyHeight * 0.05,
                        // color: Colors.amber,
                        child: Center(
                          child: Text(
                            "LOGIN",
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
                        // color: Colors.amber,
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
                        height: bodyHeight * 0.39,
                        // color: Color.fromARGB(55, 77, 255, 7),
                        child: Column(
                          children: [
                            Container(
                              width: bodyWidth,
                              height: bodyHeight * 0.05,
                              // color: Color.fromARGB(55, 77, 255, 7),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "Email :",
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
                              height: bodyHeight * 0.05,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "Password :",
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
                                controller: _passwordController,
                                obscureText:
                                    _obscureText, // Untuk menyembunyikan teks saat mengetik
                                autocorrect: false,
                                autofocus: false,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors
                                      .black, // Warna latar belakang hitam
                                  contentPadding: EdgeInsets.all(
                                      10.0), // Memberikan padding konten
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 35, 35,
                                        35), // Warna placeholder/hint
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
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility, // Ikon mata
                                      color: Colors.white, // Warna ikon putih
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: bodyWidth,
                              height: bodyHeight * 0.11,
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: isLoading ? null : login,
                                  style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(fontSize: 18),
                                    minimumSize: Size(
                                        bodyWidth * 0.5, bodyHeight * 0.07),
                                    backgroundColor: Colors.black,
                                    side: BorderSide(
                                      color: Colors.white, // Warna border
                                      width: 2, // Lebar border
                                    ),
                                  ),
                                  child: isLoading
                                      ? CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text(
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
                              height: bodyHeight * 0.05,
                              // color: Colors.amber,
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
                  height: bodyHeight * 0.5,
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
