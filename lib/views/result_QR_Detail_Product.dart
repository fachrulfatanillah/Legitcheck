import 'package:flutter/material.dart';
import 'package:legitcheck/view_models/view_Model_ResultQR.dart';
import 'package:legitcheck/views/list_Of_Owners_Product_Detail.dart';
import 'package:provider/provider.dart';

class ResultQrdetailProductPage extends StatefulWidget {
  const ResultQrdetailProductPage({Key? key}) : super(key: key);

  @override
  State<ResultQrdetailProductPage> createState() =>
      _ResultQrdetailProductPageState();
}

class _ResultQrdetailProductPageState extends State<ResultQrdetailProductPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<ViewModelResultQR>(context, listen: false);
      viewModel.checkCondition();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ViewModelResultQR>(context, listen: true);
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
                  // Container(
                  //   child: ListOfOwnersDetailProduct(
                  //     height: bodyHeight * 0.25,
                  //     width: bodyWidth * 0.9,
                  //   ),
                  //   child: ResultQrButton(
                  //     height: bodyHeight * 0.06,
                  //     width: bodyWidth * 0.9,
                  //   ),
                  // ),
                  Container(
                    child: viewModel.condition
                        ? ListOfOwnersDetailProduct(
                            height: bodyHeight * 0.25,
                            width: bodyWidth * 0.9,
                          )
                        : ResultQrButton(
                            height: bodyHeight * 0.06,
                            width: bodyWidth * 0.9,
                          ),
                  )
                ],
              ), //Code below
            )));
  }
}
