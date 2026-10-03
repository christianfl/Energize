import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';
import '../providers/log_provider.dart';

const _privacyPolicyAsset = 'assets/PRIVACY.md';

/// Opens Energize's bundled privacy policy in full-screen dialog.
Future<void> showPrivacyPolicyDialog(BuildContext context) async {
  // Load privacy policy from local markdown file
  String privacyPolicyMarkdown = await rootBundle.loadString(
    _privacyPolicyAsset,
  );

  // Remove first line which contains the title
  final endOfFirstLineIndex = privacyPolicyMarkdown.indexOf('\n');
  privacyPolicyMarkdown = privacyPolicyMarkdown.substring(endOfFirstLineIndex);

  if (!context.mounted) {
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
                  launchUrl(uri, mode: LaunchMode.externalApplication);
                } catch (e) {
                  final logger = Provider.of<LogProvider>(
                    context,
                    listen: false,
                  );
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
