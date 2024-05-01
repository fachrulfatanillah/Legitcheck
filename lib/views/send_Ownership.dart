import 'package:flutter/material.dart';

class SendOwnershipPage extends StatefulWidget {
  const SendOwnershipPage({Key? key}) : super(key: key);

  @override
  State<SendOwnershipPage> createState() => _SendOwnershipPageState();
}

class _SendOwnershipPageState extends State<SendOwnershipPage> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final appBar = AppBar(
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
            resizeToAvoidBottomInset: false,
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
                    height: bodyHeight * 0.05,
                    width: bodyWidth * 0.9,
                    // color: const Color.fromARGB(255, 7, 255, 123),
                    child: Center(
                      child: Text(
                        "SEND OWNERSHIP",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
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
                            color: Color.fromARGB(70, 158, 158, 158),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                "yourEmail@gmail.com",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 72, 72, 72),
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
                            autocorrect: false,
                            autofocus: false,
                            decoration: InputDecoration(
                              filled: true,
                              // fillColor: Color.fromARGB(255, 217, 217, 217),
                              fillColor: Color.fromARGB(183, 158, 158, 158),
                              contentPadding: EdgeInsets.all(10.0),
                              hintText: 'Recipient Email',
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
                                borderSide: BorderSide(color: Colors.black),
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
                            obscureText: _obscureText,
                            autocorrect: false,
                            autofocus: false,
                            decoration: InputDecoration(
                              filled: true,
                              // fillColor: Color.fromARGB(255, 217, 217, 217),
                              fillColor: Color.fromARGB(183, 158, 158, 158),
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
                                borderSide: BorderSide(color: Colors.black),
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
                        Container(
                          height: bodyHeight * 0.1,
                          width: bodyWidth * 0.9,
                          // color: Colors.amber,
                          child: Center(
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(fontSize: 18),
                                  minimumSize:
                                      Size(bodyWidth * 0.4, bodyHeight * 0.06),
                                  backgroundColor: Colors.black,
                                ),
                                child: Text(
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
