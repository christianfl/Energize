import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/layout_config.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/log_provider.dart';
import '../../theme/energize_theme.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/settings_group.dart';
import 'about_sub_page/about_sub_page.dart';

class DonationSubPage extends StatefulWidget {
  static const routeName = '/settings/donate';

  static const _bitcoinAddress = '35DcbAwi66LDyvxfpmvxVrM7nYrrZVC59k';
  static const _donationUrl = 'https://liberapay.com/epinez';

  const DonationSubPage({super.key});

  @override
  State<DonationSubPage> createState() => _DonationSubPageState();
}

class _DonationSubPageState extends State<DonationSubPage> {
  String _appVersion = '';

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

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return PageScaffold(
      maxContentWidth: settingsMaxContentWidth,
      appBar: AppBar(title: Text(localizations.donate)),
      body: ListView(
        padding: pagePadding,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: theme.donateContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.favorite_outline,
                  size: 32.0,
                  color: theme.onDonateContainer,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                localizations.supportMeByDonating,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 12.0),
              Text(
                localizations.donationText,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: pageSectionSpacing),
          SettingsGroup(
            children: [
              ListTile(
                leading: const Icon(Icons.currency_bitcoin),
                title: const Text('Bitcoin'),
                subtitle: const SelectableText(DonationSubPage._bitcoinAddress),
                trailing: const Icon(Icons.copy_outlined),
                onTap: () {
                  try {
                    Clipboard.setData(
                      const ClipboardData(
                        text: DonationSubPage._bitcoinAddress,
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          AppLocalizations.of(
                            context,
                          )!.bitcoinAddressCopiedToClipboard,
                        ),
                      ),
                    );
                  } catch (e) {
                    //
                  }
                },
              ),
              ListTile(
                leading: Image.asset('assets/liberapay_logo.png', width: 28),
                title: Text(
                  AppLocalizations.of(context)!.bankAccountOrCreditCard,
                ),
                subtitle: const Text('liberapay.com'),
                trailing: const Icon(Icons.open_in_new),
                onTap: () {
                  final uri = Uri.parse(DonationSubPage._donationUrl);

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
          const SizedBox(height: pageSectionSpacing),
          SettingsGroup(
            children: [
              ListTile(
                leading: const Icon(Icons.mail_outline),
                title: Text(AppLocalizations.of(context)!.contact),
                subtitle: Text(
                  AppLocalizations.of(
                    context,
                  )!.writeMeAnEmailForFurtherDonationOptions,
                ),
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
}
