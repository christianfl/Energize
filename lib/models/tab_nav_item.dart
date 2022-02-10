import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  static List<TabNavItem> getItems(BuildContext context) {
    return [
      TabNavItem(
        page: TrackingPage(),
        icon: Icon(Icons.list),
        label: AppLocalizations.of(context)!.tracking,
      ),
      TabNavItem(
        page: FoodPage(),
        icon: Icon(Icons.fastfood),
        label: AppLocalizations.of(context)!.customFood,
      ),
      TabNavItem(
        page: SettingsPage(),
        icon: Icon(Icons.settings),
        label: AppLocalizations.of(context)!.settings,
      ),
    ];
  }
}
