import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/app_settings_provider.dart';

class UISettingsSubPage extends StatelessWidget {
  static const routeName = '/settings/ui';

  const UISettingsSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.display),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwitchListTile(
              title: Text(
                AppLocalizations.of(context)!.groupFoodsToMeals,
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.groupFoodsToMealsHint,
              ),
              value: appSettings.isMealGroupingActivated,
              onChanged: (val) => appSettings.isMealGroupingActivated = val,
            ),
            SwitchListTile(
              title: Text(
                AppLocalizations.of(context)!.preferServingSizes,
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.preferServingSizesHint,
              ),
              value: appSettings.isServingSizePreferred,
              onChanged: (val) => appSettings.isServingSizePreferred = val,
            ),
          ],
        ),
      ),
    );
  }
}
