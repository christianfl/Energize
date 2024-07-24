import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../pages/tab_food/food_page.dart';
import '../pages/tab_settings/settings_page.dart';
import '../pages/tab_tracking/tracking_page.dart';

class TabNavItem {
  final Widget page;
  final String label;
  final Icon icon;
  final Icon selectedIcon;

  TabNavItem({
    required this.page,
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  static List<TabNavItem> getItems(BuildContext context) {
    return [
      TabNavItem(
        page: const TrackingPage(),
        icon: const Icon(Icons.list_outlined),
        selectedIcon: const Icon(Icons.list),
        label: AppLocalizations.of(context)!.tracking,
      ),
      TabNavItem(
        page: const FoodPage(),
        icon: const Icon(Icons.fastfood_outlined),
        selectedIcon: const Icon(Icons.fastfood),
        label: AppLocalizations.of(context)!.customFood,
      ),
      TabNavItem(
        page: const SettingsPage(),
        icon: const Icon(Icons.settings_outlined),
        selectedIcon: const Icon(Icons.settings),
        label: AppLocalizations.of(context)!.settings,
      ),
    ];
  }
}
