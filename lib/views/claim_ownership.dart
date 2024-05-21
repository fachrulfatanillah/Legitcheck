import 'package:flutter/material.dart';
import 'package:legitcheck/viewmodels/view_Model_ClaimOwnership.dart';
import 'package:legitcheck/viewmodels/view_Model_Profile.dart';
import 'package:provider/provider.dart';

class ClaimOwnershipPage extends StatefulWidget {
  final String dataDecrypted;
  const ClaimOwnershipPage(this.dataDecrypted, {Key? key}) : super(key: key);

  @override
  State<ClaimOwnershipPage> createState() => _ClaimOwnershipPageState();
}

class _ClaimOwnershipPageState extends State<ClaimOwnershipPage> {
  bool _obscureText = true;
  bool isLoading = false;
  final TextEditingController _passwordController = TextEditingController();

  void claimNow() {
    setState(() {
      isLoading = true;
      FocusScope.of(context).unfocus();
    });

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        isLoading = false;
      });
      String password = _passwordController.text;
      ViewModelClaimNow viewModel = ViewModelClaimNow();
      viewModel.claimOwnership(password, widget.dataDecrypted, context);
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
              Future.delayed(Duration(milliseconds: 160), () {
                Navigator.pop(context, 2);
              });
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
                    height: bodyHeight * 0.05,
                    width: bodyWidth * 0.9,
                    child: Center(
                      child: Text(
                        "CLAIM OWNERSHIP",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: bodyHeight * 0.03,
                    width: bodyWidth * 0.9,
                  ),
                  Container(
                    height: bodyHeight * 0.9,
                    width: bodyWidth * 0.9,
                    child: Column(
                      children: [
                        Container(
                          height: bodyHeight * 0.05,
                          width: bodyWidth * 0.9,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Text(
                                "Your Email",
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
                              color: Color.fromARGB(255, 95, 95, 95),
                              width: 1,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                Provider.of<ViewModelProfile>(context).email,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: bodyHeight * 0.05,
                          width: bodyWidth * 0.9,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Text(
                                "Password",
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
                          child: TextField(
                            controller: _passwordController,
                            obscureText: _obscureText,
                            autocorrect: false,
                            autofocus: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(0, 158, 158, 158),
                              contentPadding: EdgeInsets.all(10.0),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 72, 72, 72),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255)),
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
                          height: bodyHeight * 0.15,
                          width: bodyWidth * 0.9,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: isLoading ? null : claimNow,
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 18),
                                minimumSize:
                                    Size(bodyWidth * 0.5, bodyHeight * 0.07),
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
                                      'Claim Now',
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
                  )
                ],
              ),
            )));
  }
}
