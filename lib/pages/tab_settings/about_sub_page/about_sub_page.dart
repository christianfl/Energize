import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/layout_config.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/contributor.dart';
import '../../../providers/log_provider.dart';
import '../../../theme/energize_theme.dart';
import '../../../utils/privacy_policy_dialog.dart';
import '../../../widgets/page_scaffold.dart';
import '../../../widgets/settings_group.dart';
import '../../introduction/introduction_page.dart';

class AboutSubPage extends StatefulWidget {
  static const routeName = '/settings/about';

  static const _license = 'AGPLv3';
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
        contributionLine1: AppLocalizations.of(
          context,
        )!.contributionTypeCodeAndConversations,
      ),
      Contributor(
        name: 'mondstern',
        contributionLine1: AppLocalizations.of(
          context,
        )!.contributionTypeAcrylicPicture,
        contributionLine2: 'CC BY-SA 4.0',
        assetUrl: 'assets/mondstern/mondstern_acryl_energize.jpg',
      ),
      Contributor(name: AppLocalizations.of(context)!.allTranslatorsOnWeblate),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final logger = Provider.of<LogProvider>(context, listen: false);
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return PageScaffold(
      maxContentWidth: settingsMaxContentWidth,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.aboutEnergize),
        actions: [
          PopupMenuButton<void>(
            itemBuilder: (_) => [
              PopupMenuItem<void>(
                onTap: () {
                  Navigator.of(context).pushNamed(IntroductionPage.routeName);
                },
                child: Text(AppLocalizations.of(context)!.showIntroduction),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: pagePadding,
        children: [
          Column(
            children: [
              Image.asset('assets/about_logo.webp', width: 96, height: 96),
              const SizedBox(height: 16.0),
              Text(
                localizations.appName,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium,
              ),
              if (_appVersion.isNotEmpty) ...[
                const SizedBox(height: 4.0),
                Text(
                  '${localizations.version} $_appVersion',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
              const SizedBox(height: 16.0),
              Text(
                localizations.appDescription,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                AboutSubPage._copyrightNotice,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall,
              ),
              Text(
                '${localizations.license}: ${AboutSubPage._license}',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: pageSectionSpacing),
          Text(
            localizations.generalInformation,
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: pageHeadingSpacing),
          SettingsGroup(
            children: [
              ListTile(
                leading: const Icon(Icons.description_outlined),
                title: Text(localizations.allLicenses),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => showLicensePage(
                  context: context,
                  applicationVersion: _appVersion,
                  applicationLegalese:
                      '${AboutSubPage._copyrightNotice}\n${AboutSubPage._license}',
                  applicationIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/about_logo.webp', width: 96),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip_outlined),
                title: Text(AppLocalizations.of(context)!.privacyPolicy),
                onTap: () => showPrivacyPolicyDialog(context),
              ),
              if (logger.talker != null)
                ListTile(
                  leading: const Icon(Icons.receipt_long_outlined),
                  title: Text(AppLocalizations.of(context)!.logs),
                  trailing: const Icon(Icons.chevron_right),
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
            ],
          ),
          const SizedBox(height: pageSectionSpacing),
          Text(localizations.contribute, style: theme.textTheme.titleSmall),
          const SizedBox(height: pageHeadingSpacing),
          SettingsGroup(
            children: [
              ListTile(
                leading: const Icon(Icons.bug_report_outlined),
                title: Text(AppLocalizations.of(context)!.reportIssue),
                subtitle: Text(
                  '${Uri.tryParse(AboutSubPage._issueUrl)?.host.toCapitalize()}',
                ),
                trailing: const Icon(Icons.open_in_new),
                onTap: () {
                  final uri = Uri.parse(AboutSubPage._issueUrl);

                  try {
                    launchUrl(uri, mode: LaunchMode.externalApplication);
                  } catch (e) {
                    final logger = Provider.of<LogProvider>(
                      context,
                      listen: false,
                    );
                    logger.error('Could not launch url', e);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.extension_outlined),
                title: Text(AppLocalizations.of(context)!.proposeImprovement),
                subtitle: Text(
                  '${Uri.tryParse(AboutSubPage._issueUrl)?.host.toCapitalize()}',
                ),
                trailing: const Icon(Icons.open_in_new),
                onTap: () {
                  final uri = Uri.parse(AboutSubPage._issueUrl);

                  try {
                    launchUrl(uri, mode: LaunchMode.externalApplication);
                  } catch (e) {
                    final logger = Provider.of<LogProvider>(
                      context,
                      listen: false,
                    );
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
                trailing: const Icon(Icons.open_in_new),
                onTap: () {
                  final uri = Uri.parse(AboutSubPage._repoUrl);

                  try {
                    launchUrl(uri, mode: LaunchMode.externalApplication);
                  } catch (e) {
                    final logger = Provider.of<LogProvider>(
                      context,
                      listen: false,
                    );
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
                trailing: const Icon(Icons.open_in_new),
                onTap: () {
                  final uri = Uri.parse(AboutSubPage._translationUrl);

                  try {
                    launchUrl(uri, mode: LaunchMode.externalApplication);
                  } catch (e) {
                    final logger = Provider.of<LogProvider>(
                      context,
                      listen: false,
                    );
                    logger.error('Could not launch url', e);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.people_outline),
                title: Text(AppLocalizations.of(context)!.contributors),
                onTap: () {
                  _showContributorsDialog();
                },
              ),
            ],
          ),
          const SizedBox(height: pageSectionSpacing),
          SettingsGroup(
            children: [
              ListTile(
                leading: const Icon(Icons.mail_outline),
                title: Text(localizations.contact),
                subtitle: Text(AppLocalizations.of(context)!.emailHint),
                onTap: () {
                  final uri = Uri(
                    scheme: 'mailto',
                    path: AboutSubPage.email,
                    query:
                        'subject=Energize App Feedback&body=App Version $_appVersion',
                  );

                  try {
                    launchUrl(uri, mode: LaunchMode.externalApplication);
                  } catch (e) {
                    final logger = Provider.of<LogProvider>(
                      context,
                      listen: false,
                    );
                    logger.error('Could not launch url', e);
                  }
                },
              ),
            ],
          ),
        ],
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
                              _getContributors(
                                context,
                              )[index].contributionLine1!,
                            ),
                            if (_getContributors(
                                  context,
                                )[index].contributionLine2 !=
                                null)
                              Text(
                                _getContributors(
                                  context,
                                )[index].contributionLine2!,
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
}

extension StringCasingExtension on String {
  String toCapitalize() =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}
