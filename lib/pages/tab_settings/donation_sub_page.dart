import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.donate),
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  AppLocalizations.of(context)!.supportMeByDonating,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  AppLocalizations.of(context)!.donationText,
                ),
              ),
              InkWell(
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
                          AppLocalizations.of(context)!
                              .bitcoinAddressCopiedToClipboard,
                        ),
                      ),
                    );
                  } catch (e) {
                    //
                  }
                },
                child: const ListTile(
                  leading: Icon(Icons.currency_bitcoin),
                  title: Text('Bitcoin'),
                  subtitle: SelectableText(
                    DonationSubPage._bitcoinAddress,
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: Icon(Icons.copy),
                ),
              ),
              InkWell(
                onTap: () async {
                  final uri = Uri.parse(DonationSubPage._donationUrl);
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
                  leading: Image.asset(
                    'assets/liberapay_logo.png',
                    width: 28,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.bankAccountOrCreditCard,
                  ),
                  subtitle: const Text('liberapay.com'),
                  trailing: const Icon(Icons.link),
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
                  title: Text(AppLocalizations.of(context)!.contact),
                  subtitle: Text(
                    AppLocalizations.of(context)!
                        .writeMeAnEmailForFurtherDonationOptions,
                  ),
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
