import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/contributor.dart';
import '../../../providers/log_provider.dart';
import '../../../theme/energize_theme.dart';

class AboutSubPage extends StatefulWidget {
  static const routeName = '/settings/about';

  static const _license = 'AGPLv3';
  static const _privacyPolicyUrl =
      'lib/pages/tab_settings/about_sub_page/assets/PRIVACY.md';

  static final email = dotenv.get('CONTACT_MAIL');
  static final _repoUrl = dotenv.get('REPO_URL');
  static final _issueUrl = dotenv.get('ISSUE_URL');
  static final _translationUrl = dotenv.get('TRANSLATION_URL');
  static final _copyrightNotice = '© ${dotenv.get('COPYRIGHT_NAME')}';

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
    final logger = Provider.of<LogProvider>(context, listen: false);

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
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 140),
                    child: Image.asset(
                      'assets/about_logo.webp',
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
                      const SizedBox(height: 8),
                      OutlinedButton(
                        onPressed: () => showLicensePage(
                          context: context,
                          applicationVersion: _appVersion,
                          applicationLegalese:
                              '${AboutSubPage._copyrightNotice}\n${AboutSubPage._license}',
                          applicationIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/about_logo.webp',
                              width: 140,
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
              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: Text(AppLocalizations.of(context)!.privacyPolicy),
                onTap: () {
                  _showPrivacyPolicyDialog();
                },
              ),
              if (logger.talker != null)
                ListTile(
                  leading: const Icon(Icons.receipt_long),
                  title: Text(AppLocalizations.of(context)!.logs),
                  onTap: () {
                    final brightness = Theme.of(context).brightness;

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TalkerScreen(
                          talker: logger.talker!,
                          appBarTitle: AppLocalizations.of(context)!.logs,
                          theme: TalkerScreenTheme.fromTheme(
                            brightness == Brightness.light
                                ? EnergizeTheme.theme
                                : EnergizeTheme.darkTheme,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ListTile(
                leading: const Icon(Icons.bug_report),
                title: Text(AppLocalizations.of(context)!.reportIssue),
                subtitle: Text(
                  '${Uri.tryParse(AboutSubPage._issueUrl)?.host.toCapitalize()}',
                ),
                trailing: const Icon(Icons.link),
                onTap: () {
                  final uri = Uri.parse(AboutSubPage._issueUrl);

                  try {
                    launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                  } catch (e) {
                    final logger =
                        Provider.of<LogProvider>(context, listen: false);
                    logger.error('Could not launch url', e);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.extension),
                title: Text(AppLocalizations.of(context)!.proposeImprovement),
                subtitle: Text(
                  '${Uri.tryParse(AboutSubPage._issueUrl)?.host.toCapitalize()}',
                ),
                trailing: const Icon(Icons.link),
                onTap: () {
                  final uri = Uri.parse(AboutSubPage._issueUrl);

                  try {
                    launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                  } catch (e) {
                    final logger =
                        Provider.of<LogProvider>(context, listen: false);
                    logger.error('Could not launch url', e);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.code),
                title: Text(AppLocalizations.of(context)!.sourceCode),
                subtitle: Text(
                  '${Uri.tryParse(AboutSubPage._repoUrl)?.host.toCapitalize()}',
                ),
                trailing: const Icon(Icons.link),
                onTap: () {
                  final uri = Uri.parse(AboutSubPage._repoUrl);

                  try {
                    launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                  } catch (e) {
                    final logger =
                        Provider.of<LogProvider>(context, listen: false);
                    logger.error('Could not launch url', e);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.translate),
                title: Text(AppLocalizations.of(context)!.translation),
                subtitle: Text(
                  '${Uri.tryParse(AboutSubPage._translationUrl)?.host.toCapitalize()}',
                ),
                trailing: const Icon(Icons.link),
                onTap: () {
                  final uri = Uri.parse(AboutSubPage._translationUrl);

                  try {
                    launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                  } catch (e) {
                    final logger =
                        Provider.of<LogProvider>(context, listen: false);
                    logger.error('Could not launch url', e);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: Text(AppLocalizations.of(context)!.contributors),
                onTap: () {
                  _showContributorsDialog();
                },
              ),
              ListTile(
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
                onTap: () {
                  final uri = Uri(
                    scheme: 'mailto',
                    path: AboutSubPage.email,
                    query:
                        'subject=Energize App Feedback&body=App Version $_appVersion',
                  );

                  try {
                    launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                  } catch (e) {
                    final logger =
                        Provider.of<LogProvider>(context, listen: false);
                    logger.error('Could not launch url', e);
                  }
                },
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
              onTapLink: (text, href, title) {
                if (href != null) {
                  final uri = Uri.parse(href);

                  try {
                    launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                  } catch (e) {
                    final logger =
                        Provider.of<LogProvider>(context, listen: false);
                    logger.error('Could not launch url', e);
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

extension StringCasingExtension on String {
  String toCapitalize() =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}
