import 'package:flutter/material.dart';
import 'package:legitcheck/viewmodels/view_Model_Profile.dart';
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
      backgroundColor: Colors.black,
      title: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context, 2);
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
            body: Container(
              height: bodyHeight,
              width: bodyWidth,
              color: Colors.black,
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
                          child: Center(
                            child: Text(
                              "CHANGE PASSWORD",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: bodyHeight * 0.1,
                    width: bodyWidth * 0.9,
                    child: Text(
                      "Your Password must be at least 6 characters and should include a combination of numbers, letters and special characters",
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    height: bodyHeight * 0.08,
                    width: bodyWidth * 0.9,
                    child: Center(
                      child: TextField(
                        controller: _oldController,
                        obscureText: true,
                        autocorrect: false,
                        autofocus: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(0, 198, 198, 198),
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Current Password',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
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
                                    const Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
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
                          fillColor: Color.fromARGB(0, 198, 198, 198),
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'New Password',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
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
                                    const Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: bodyHeight * 0.08,
                    width: bodyWidth * 0.9,
                    child: Center(
                      child: TextField(
                        controller: _verifypasswordController,
                        obscureText: _obscureText,
                        autocorrect: false,
                        autofocus: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(0, 198, 198, 198),
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Veryfy Password',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
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
                                    const Color.fromARGB(255, 244, 244, 244)),
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
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: bodyWidth,
                    height: bodyHeight * 0.1,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          saveChangePassword(context);
                        },
                        style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 18),
                            minimumSize:
                                Size(bodyWidth * 0.4, bodyHeight * 0.06),
                            backgroundColor: Colors.black,
                            side: BorderSide(color: Colors.white)),
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
