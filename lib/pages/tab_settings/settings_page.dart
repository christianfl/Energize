import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

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
      applicationVersion: '1.0.0',
      applicationLegalese: '© 2021 Christian Flaßkamp\nGPLv3 license',
      applicationIcon: Image.asset('assets/about_logo.png', width: 75),
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
            'Track your food and nutrition easily and fast. Scan your products or search in different databases.'),
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
            title: Text('Report issue'),
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
            title: Text('Source code'),
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
              title: Text('Personalization'),
              subtitle: Text('Enter personal details to calculate nutrients'),
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
              title: Text('Energy- and macronutrients targets'),
              subtitle: Text('Adjust daily targets according to your diet'),
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
              title: Text('Micronutrients targets'),
              subtitle: Text('Adjust vitamin-, mineral- and other targets'),
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
              title: Text('Database management'),
              subtitle: Text('Select which food databases to query'),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () => _showAbout(context),
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
            ),
          ),
          // TODO: Issue #4: Backup and restore via cloud provider (Nextcloud if possible)
        ],
      ),
    );
  }
}
