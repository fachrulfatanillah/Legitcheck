import 'package:flutter/material.dart';
import 'package:legitcheck/view_models/view_Model_Profile.dart';
import 'package:provider/provider.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool _obscureText = true;

  final TextEditingController _oldController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _verifypasswordController =
      TextEditingController();

  void saveChangePassword(BuildContext context) {
    String userId = Provider.of<ViewModelProfile>(context, listen: false).id;
    String userPassword =
        Provider.of<ViewModelProfile>(context, listen: false).password;
    String oldPassword = _oldController.text;
    String newPassword = _newPasswordController.text;
    String verifyPassword = _verifypasswordController.text;

    ViewModelProfile viewModelProfile = ViewModelProfile();
    viewModelProfile.changePassword(userId, userPassword, oldPassword,
        newPassword, verifyPassword, context);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final appBar = AppBar(
      title: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context, 2);
            },
            child: Row(
              children: [
                SizedBox(width: 10),
                Icon(Icons.arrow_back),
                Text("Back"),
              ],
            ),
          ),
        ],
      ),
    );

    final bodyHeight = mediaQueryHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    // print(MediaQuery.of(context).padding.top);

    final bodyWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: appBar,
            body: Container(
              height: bodyHeight,
              width: bodyWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Color(0xFF1E1E1E),
                    Colors.white,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: bodyHeight * 0.15 - 24,
                    width: bodyWidth * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: bodyHeight * 0.05,
                          width: bodyWidth * 0.9,
                          // color: Colors.amber,
                          child: Center(
                            child: Text(
                              "CHANGE PASSWORD",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: bodyHeight * 0.1,
                    width: bodyWidth * 0.9,
                    // color: Colors.amber,
                    child: Text(
                      "Your Password must be at least 6 characters and should include a combination of numbers, letters and special characters",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    height: bodyHeight * 0.08,
                    width: bodyWidth * 0.9,
                    // color: const Color.fromARGB(255, 7, 205, 255),
                    child: Center(
                      child: TextField(
                        controller: _oldController,
                        obscureText: true,
                        autocorrect: false,
                        autofocus: false,
                        decoration: InputDecoration(
                          filled: true,
                          // fillColor: Color.fromARGB(255, 217, 217, 217),
                          fillColor: const Color.fromARGB(255, 198, 198, 198),
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Current Password',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 101, 101, 101),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color:
                                    Colors.black), // Warna border saat terfokus
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: bodyHeight * 0.08,
                    width: bodyWidth * 0.9,
                    child: Center(
                      child: TextField(
                        controller: _newPasswordController,
                        obscureText: _obscureText,
                        autocorrect: false,
                        autofocus: false,
                        decoration: InputDecoration(
                          filled: true,
                          // fillColor: Color.fromARGB(255, 217, 217, 217),
                          fillColor: const Color.fromARGB(255, 198, 198, 198),
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'New Password',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 101, 101, 101),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: bodyHeight * 0.08,
                    width: bodyWidth * 0.9,
                    // color: const Color.fromARGB(255, 7, 205, 255),
                    child: Center(
                      child: TextField(
                        controller: _verifypasswordController,
                        obscureText: _obscureText,
                        autocorrect: false,
                        autofocus: false,
                        decoration: InputDecoration(
                          filled: true,
                          // fillColor: Color.fromARGB(255, 217, 217, 217),
                          fillColor: const Color.fromARGB(255, 198, 198, 198),
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Veryfy Password',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 101, 101, 101),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color:
                                    Colors.black), // Warna border saat terfokus
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: bodyWidth,
                    height: bodyHeight * 0.1,
                    // color: Color.fromARGB(55, 77, 255, 7),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          saveChangePassword(context);
                        },
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 18),
                          minimumSize: Size(bodyWidth * 0.4, bodyHeight * 0.06),
                          backgroundColor: Colors.black,
                        ),
                        child: Text(
                          'Save',
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
            )));
  }
}
