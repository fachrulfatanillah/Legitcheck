import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legitcheck/viewmodels/view_Model_Profile.dart';
import 'package:legitcheck/viewmodels/view_Model_SnackBar.dart';
import 'package:legitcheck/views/about.dart';
import 'package:legitcheck/views/change_Password.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ViewModelProfile _viewModelProfile = ViewModelProfile();
  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    final bodyWidth = MediaQuery.of(context).size.width;
    final bodyHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: () async {
          final now = DateTime.now();
          final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
              lastPressed == null ||
                  now.difference(lastPressed!) > Duration(seconds: 2);

          if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
            lastPressed = now;
            final snack = ShowSnackBar();
            snack.showTopSnackBar(context, 'Press back again to exit');
            return false;
          }
          SystemNavigator.pop();
          return true;
        },
        child: Scaffold(
          body: Container(
            height: bodyHeight,
            width: bodyWidth,
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  height: bodyHeight * 0.05,
                  width: bodyWidth * 0.9,
                ),
                Container(
                  height: bodyHeight * 0.15,
                  width: bodyWidth * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: bodyHeight * 0.05,
                        width: bodyWidth * 0.9,
                        child: Center(
                          child: Text(
                            "PROFILE",
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
                  height: bodyHeight * 0.15,
                  width: bodyWidth * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: bodyWidth * 0.28,
                        height: bodyHeight * 0.15,
                        child: Center(
                          child: Container(
                            width: bodyWidth * 0.2,
                            height: bodyHeight * 0.09,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 136, 136, 136),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: bodyWidth * 0.61,
                        height: bodyHeight * 0.15,
                        child: Column(
                          children: [
                            Container(
                              height: bodyHeight * 0.07,
                              width: bodyWidth * 0.60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: bodyWidth * 0.60,
                                    height: bodyHeight * 0.04,
                                    child: Text(
                                      Provider.of<ViewModelProfile>(context)
                                          .username,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: bodyHeight * 0.07,
                              width: bodyWidth * 0.60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: bodyWidth * 0.60,
                                    height: bodyHeight * 0.04,
                                    child: Text(
                                      Provider.of<ViewModelProfile>(context)
                                          .email,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: bodyHeight * 0.03,
                  width: bodyWidth * 0.9,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePasswordPage()),
                    );
                  },
                  child: Container(
                    height: bodyHeight * 0.08,
                    width: bodyWidth * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: bodyHeight * 0.08,
                          width: bodyWidth * 0.25,
                          child: Icon(
                            Icons.shield_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          height: bodyHeight * 0.08,
                          width: bodyWidth * 0.64,
                          child: Center(
                            child: Container(
                              height: bodyHeight * 0.03,
                              width: bodyWidth * 0.64,
                              child: Text(
                                "Change Password",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: bodyHeight * 0.015,
                  width: bodyWidth * 0.9,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutPage()),
                    );
                  },
                  child: Container(
                    height: bodyHeight * 0.08,
                    width: bodyWidth * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: bodyHeight * 0.08,
                          width: bodyWidth * 0.25,
                          child: Icon(
                            Icons.help_outline_outlined,
                            size: 33,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                            height: bodyHeight * 0.08,
                            width: bodyWidth * 0.64,
                            // color: Color.fromARGB(255, 6, 145, 38),
                            child: Center(
                              child: Container(
                                height: bodyHeight * 0.03,
                                width: bodyWidth * 0.64,
                                // color: Colors.white,
                                child: Text(
                                  "About",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: bodyHeight * 0.04,
                  width: bodyWidth * 0.9,
                  // color: Colors.amber,
                ),
                Container(
                  height: bodyHeight * 0.07,
                  width: bodyWidth * 0.9,
                  // color: Colors.amber,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _viewModelProfile.logout(context);
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 18),
                        minimumSize: Size(bodyWidth * 0.4, bodyHeight * 0.06),
                        backgroundColor: Colors.black,
                        side: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        'Logout',
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
        ));
  }
}
