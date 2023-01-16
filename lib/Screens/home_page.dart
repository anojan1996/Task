import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _page = 0;
  late PageController pageController; 

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: homeScreenItems,
      ),
      bottomNavigationBar: CupertinoTabBar(
        height: 84,
        backgroundColor: const Color(0xFFFFFFFF),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
              color: (_page == 0) ? activeColor : inactiveColor,
            ),
            label: 'Find',
            backgroundColor: activeColor,
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book_outlined,
                color: (_page == 1) ? activeColor : inactiveColor,
              ),
              label: 'Bookings',
              backgroundColor: activeColor),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: (_page == 2) ? activeColor : inactiveColor,
              ),
              label: 'Saved',
              backgroundColor: activeColor),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: (_page == 3) ? activeColor : inactiveColor,
            ),
            label: 'Notifications',
            backgroundColor: activeColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: (_page == 4) ? activeColor : inactiveColor,
            ),
            label: 'Menu',
            backgroundColor: activeColor,
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}