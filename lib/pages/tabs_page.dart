import 'package:flutter/material.dart';

import '../models/tab_nav_item.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
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
