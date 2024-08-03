import 'package:legitcheck/viewmodels/view_model_Home.dart';
import 'package:legitcheck/views/home.dart';
import 'package:legitcheck/views/profile.dart';
import 'package:legitcheck/views/scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;
  const BottomNavBar({Key? key, this.initialIndex = 0});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late List<Map<String, String>> categories = [];

  int currentIndex = 0;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    controller = PageController(initialPage: currentIndex);
    final getCategories = GetCategories();
    getCategories.categories().then((result) {
      setState(() {
        categories = result;
      });
    });
  }

  void nextPage(index) {
    setState(() {
      currentIndex = index;
      controller.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    List screens = [HomePage(categories), ScanPage(), ProfilePage()];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 6,
          ),
        ),
        child: FloatingActionButton(
          backgroundColor: currentIndex == 1 ? Colors.black : Colors.black,
          onPressed: () {
            nextPage(1);
          },
          child: Icon(
            Icons.qr_code_scanner,
            color: currentIndex == 1
                ? Colors.white
                : Color.fromARGB(255, 132, 132, 132),
            size: 40,
          ),
          shape: CircleBorder(),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        child: BottomAppBar(
          height: 70,
          color: Color.fromARGB(255, 132, 132, 132),
          notchMargin: 8,
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {
                    nextPage(0);
                  },
                  icon: Icon(
                    Icons.home,
                    size: 30,
                    color: currentIndex == 0 ? Colors.white : Colors.black,
                  ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    nextPage(2);
                  },
                  icon: Icon(
                    Icons.person,
                    size: 30,
                    color: currentIndex == 2 ? Colors.white : Colors.black,
                  ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView.builder(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          itemCount: screens.length,
          itemBuilder: (context, index) {
            return screens[index];
          }),
    );
  }
}
