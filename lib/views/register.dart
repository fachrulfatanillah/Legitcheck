import 'package:flutter/material.dart';
import 'package:legitcheck/view_models/view_Model_Register.dart';
import 'package:legitcheck/views/loginOrRegister.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void register() {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    ViewModelRegister viewModel =
        ViewModelRegister(username, email, password, confirmPassword, context);

    viewModel.register(username, email, password, confirmPassword);
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginOrRegisterPage()),
              );
            },
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
        body: Column(
          children: [
            Container(
                width: bodyWidth,
                height: bodyHeight,
                color: Colors.black,
                child: Stack(
                  children: [
                    Container(
                      width: bodyWidth,
                      height: bodyHeight * 0.38,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "images/default_logo.png",
                              width: bodyWidth,
                              height: bodyHeight * 0.25,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: bodyWidth,
                              height: bodyHeight * 0.6,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFF1E1E1E),
                                      Color.fromARGB(255, 198, 198, 198),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                      color: Colors.white, width: 1.5)),
                              child: Column(
                                children: [
                                  Container(
                                    width: bodyWidth,
                                    height: bodyHeight * 0.08,
                                    child: Center(
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: bodyWidth * 0.8,
                                    height: bodyHeight * 0.5,
                                    // color: Color.fromARGB(55, 77, 255, 7),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: bodyWidth,
                                          height: bodyHeight * 0.035,
                                          // color: Color.fromARGB(55, 77, 255, 7),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "Username :",
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
                                            controller: _usernameController,
                                            autocorrect: false,
                                            autofocus: false,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Color.fromARGB(
                                                  255, 217, 217, 217),
                                              contentPadding:
                                                  EdgeInsets.all(10.0),
                                              hintStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 35, 35, 35),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: BorderSide.none,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: BorderSide(
                                                    color: Colors
                                                        .black), // Warna border saat terfokus
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: bodyWidth,
                                          height: bodyHeight * 0.035,
                                          // color: Color.fromARGB(55, 77, 255, 7),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                              fillColor: Color.fromARGB(
                                                  255, 217, 217, 217),
                                              contentPadding:
                                                  EdgeInsets.all(10.0),
                                              hintStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 35, 35, 35),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: BorderSide.none,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: BorderSide(
                                                    color: Colors
                                                        .black), // Warna border saat terfokus
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: bodyWidth,
                                          height: bodyHeight * 0.035,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                            obscureText: _obscureText,
                                            autocorrect: false,
                                            autofocus: false,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Color.fromARGB(
                                                  255, 217, 217, 217),
                                              contentPadding: EdgeInsets.all(
                                                  10.0), // Menambahkan content padding di sini
                                              hintStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 35, 35, 35),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: BorderSide.none,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: BorderSide(
                                                    color: Colors
                                                        .black), // Warna border saat terfokus
                                              ),
                                              // suffixIcon: IconButton(
                                              //   icon: Icon(
                                              //     _obscureText
                                              //         ? Icons.visibility_off
                                              //         : Icons.visibility,
                                              //   ),
                                              //   onPressed: () {
                                              //     setState(() {
                                              //       _obscureText =
                                              //           !_obscureText;
                                              //     });
                                              //   },
                                              // ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: bodyWidth,
                                          height: bodyHeight * 0.035,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "Verification Password :",
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
                                            controller:
                                                _confirmPasswordController,
                                            obscureText: _obscureText,
                                            autocorrect: false,
                                            autofocus: false,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Color.fromARGB(
                                                  255, 217, 217, 217),
                                              contentPadding: EdgeInsets.all(
                                                  10.0), // Menambahkan content padding di sini
                                              hintStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 35, 35, 35),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: BorderSide.none,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: BorderSide(
                                                    color: Colors
                                                        .black), // Warna border saat terfokus
                                              ),
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  _obscureText
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    _obscureText =
                                                        !_obscureText;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: bodyWidth,
                                          height: bodyHeight * 0.12,
                                          // color: Color.fromARGB(55, 77, 255, 7),
                                          child: Center(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // Aksi yang dilakukan ketika tombol login diklik
                                                register();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                textStyle:
                                                    TextStyle(fontSize: 18),
                                                minimumSize: Size(
                                                    bodyWidth * 0.5,
                                                    bodyHeight * 0.07),
                                                backgroundColor: Colors.black,
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
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
