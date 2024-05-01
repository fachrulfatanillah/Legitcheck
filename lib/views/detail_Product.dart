import 'package:flutter/material.dart';
import 'package:legitcheck/views/send_Ownership.dart';

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({Key? key}) : super(key: key);

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
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

    final List<Map<String, String>> owners = [
      {'title': 'First Owner', 'email': 'First@gmail.com'},
      {'title': 'Second Owner', 'email': 'Second@gmail.com'},
      {'title': 'Current Owner', 'email': 'Current@gmail.com'},
    ];

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
                    height: bodyHeight * 0.25,
                    width: bodyWidth * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b7d9211c-26e7-431a-ac24-b0540fb3c00f/air-force-1-07-shoes-WrLlWX.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                      height: bodyHeight * 0.05,
                      width: bodyWidth * 0.9,
                      // color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: bodyHeight * 0.03,
                            width: bodyWidth * 0.9,
                            // color: const Color.fromARGB(255, 7, 255, 123),
                            child: Text(
                              "Merk",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )),
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
                          "NIKE",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      height: bodyHeight * 0.04,
                      width: bodyWidth * 0.9,
                      // color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: bodyHeight * 0.03,
                            width: bodyWidth * 0.9,
                            // color: const Color.fromARGB(255, 7, 255, 123),
                            child: Text(
                              "Type",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )),
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
                          "Air Force 1",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      height: bodyHeight * 0.04,
                      width: bodyWidth * 0.9,
                      // color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: bodyHeight * 0.03,
                            width: bodyWidth * 0.9,
                            // color: const Color.fromARGB(255, 7, 255, 123),
                            child: Text(
                              "Size, Color",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )),
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
                          "38, White",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      height: bodyHeight * 0.04,
                      width: bodyWidth * 0.9,
                      // color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: bodyHeight * 0.03,
                            width: bodyWidth * 0.9,
                          )
                        ],
                      )),
                  Container(
                    height: bodyHeight * 0.25,
                    width: bodyWidth * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(70, 158, 158, 158),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: owners.length,
                      itemBuilder: (context, index) {
                        final owner = owners[index];
                        return ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                          title: Text(
                            owner['title']!,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          subtitle: Text(
                            owner['email']!,
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 225, 225, 225)),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: bodyHeight * 0.1,
                    width: bodyWidth * 0.9,
                    // color: Colors.amber,
                    child: Center(
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SendOwnershipPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 18),
                            minimumSize:
                                Size(bodyWidth * 0.4, bodyHeight * 0.06),
                            backgroundColor: Colors.black,
                          ),
                          child: Text(
                            'Send Ownership',
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
              ), //Code below
            )));
  }
}
