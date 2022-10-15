import 'package:flutter/material.dart';

import '../models/tab_nav_item.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  TabsPageState createState() => TabsPageState();
}

class TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;

  void _setIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex == 0) {
          return true;
        } else {
          setState(() {
            _currentIndex = 0;
          });
          return false;
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            for (final tabItem in TabNavItem.getItems(context)) tabItem.page,
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF0F1518),
          currentIndex: _currentIndex,
          onTap: (int index) => _setIndex(index),
          items: [
            for (final tabItem in TabNavItem.getItems(context))
              BottomNavigationBarItem(
                icon: tabItem.icon,
                label: tabItem.label,
              )
          ],
        ),
      ),
    );
  }
}
