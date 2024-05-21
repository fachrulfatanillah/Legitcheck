import 'package:flutter/material.dart';
import 'package:legitcheck/viewmodels/view_Model_DetailProduct.dart';
import 'package:legitcheck/views/list_Of_Owners_Product_Detail.dart';
import 'package:legitcheck/views/send_Ownership.dart';

class DetailProductPage extends StatefulWidget {
  final Map<String, String> product;
  const DetailProductPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  late List<Map<String, String>> owners = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    final getOwnProducts = ViewModelDetailProducts();
    getOwnProducts.listOwnOfProducts(widget.product, context).then((data) {
      setState(() {
        isLoading = true;
        Future.delayed(Duration(milliseconds: 10), () {
          setState(() {
            owners = data;
            isLoading = false;
          });
        });
      });
    });
  }

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
                          'https://legitcheck.online/public/storage/storage/assets/images/products/${widget.product['photo']}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                      height: bodyHeight * 0.05,
                      width: bodyWidth * 0.9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: bodyHeight * 0.03,
                            width: bodyWidth * 0.9,
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
                        color: const Color.fromARGB(255, 255, 255, 255),
                        width: 1,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          widget.product['name']!,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: bodyHeight * 0.03,
                            width: bodyWidth * 0.9,
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
                        color: const Color.fromARGB(255, 255, 255, 255),
                        width: 1,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          widget.product['description']!,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: bodyHeight * 0.03,
                            width: bodyWidth * 0.9,
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
                        color: const Color.fromARGB(255, 255, 255, 255),
                        width: 1,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          widget.product['size']!,
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
                    child: isLoading
                        ? Center(
                            child: SizedBox(
                              height: bodyHeight * 0.05,
                              width: bodyWidth * 0.1,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                          )
                        : ListOfOwnersDetailProduct(
                            owners: owners,
                            height: bodyHeight * 0.25,
                            width: bodyWidth * 0.9,
                          ),
                  ),
                  Container(
                    height: bodyHeight * 0.1,
                    width: bodyWidth * 0.9,
                    child: Center(
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SendOwnershipPage(product: widget.product),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 18),
                            minimumSize:
                                Size(bodyWidth * 0.4, bodyHeight * 0.06),
                            backgroundColor: Colors.black,
                            side: BorderSide(
                              color: Colors.white, // Warna border
                              width: 2,
                            ),
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
              ),
            )));
  }
}
