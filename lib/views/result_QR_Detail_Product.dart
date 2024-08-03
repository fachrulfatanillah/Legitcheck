import 'package:flutter/material.dart';
import 'package:legitcheck/models/model_Qr_Code.dart';
import 'package:legitcheck/views/bottom_NavBar.dart';
import 'package:legitcheck/views/list_Of_Owners_Product_Detail.dart';
// import 'package:provider/provider.dart';

class ResultQrdetailProductPage extends StatefulWidget {
  final QrData qrData;
  final bool ownData;
  final List<Map<String, String>> listOwn;
  const ResultQrdetailProductPage(this.qrData, this.ownData, this.listOwn,
      {Key? key})
      : super(key: key);

  @override
  State<ResultQrdetailProductPage> createState() =>
      _ResultQrdetailProductPageState();
}

class _ResultQrdetailProductPageState extends State<ResultQrdetailProductPage> {
  @override
  Widget build(BuildContext context) {
    final dataOwn = widget.ownData;
    final dataDecrypted = widget.qrData.decrypted;
    final List<Map<String, String>> owners = widget.listOwn;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final appBar = AppBar(
      backgroundColor: Colors.black,
      title: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (_) => BottomNavBar(initialIndex: 1)),
              );
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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: appBar,
              body: Container(
                height: bodyHeight,
                width: bodyWidth,
                color: Colors.black,
                child: Column(
                  children: [
                    Container(
                      height: bodyHeight * 0.25,
                      width: bodyWidth * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          width: 1,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://legitcheck.online/public/storage/storage/assets/images/products/${widget.qrData.photo}',
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
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${widget.qrData.name}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
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
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${widget.qrData.description}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
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
                                "Size",
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
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            "${widget.qrData.size}",
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
                      child: dataOwn
                          ? ListOfOwnersDetailProduct(
                              owners: owners,
                              height: bodyHeight * 0.25,
                              width: bodyWidth * 0.9,
                            )
                          : ResultQrButton(
                              dataDecrypted: dataDecrypted,
                              height: bodyHeight * 0.06,
                              width: bodyWidth * 0.9,
                            ),
                    )
                  ],
                ), //Code below
              ))),
    );
  }
}
