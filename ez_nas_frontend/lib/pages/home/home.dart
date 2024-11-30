import 'package:ez_nas_frontend/pages/home/pages/favorite_page.dart';
import 'package:ez_nas_frontend/pages/home/pages/file_page.dart';
import 'package:ez_nas_frontend/pages/home/pages/home_page.dart';
import 'package:ez_nas_frontend/pages/home/pages/settings_page.dart';
import 'package:flutter/material.dart';

import 'components/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [ // 占位符，您可以替换为实际的页面组件
          HomePage(),
          FilePage(),
          FavoritePage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}