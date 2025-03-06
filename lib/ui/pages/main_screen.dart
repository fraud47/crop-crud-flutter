
import 'package:farm_form/ui/pages/farm_details.dart';
import 'package:farm_form/ui/pages/form.dart';
import 'package:farm_form/ui/pages/widgets/nav_item.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);


  int _index = 0;
  final List<Widget> _pages = [
    FormScreen(),
    FarmDetails(),

  ];

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
                  left: 130,
                  right: 130,

                  child: Container(
                    height: 60
                    ,

                    decoration: BoxDecoration(
                               color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(50.0)

                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomNavItem(icon: 'images/home_icon.png',
                            isSelected: _index == 0,
                            onTap: () => movePage = 0),
                        CustomNavItem(icon: 'images/farm_details_icon.png',
                            isSelected: _index == 1,
                            onTap: () => movePage = 1),

                      ],
                    ),
                  ))
            ]
        ),
      ),
    );
  }
}
