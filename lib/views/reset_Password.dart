import 'package:flutter/material.dart';
import 'package:legitcheck/viewmodels/view_Model_Authentications.dart';

class ResetPasswordPage extends StatefulWidget {
  final String user_id;
  final String email;
  const ResetPasswordPage(
      {Key? key, required this.user_id, required this.email});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool _obscureText = true;
  bool isLoading = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void resetPassword() {
    setState(() {
      isLoading = true;
      FocusScope.of(context).unfocus();
    });
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;
    Authentications authentications = Authentications();
    authentications.resetPasword(
        widget.user_id, widget.email, password, confirmPassword, context);

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        isLoading = false;
      });
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
                      height: bodyHeight * 0.6,
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
                                "Reset Password",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            width: bodyWidth * 0.8,
                            height: bodyHeight * 0.54,
                            child: Column(
                              children: [
                                Container(
                                  height: bodyHeight * 0.05,
                                  width: bodyWidth * 0.9,
                                  // color: Colors.green,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 0.0),
                                      child: Text(
                                        "Email",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: bodyHeight * 0.06,
                                  width: bodyWidth * 0.9,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(0, 158, 158, 158),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 126, 126, 126),
                                      width: 1,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        widget.email,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: bodyWidth,
                                  height: bodyHeight * 0.035,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          "New Password ",
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
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: bodyWidth,
                                  height: bodyHeight * 0.035,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          "Verification Password",
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
                                    controller: _confirmPasswordController,
                                    obscureText: _obscureText,
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
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.white,
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
                                  height: bodyHeight * 0.12,
                                  child: Center(
                                    child: ElevatedButton(
                                      onPressed:
                                          isLoading ? null : resetPassword,
                                      style: ElevatedButton.styleFrom(
                                        textStyle: TextStyle(fontSize: 18),
                                        minimumSize: Size(
                                            bodyWidth * 0.5, bodyHeight * 0.07),
                                        backgroundColor: Colors.black,
                                        side: BorderSide(
                                          color: Colors.white, // Warna border
                                          width: 2.0, // Ukuran lebar border
                                        ),
                                      ),
                                      child: isLoading
                                          ? CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : Text(
                                              'Reset Password',
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
                    Container(
                      width: bodyWidth * 0.9,
                      height: bodyHeight * 0.4,
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
