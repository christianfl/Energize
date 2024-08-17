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
      onPopInvokedWithResult: (didPop, result) => didPop ? null : _setIndex(0),
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            for (final tabItem in TabNavItem.getItems(context)) tabItem.page,
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (int index) => _setIndex(index),
          destinations: [
            for (final tabItem in TabNavItem.getItems(context))
              NavigationDestination(
                icon: tabItem.icon,
                selectedIcon: tabItem.selectedIcon,
                label: tabItem.label,
              ),
          ],
        ),
      ),
    );
  }
}
