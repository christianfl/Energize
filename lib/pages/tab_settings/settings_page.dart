import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'about_sub_page.dart';
import 'backup_and_restore_sub_page.dart';
import 'database_management_sub_page.dart';
import 'donation_sub_page.dart';
import 'macro_targets_sub_page.dart';
import 'micro_targets_sub_page.dart';
import 'personalization_sub_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                PersonalizationSubPage.routeName,
              );
            },
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(AppLocalizations.of(context)!.personalization),
              subtitle: Text(AppLocalizations.of(context)!.personalizationHint),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                MacroTargetsSubPage.routeName,
              );
            },
            child: ListTile(
              leading: const Icon(Icons.bolt),
              title: Text(
                  AppLocalizations.of(context)!.energyAndMacronutrientsTargets),
              subtitle: Text(AppLocalizations.of(context)!
                  .energyAndMacronutrientsTargetsHint),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                MicroTargetsSubPage.routeName,
              );
            },
            child: ListTile(
              leading: const Icon(Icons.emoji_flags),
              title: Text(AppLocalizations.of(context)!.micronutrientsTargets),
              subtitle:
                  Text(AppLocalizations.of(context)!.micronutrientsTargetsHint),
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                DatabaseManagementSubPage.routeName,
              );
            },
            child: ListTile(
              leading: const Icon(Icons.perm_data_setting),
              title: Text(AppLocalizations.of(context)!.databaseManagement),
              subtitle:
                  Text(AppLocalizations.of(context)!.databaseManagementHint),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                BackupAndRestoreSubPage.routeName,
              );
            },
            child: ListTile(
              isThreeLine: true,
              leading: const Icon(Icons.cloud),
              title: Text(AppLocalizations.of(context)!.backupAndRestore),
              subtitle:
                  Text(AppLocalizations.of(context)!.backupAndRestoreHint),
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                AboutSubPage.routeName,
              );
            },
            child: ListTile(
              leading: const Icon(Icons.info),
              title: Text(AppLocalizations.of(context)!.aboutEnergize),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                DonationSubPage.routeName,
              );
            },
            child: ListTile(
              tileColor: const Color(0xFFF6C915),
              textColor: Colors.black,
              leading: const Icon(
                Icons.paid,
                color: Colors.black,
              ),
              title: Text(
                AppLocalizations.of(context)!.supportMeByDonating,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              subtitle: const Text('Bitcoin, liberapay.com'),
            ),
          ),
        ],
      ),
    );
  }
}
