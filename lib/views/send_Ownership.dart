import 'package:flutter/material.dart';
import 'package:legitcheck/viewmodels/view_Model_Profile.dart';
import 'package:legitcheck/viewmodels/view_Model_Send_Ownership.dart';
import 'package:provider/provider.dart';

class SendOwnershipPage extends StatefulWidget {
  final Map<String, String> product;
  const SendOwnershipPage({Key? key, required this.product}) : super(key: key);

  @override
  State<SendOwnershipPage> createState() => _SendOwnershipPageState();
}

class _SendOwnershipPageState extends State<SendOwnershipPage> {
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  bool _obscureText = true;
  bool isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _focusScopeNode.dispose();
    super.dispose();
  }

  void send() {
    setState(() {
      isLoading = true;
      _focusScopeNode.unfocus();
    });

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        isLoading = false;
      });
      String id = widget.product['id']!;
      String qrcode_id = widget.product['qrcode_id']!;
      String email = _emailController.text;
      String password = _passwordController.text;
      String userPassword =
          Provider.of<ViewModelProfile>(context, listen: false).password;
      ViewModelSendOwnership vmSend = ViewModelSendOwnership();
      vmSend.sendOwnership(
          id, qrcode_id, email, password, userPassword, context);
      FocusScope.of(context).unfocus();
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
              height: bodyHeight,
              width: bodyWidth,
              color: Colors.black,
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //     colors: [
              //       Colors.white,
              //       Color(0xFF1E1E1E),
              //       Colors.white,
              //     ],
              //   ),
              // ),
              child: Column(
                children: [
                  Container(
                    height: bodyHeight * 0.05,
                    width: bodyWidth * 0.9,
                    // color: const Color.fromARGB(255, 7, 255, 123),
                    child: Center(
                      child: Text(
                        "SEND OWNERSHIP",
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
                    // color: Colors.amber,
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
                          // color: Colors.green,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Text(
                                "Recipient email",
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
                            controller: _emailController,
                            autocorrect: false,
                            autofocus: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(0, 158, 158, 158),
                              contentPadding: EdgeInsets.all(10.0),
                              hintText: 'Recipient email',
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
                            ),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          height: bodyHeight * 0.05,
                          width: bodyWidth * 0.9,
                          // color: Colors.green,
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
                              // fillColor: Color.fromARGB(255, 217, 217, 217),
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
                          height: bodyHeight * 0.1,
                          width: bodyWidth * 0.9,
                          child: Center(
                            child: FocusScope(
                              node: _focusScopeNode,
                              child: ElevatedButton(
                                onPressed: isLoading ? null : send,
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(fontSize: 18),
                                  minimumSize:
                                      Size(bodyWidth * 0.4, bodyHeight * 0.06),
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
                                        'Send',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
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
