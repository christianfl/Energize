import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/app_settings.dart';

class UISettingsSubPage extends StatelessWidget {
  static const routeName = '/settings/ui';

  const UISettingsSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);

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
          ],
        ),
      ),
    );
  }
}
