import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_settings_provider.dart';
import '../providers/log_provider.dart';
import '../services/food_database_bindings/food_database_binding_metadata.dart';
import '../services/food_database_bindings/food_databases.dart';

/// Changes a database activation after obtaining any required consent.
Future<bool> setFoodDatabaseActivation(
  BuildContext context,
  FoodDatabaseBindingMetadata database,
  bool activate,
) async {
  final settings = context.read<AppSettingsProvider>();

  if (activate && database.requiresActivationConfirmation) {
    final accepted = await requestFoodDatabaseActivationConsent(
      context,
      database,
    );
    if (!accepted || !context.mounted) return false;
  }

  return settings.setFoodDatabaseActivated(database.originName, activate);
}

/// Ensures every activated database has its current notice confirmed.
Future<bool> ensureEnabledFoodDatabaseConsents(
  BuildContext context, {
  required Set<String> confirmedDatabases,
}) async {
  final settings = context.read<AppSettingsProvider>();

  for (final binding in foodDatabases) {
    final database = binding.metadata;
    if (!settings.isFoodDatabaseActivated(database.originName) ||
        !database.requiresActivationConfirmation ||
        confirmedDatabases.contains(database.originName)) {
      continue;
    }

    if (!context.mounted ||
        !await requestFoodDatabaseActivationConsent(context, database)) {
      return false;
    }
    confirmedDatabases.add(database.originName);
  }

  return true;
}

/// Asks users to confirm the current database activation notice.
Future<bool> requestFoodDatabaseActivationConsent(
  BuildContext context,
  FoodDatabaseBindingMetadata database,
) async {
  var checked = false;
  final localizations = AppLocalizations.of(context)!;

  final confirmed = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text(localizations.confirmDatabaseActivation),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localizations.databaseActivationExplanation(
                      database.displayName(localizations),
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (database.termsUrl case final termsUrl?)
                    TextButton.icon(
                      onPressed: () => _openUrl(context, termsUrl),
                      icon: const Icon(Icons.open_in_new),
                      label: Text(localizations.termsOfUse),
                    ),
                  if (database.privacyUrl case final privacyUrl?)
                    TextButton.icon(
                      onPressed: () => _openUrl(context, privacyUrl),
                      icon: const Icon(Icons.open_in_new),
                      label: Text(localizations.privacyPolicy),
                    ),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: checked,
                    onChanged: (value) {
                      setState(() => checked = value ?? false);
                    },
                    title: Text(localizations.databaseActivationCheckbox),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext, false),
                child: Text(
                  MaterialLocalizations.of(context).cancelButtonLabel,
                ),
              ),
              FilledButton(
                onPressed: checked
                    ? () => Navigator.pop(dialogContext, true)
                    : null,
                child: Text(localizations.confirmAndActivate),
              ),
            ],
          );
        },
      );
    },
  );

  return confirmed == true;
}

Future<void> _openUrl(BuildContext context, String url) async {
  try {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } catch (e, st) {
    if (context.mounted) {
      context.read<LogProvider>().error('Could not launch url', e, st);
    }
  }
}
