import 'package:flutter/material.dart';

import '../pages/tab_food/food_page.dart';
import '../pages/tab_settings/settings_page.dart';
import '../pages/tab_tracking/tracking_page.dart';

class TabNavItem {
  final Widget page;
  final String label;
  final Icon icon;

  TabNavItem({
    required this.page,
    required this.label,
    required this.icon,
  });

  static List<TabNavItem> get items => [
        TabNavItem(
          page: TrackingPage(),
          icon: Icon(Icons.list),
          label: 'Tracking',
        ),
        TabNavItem(
          page: FoodPage(),
          icon: Icon(Icons.fastfood),
          label: 'Custom Food',
        ),
        TabNavItem(
          page: SettingsPage(),
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ];
}
