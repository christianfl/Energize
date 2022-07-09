import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSubPage extends StatelessWidget {
  static const routeName = '/settings/about';

  static const _repoUrl = 'https://codeberg.org/epinez/Energize';
  static const _issueUrl = 'https://codeberg.org/epinez/Energize/issues';
  static const _translationUrl =
      'https://hosted.weblate.org/projects/energize/energize';
  static const _email = 'energize@flasskamp.com';
  static const _appVersion = '0.5.0';
  static const _copyrightNotice = '© 2022 Christian Flaßkamp';
  static const _license = 'GPLv3';

  const AboutSubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.aboutEnergize),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/about_logo.png',
                      width: 140,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.appName,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const Text('v$_appVersion'),
                      const SizedBox(height: 8),
                      Text(
                        _copyrightNotice,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        '${AppLocalizations.of(context)!.license}: $_license',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      OutlinedButton(
                        onPressed: () => showLicensePage(
                          context: context,
                          applicationVersion: _appVersion,
                          applicationLegalese: '$_copyrightNotice\n$_license',
                          applicationIcon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/about_logo.png'),
                              radius: 50,
                            ),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.allLicenses,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Text(AppLocalizations.of(context)!.appDescription),
              ),
              InkWell(
                onTap: () async {
                  if (await canLaunch(_issueUrl)) {
                    await launch(_issueUrl);
                  } else {
                    throw 'Could not launch url';
                  }
                },
                child: ListTile(
                  leading: const Icon(Icons.bug_report),
                  title: Text(AppLocalizations.of(context)!.reportIssue),
                  subtitle: const Text('Codeberg.org'),
                  trailing: const Icon(Icons.link),
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
                  leading: const Icon(Icons.code),
                  title: Text(AppLocalizations.of(context)!.sourceCode),
                  subtitle: const Text('Codeberg.org'),
                  trailing: const Icon(Icons.link),
                ),
              ),
              InkWell(
                onTap: () async {
                  if (await canLaunch(_translationUrl)) {
                    await launch(_translationUrl);
                  } else {
                    throw 'Could not launch url';
                  }
                },
                child: ListTile(
                  leading: const Icon(Icons.translate),
                  title: Text(AppLocalizations.of(context)!.translation),
                  subtitle: const Text('Weblate.org'),
                  trailing: const Icon(Icons.link),
                ),
              ),
              InkWell(
                onTap: () async {
                  if (await canLaunch('mailto:$_email')) {
                    await launch('mailto:$_email');
                  } else {
                    throw 'Could not launch url';
                  }
                },
                child: ListTile(
                  title: Text(AppLocalizations.of(context)!.contact),
                  subtitle: Text(AppLocalizations.of(context)!.email),
                  trailing: const Icon(Icons.mail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
