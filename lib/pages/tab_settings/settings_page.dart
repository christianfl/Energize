import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../theme/energize_theme.dart';
import 'about_sub_page/about_sub_page.dart';
import 'backup_and_restore_sub_page.dart';
import 'database_management_sub_page.dart';
import 'donation_sub_page.dart';
import 'personalization_page/nutrition_targets_page.dart';
import 'ui_settings_sub_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: ListView(
        children: [
          ListTile(
            isThreeLine: true,
            leading: const Icon(Icons.person),
            title: Text(
              AppLocalizations.of(context)!.yourPersonalNutritionNeeds,
            ),
            subtitle: Text(
              AppLocalizations.of(context)!.personalNutritionNeedsHint,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                NutritionTargetsPage.routeName,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.display_settings),
            title: Text(AppLocalizations.of(context)!.display),
            subtitle: Text(
              AppLocalizations.of(context)!.displayHint,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                UISettingsSubPage.routeName,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.perm_data_setting),
            title: Text(AppLocalizations.of(context)!.databaseManagement),
            subtitle:
                Text(AppLocalizations.of(context)!.databaseManagementHint),
            onTap: () {
              Navigator.of(context).pushNamed(
                DatabaseManagementSubPage.routeName,
              );
            },
          ),
          ListTile(
            isThreeLine: true,
            leading: const Icon(Icons.import_export),
            title: Text(AppLocalizations.of(context)!.backupAndRestore),
            subtitle: Text(AppLocalizations.of(context)!.backupAndRestoreHint),
            onTap: () {
              Navigator.of(context).pushNamed(
                BackupAndRestoreSubPage.routeName,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text(AppLocalizations.of(context)!.aboutEnergize),
            onTap: () {
              Navigator.of(context).pushNamed(
                AboutSubPage.routeName,
              );
            },
          ),
          ListTile(
            tileColor: Theme.of(context).donateContainer,
            textColor: Theme.of(context).onDonateContainer,
            iconColor: Theme.of(context).onDonateContainer,
            leading: const Icon(Icons.paid),
            title: Text(
              AppLocalizations.of(context)!.supportMeByDonating,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).onDonateContainer,
                  ),
            ),
            subtitle: const Text('Bitcoin, liberapay.com'),
            onTap: () {
              Navigator.of(context).pushNamed(
                DonationSubPage.routeName,
              );
            },
          ),
        ],
      ),
    );
  }
}
