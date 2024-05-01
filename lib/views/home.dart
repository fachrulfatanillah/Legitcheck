import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:legitcheck/views/detail_Product.dart';
// import 'package:legitcheck/views/detail_Product.dart';
import 'package:legitcheck/views/result_QR_Detail_Product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
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
              // color: Colors.amber,
            ),
            Container(
              height: bodyHeight * 0.2,
              width: bodyWidth * 0.9,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                ),
                items: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b7d9211c-26e7-431a-ac24-b0540fb3c00f/air-force-1-07-shoes-WrLlWX.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d98fd922-1a53-45ee-acf1-94d823f457d5/air-force-1-07-shoes-b0f549.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/vddy0hfi3ok08gfel1vn/air-force-1-low-retro-shoe-05nKGx.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: bodyHeight * 0.02,
              width: bodyWidth * 0.9,
              // color: const Color.fromARGB(255, 7, 164, 255),
            ),
            Container(
              height: bodyHeight * 0.08,
              width: bodyWidth * 0.9,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  autoPlayInterval: Duration(seconds: 7),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                ),
                items: [
                  Container(
                    child: Center(
                      child: Text("5 Hari Lagi Selesai Project TA"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: bodyHeight * 0.03,
              width: bodyWidth * 0.9,
              // color: const Color.fromARGB(255, 7, 164, 255),
            ),
            Container(
              height: bodyHeight * 0.08,
              width: bodyWidth * 0.9,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Container(
                  height: bodyHeight * 0.06,
                  width: bodyWidth * 0.9,
                  decoration: BoxDecoration(
                    // color: const Color.fromARGB(255, 121, 11, 11),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            "All",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        width: 90,
                        height: 90,
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            "Shoes",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        width: 90,
                        height: 90,
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            "Clothes",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        width: 90,
                        height: 90,
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            "Bag",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: bodyHeight * 0.02,
              width: bodyWidth * 0.9,
            ),
            Container(
                height: bodyHeight * 0.42,
                width: bodyWidth * 0.9,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 117, 117, 117),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 68, 68, 68),
                      ),
                      child: ListTile(
                        tileColor: Colors.white,
                        leading: ClipRect(
                          child: SizedBox(
                            width: 56,
                            height: 56,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b7d9211c-26e7-431a-ac24-b0540fb3c00f/air-force-1-07-shoes-WrLlWX.png"),
                              ),
                            ),
                          ),
                        ),
                        title: Text('NIKE',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        subtitle: Text('AIR FORCE 1',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ResultQrdetailProductPage()),
                          );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => DetailProductPage()),
                          // );
                        },
                      ),
                    ),
                    SizedBox(height: 2),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 68, 68, 68),
                      ),
                      child: ListTile(
                        tileColor: Colors.white,
                        leading: ClipRect(
                          child: SizedBox(
                            width: 56,
                            height: 56,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b7d9211c-26e7-431a-ac24-b0540fb3c00f/air-force-1-07-shoes-WrLlWX.png"),
                              ),
                            ),
                          ),
                        ),
                        title: Text('NIKE',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        subtitle: Text('AIR FORCE 1',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                    SizedBox(height: 2),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 68, 68, 68),
                      ),
                      child: ListTile(
                        tileColor: Colors.white,
                        leading: ClipRect(
                          child: SizedBox(
                            width: 56,
                            height: 56,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b7d9211c-26e7-431a-ac24-b0540fb3c00f/air-force-1-07-shoes-WrLlWX.png"),
                              ),
                            ),
                          ),
                        ),
                        title: Text('NIKE',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        subtitle: Text('AIR FORCE 1',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                    SizedBox(height: 2),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 68, 68, 68),
                      ),
                      child: ListTile(
                        tileColor: Colors.white,
                        leading: ClipRect(
                          child: SizedBox(
                            width: 56,
                            height: 56,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b7d9211c-26e7-431a-ac24-b0540fb3c00f/air-force-1-07-shoes-WrLlWX.png"),
                              ),
                            ),
                          ),
                        ),
                        title: Text('NIKE',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        subtitle: Text('AIR FORCE 1',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                    SizedBox(height: 2),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
