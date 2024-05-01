import 'package:legitcheck/views/home.dart';
import 'package:legitcheck/views/profile.dart';
import 'package:legitcheck/views/scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List screens = [HomePage(), ScanPage(), ProfilePage()];

  int currentIndex = 0;
  PageController controller = PageController();

  void nextPage(index) {
    setState(() {
      currentIndex = index;
      controller.jumpToPage(index);
    });
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int? selectedIndex = ModalRoute.of(context)!.settings.arguments as int?;
      if (selectedIndex != null) {
        setState(() {
          currentIndex = selectedIndex;
          controller.jumpToPage(currentIndex);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white, // Warna border
            width: 6, // Lebar border
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
        // borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        child: BottomAppBar(
          height: 70,
          color: Color.fromARGB(255, 132, 132, 132),
          // shape: CircularNotchedRectangle(),
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
                  splashColor:
                      Colors.transparent, // Warna efek klik saat ditekan
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
                  splashColor:
                      Colors.transparent, // Warna efek klik saat ditekan
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
