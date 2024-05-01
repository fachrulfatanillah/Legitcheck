// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:legitcheck/view_models/view_Model_Profile.dart';
import 'package:legitcheck/views/change_Password.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // String username = '';
  // String email = '';
  final ViewModelProfile _viewModelProfile = ViewModelProfile();

  @override
  // void initState() {
  //   super.initState();
  //   _viewModelProfile.loadUserData();
  // }

  // Future<void> loadUserData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? jsonString = prefs.getString('authData');

  //   if (jsonString != null) {
  //     Map<String, dynamic> userData = json.decode(jsonString);
  //     setState(() {
  //       username = userData['username'];
  //       email = userData['email'];
  //     });
  //   }
  // }

  Widget build(BuildContext context) {
    final bodyWidth = MediaQuery.of(context).size.width;
    final bodyHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
              height: bodyHeight * 0.05,
              width: bodyWidth * 0.9,
            ),
            Container(
              height: bodyHeight * 0.15,
              width: bodyWidth * 0.9,
              // color: Colors.amber,
              // color: Colors.grey,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(10),
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: bodyHeight * 0.05,
                    width: bodyWidth * 0.9,
                    // color: Colors.amber,
                    child: Center(
                      child: Text(
                        "PROFILE",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
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
                // color: Color(0x31363B),
                color: Colors.grey,
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
                        height: bodyHeight * 0.10,
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
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: bodyWidth * 0.60,
                                height: bodyHeight * 0.04,
                                // color: Colors.white,
                                child: Text(
                                  // "Username",
                                  Provider.of<ViewModelProfile>(context)
                                      .username,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: bodyHeight * 0.07,
                          width: bodyWidth * 0.60,
                          // color: const Color.fromARGB(255, 33, 243, 72),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: bodyWidth * 0.60,
                                height: bodyHeight * 0.04,
                                // color: Colors.white,
                                child: Text(
                                  // "Username@gmail.com",
                                  Provider.of<ViewModelProfile>(context).email,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
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
              // color: Colors.amber,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                );
              }, //change password
              child: Container(
                height: bodyHeight * 0.08,
                width: bodyWidth * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  color: Colors.grey,
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
                              color: Colors.black,
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
              // color: Colors.amber,
            ),
            Container(
              height: bodyHeight * 0.08,
              width: bodyWidth * 0.9,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    height: bodyHeight * 0.08,
                    width: bodyWidth * 0.25,
                    // color: const Color.fromARGB(255, 145, 6, 6),
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
                            "Help",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ))
                ],
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
                  ),
                  child: Text(
                    'Log Out',
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
    );
  }
}
