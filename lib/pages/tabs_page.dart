import 'package:flutter/material.dart';

import '../models/tab_nav_item.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

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
    return PopScope(
      canPop: _currentIndex == 0,
      onPopInvoked: (didPop) => didPop ? null : _setIndex(0),
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
