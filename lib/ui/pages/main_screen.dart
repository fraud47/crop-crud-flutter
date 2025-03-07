import 'package:farm_form/ui/pages/farm_details.dart';
import 'package:farm_form/ui/pages/form.dart';
import 'package:farm_form/ui/pages/widgets/nav_item.dart';
import 'package:flutter/material.dart';

import '../../core/hive/hive.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  int _index = 0;
  List<Widget> _pages = [];
  List<Map<String, dynamic>> _navItems = [];

  @override
  void initState() {
    super.initState();
    _initializePages();
  }

  void _initializePages() {
    String? role = MainBoxMixin().getData<String>(MainBoxKeys.role);

    _pages = [FormScreen()];
    _navItems = [
      {"icon": 'images/home_icon.png', "index": 0}
    ];

    // Add FarmDetails only if role is 'admin'
    if (role == 'admin') {
      _pages.add(FarmDetails());
      _navItems.add({"icon": 'images/farm_details_icon.png', "index": 1});
    }

    setState(() {});
  }

  set movePage(int index) {
    setState(() => _index = index);
    _pageController.jumpToPage(index);
  }

  set changeIndex(int index) {
    setState(() => _index = index);
  }

  int get currentPosition => _index;

  List<Widget> get pages => _pages;

  PageController get pageController => _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int newPage) {
                changeIndex = newPage;
              },
              children: _pages,
            ),
            Positioned(
              bottom: 20,
              left: 100,
              right: 100,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(50.0),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 6),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _navItems.map((item) {
                    return CustomNavItem(
                      icon: item["icon"],
                      isSelected: _index == item["index"],
                      onTap: () => movePage = item["index"],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
