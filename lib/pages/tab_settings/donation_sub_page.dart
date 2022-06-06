import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationSubPage extends StatelessWidget {
  static const routeName = '/settings/donate';

  static const _bitcoinAddress = '35DcbAwi66LDyvxfpmvxVrM7nYrrZVC59k';
  static const _donationUrl = 'https://liberapay.com/epinez';
  static const _email = 'energize@flasskamp.com';

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
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  AppLocalizations.of(context)!.donationText,
                ),
              ),
              InkWell(
                onTap: () async {
                  try {
                    Clipboard.setData(ClipboardData(text: _bitcoinAddress));

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(AppLocalizations.of(context)!
                            .bitcoinAddressCopiedToClipboard),
                      ),
                    );
                  } catch (e) {}
                },
                child: ListTile(
                  leading: const Icon(Icons.currency_bitcoin),
                  title: Text('Bitcoin'),
                  subtitle: SelectableText(
                    _bitcoinAddress,
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: Icon(Icons.copy),
                ),
              ),
              InkWell(
                onTap: () async {
                  if (await canLaunch(_donationUrl)) {
                    await launch(_donationUrl);
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
                      AppLocalizations.of(context)!.bankAccountOrCreditCard),
                  subtitle: Text('liberapay.com'),
                  trailing: Icon(Icons.link),
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
                  subtitle: Text(AppLocalizations.of(context)!
                      .writeMeAnEmailForFurtherDonationOptions),
                  trailing: Icon(Icons.mail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
