import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import 'backup_and_restore_sub_page.dart';
import 'database_management_sub_page.dart';
import 'macro_targets_sub_page.dart';
import 'micro_targets_sub_page.dart';
import 'personalization_sub_page.dart';

class SettingsPage extends StatelessWidget {
  static const _repoUrl = 'https://codeberg.org/epinez/Energize';
  static const _issueUrl = 'https://codeberg.org/epinez/Energize/issues';

  void _showAbout(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationVersion: '0.1.3',
      applicationLegalese: '© 2022 Christian Flaßkamp\nGPLv3 license',
      applicationIcon: Image.asset('assets/about_logo.png', width: 75),
      children: [
        SizedBox(
          height: 20,
        ),
        Text(AppLocalizations.of(context)!.appDescription),
        InkWell(
          onTap: () async {
            if (await canLaunch(_issueUrl)) {
              await launch(_issueUrl);
            } else {
              throw 'Could not launch url';
            }
          },
          child: ListTile(
            contentPadding: EdgeInsets.all(8.0),
            title: Text(AppLocalizations.of(context)!.reportIssue),
            trailing: Icon(Icons.link),
          ),
        ),
        InkWell(
          onTap: () async {
            if (await canLaunch(_repoUrl)) {
              await launch(_repoUrl);
            } else {
              throw 'Could not launch url';
            }
          },
          child: ListTile(
            contentPadding: EdgeInsets.all(8.0),
            title: Text(AppLocalizations.of(context)!.sourceCode),
            trailing: Icon(Icons.link),
          ),
        ),
      ],
    );
  }

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
              leading: Icon(Icons.person),
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
              leading: Icon(Icons.bolt),
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
              leading: Icon(Icons.emoji_flags),
              title: Text(AppLocalizations.of(context)!.micronutrientsTargets),
              subtitle:
                  Text(AppLocalizations.of(context)!.micronutrientsTargetsHint),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                DatabaseManagementSubPage.routeName,
              );
            },
            child: ListTile(
              leading: Icon(Icons.perm_data_setting),
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
              leading: Icon(Icons.cloud),
              title: Text(AppLocalizations.of(context)!.backupAndRestore),
              subtitle:
                  Text(AppLocalizations.of(context)!.backupAndRestoreHint),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () => _showAbout(context),
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text(AppLocalizations.of(context)!.aboutEnergize),
            ),
          ),
        ],
      ),
    );
  }
}
