import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:legitcheck/viewmodels/view_Model_Profile.dart';
import 'package:legitcheck/viewmodels/view_Model_SnackBar.dart';
import 'package:legitcheck/viewmodels/view_model_Home.dart';
import 'package:legitcheck/views/list_Products_Owned.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final List<Map<String, String>> items;
  const HomePage(this.items, {Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? lastPressed;
  int _selectedIndex = 0;
  String selectedCategory = 'All';
  bool isLoading = true;

  late List<Map<String, String>> products = [];
  late Filter filter;

  late String userId;

  @override
  void initState() {
    super.initState();
    userId = Provider.of<ViewModelProfile>(context, listen: false).id;
    final getProductsUser = GetProductsUser();
    getProductsUser.listProductsUser(userId).then((data) {
      setState(() {
        isLoading = true;
        Future.delayed(Duration(milliseconds: 100), () {
          setState(() {
            products = data;
            isLoading = false;
          });
        });
      });
    });
    filter = Filter();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = widget.items;
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
                  height: bodyHeight * 0.2,
                  width: bodyWidth * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 900),
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
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      autoPlayInterval: Duration(seconds: 7),
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                    ),
                    items: [
                      Container(
                        child: Center(
                          child: Text(
                            "Welcome To LegitCheck",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: bodyHeight * 0.03,
                  width: bodyWidth * 0.9,
                ),
                Container(
                  height: bodyHeight * 0.08,
                  width: bodyWidth * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Container(
                      height: bodyHeight * 0.06,
                      width: bodyWidth * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          bool isSelected = _selectedIndex == index;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                                selectedCategory = items[index]['title']!;
                              });
                            },
                            child: Container(
                              height: 80,
                              width: 100,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.grey
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  items[index]['title']!,
                                  style: TextStyle(
                                      color: isSelected
                                          ? Colors.black
                                          : Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  height: bodyHeight * 0.02,
                  width: bodyWidth * 0.9,
                ),
                Container(
                  height: bodyHeight * 0.40,
                  width: bodyWidth * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    color: Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: isLoading
                      ? Center(
                          child: SizedBox(
                            height: bodyHeight * 0.067,
                            width: bodyWidth * 0.15,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                        )
                      : filter
                              .getFilteredProducts(selectedCategory, products)
                              .isEmpty
                          ? Center(
                              child: Text(
                                'No Products',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            )
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: filter
                                  .getFilteredProducts(
                                      selectedCategory, products)
                                  .length,
                              itemBuilder: (context, index) {
                                final product = filter.getFilteredProducts(
                                    selectedCategory, products)[index];

                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  child: ListProductsOwn(
                                    product: product,
                                  ),
                                );
                              },
                            ),
                ),
              ],
            ),
          ),
        ));
  }
}
