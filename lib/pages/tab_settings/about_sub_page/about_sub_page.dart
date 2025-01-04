import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/contributor.dart';

class AboutSubPage extends StatefulWidget {
  static const routeName = '/settings/about';

  static const email = 'energize@flasskamp.com';

  static const _repoUrl = 'https://codeberg.org/epinez/Energize';
  static const _issueUrl = 'https://codeberg.org/epinez/Energize/issues';
  static const _translationUrl =
      'https://hosted.weblate.org/projects/energize/energize';
  static const _copyrightNotice = '© Christian Flaßkamp';
  static const _license = 'GPLv3';
  static const _privacyPolicyUrl =
      'lib/pages/tab_settings/about_sub_page/assets/PRIVACY.md';

  const AboutSubPage({super.key});

  @override
  State<AboutSubPage> createState() => _AboutSubPageState();
}

class _AboutSubPageState extends State<AboutSubPage> {
  String _appVersion = '';

  /// Returns contributors of Energize.
  List<Contributor> _getContributors(BuildContext context) {
    return [
      Contributor(
        name: 'Marijn Kok',
        contributionLine1:
            AppLocalizations.of(context)!.contributionTypeCodeAndConversations,
      ),
      Contributor(
        name: 'mondstern',
        contributionLine1:
            AppLocalizations.of(context)!.contributionTypeAcrylicPicture,
        contributionLine2: 'CC BY-SA 4.0',
        assetUrl: 'assets/mondstern/mondstern_acryl_energize.jpg',
      ),
      Contributor(name: AppLocalizations.of(context)!.allTranslatorsOnWeblate),
    ];
  }

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
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(_appVersion),
                      const SizedBox(height: 8),
                      Text(
                        AboutSubPage._copyrightNotice,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        '${AppLocalizations.of(context)!.license}: ${AboutSubPage._license}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      OutlinedButton(
                        onPressed: () => showLicensePage(
                          context: context,
                          applicationVersion: _appVersion,
                          applicationLegalese:
                              '${AboutSubPage._copyrightNotice}\n${AboutSubPage._license}',
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
                          style: Theme.of(context).textTheme.bodySmall,
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
                onTap: () => _showPrivacyPolicyDialog(),
                child: ListTile(
                  leading: const Icon(Icons.privacy_tip),
                  title: Text(AppLocalizations.of(context)!.privacyPolicy),
                ),
              ),
              InkWell(
                onTap: () async {
                  final uri = Uri.parse(AboutSubPage._issueUrl);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
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
                  final uri = Uri.parse(AboutSubPage._issueUrl);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                  } else {
                    throw 'Could not launch url';
                  }
                },
                child: ListTile(
                  leading: const Icon(Icons.extension),
                  title: Text(AppLocalizations.of(context)!.proposeImprovement),
                  subtitle: const Text('Codeberg.org'),
                  trailing: const Icon(Icons.link),
                ),
              ),
              InkWell(
                onTap: () async {
                  final uri = Uri.parse(AboutSubPage._repoUrl);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
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
                  final uri = Uri.parse(AboutSubPage._translationUrl);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
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
                onTap: () {
                  _showContributorsDialog();
                },
                child: ListTile(
                  leading: const Icon(Icons.people),
                  title: Text(AppLocalizations.of(context)!.contributors),
                ),
              ),
              InkWell(
                onTap: () async {
                  final uri = Uri(
                    scheme: 'mailto',
                    path: AboutSubPage.email,
                    query:
                        'subject=Energize App Feedback&body=App Version $_appVersion',
                  );

                  if (await canLaunchUrl(uri)) {
                    await launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                  } else {
                    throw 'Could not launch url';
                  }
                },
                child: ListTile(
                  isThreeLine: true,
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(AppLocalizations.of(context)!.contact),
                  ),
                  subtitle: Text(AppLocalizations.of(context)!.emailHint),
                  trailing: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.mail),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _getAppVersion();

    super.initState();
  }

  /// Fetch Energize app version
  void _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      _appVersion = packageInfo.version;
    });
  }

  /// Shows dialog for listing the Energize contributors
  Future<void> _showContributorsDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.contributors),
              const SizedBox(height: 18),
              Text(
                AppLocalizations.of(context)!.thanksToContributorsText,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: _getContributors(context).length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_getContributors(context)[index].name),
                  subtitle:
                      _getContributors(context)[index].contributionLine1 != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _getContributors(context)[index]
                                      .contributionLine1!,
                                ),
                                if (_getContributors(context)[index]
                                        .contributionLine2 !=
                                    null)
                                  Text(
                                    _getContributors(context)[index]
                                        .contributionLine2!,
                                  ),
                              ],
                            )
                          : null,
                  trailing: _getContributors(context)[index].assetUrl != null
                      ? CircleAvatar(
                          foregroundImage: AssetImage(
                            _getContributors(context)[index].assetUrl!,
                          ),
                        )
                      : null,
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(MaterialLocalizations.of(context).okButtonLabel),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showPrivacyPolicyDialog() async {
    // Load privacy policy from local markdown file
    String privacyPolicyMarkdown =
        await rootBundle.loadString(AboutSubPage._privacyPolicyUrl);

    // Remove first line which contains the title
    final endOfFirstLineIndex = privacyPolicyMarkdown.indexOf('\n');
    privacyPolicyMarkdown =
        privacyPolicyMarkdown.substring(endOfFirstLineIndex);

    if (!mounted) {
      return;
    }

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog.fullscreen(
          child: Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.privacyPolicy),
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ),
            body: Markdown(
              data: privacyPolicyMarkdown,
              styleSheet: MarkdownStyleSheet(
                blockquoteDecoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                ),
              ),
              selectable: true,
              onTapLink: (text, href, title) async {
                if (href != null) {
                  final uri = Uri.parse(href);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                  } else {
                    throw 'Could not launch url';
                  }
                }
              },
            ),
          ),
        );
      },
    );
  }
}
