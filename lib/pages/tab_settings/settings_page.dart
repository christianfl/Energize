import 'package:flutter/material.dart';

import '../../config/layout_config.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/energize_theme.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/settings_group.dart';
import 'about_sub_page/about_sub_page.dart';
import 'backup_and_restore_sub_page.dart';
import 'database_management_sub_page.dart';
import 'donation_sub_page.dart';
import 'personalization_page/nutrition_targets_page.dart';
import 'ui_settings_sub_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  /// Builds a settings entry which opens another page.
  Widget _buildSettingsTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String routeName,
    String? subtitle,
    Color? tileColor,
    Color? foregroundColor,
  }) {
    return ListTile(
      tileColor: tileColor,
      textColor: foregroundColor,
      iconColor: foregroundColor,
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle == null ? null : Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => Navigator.of(context).pushNamed(routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return PageScaffold(
      maxContentWidth: settingsMaxContentWidth,
      appBar: AppBar(title: Text(localizations.settings)),
      body: ListView(
        padding: pagePadding,
        children: [
          SettingsGroup(
            children: [
              _buildSettingsTile(
                context,
                icon: Icons.person_outline,
                title: localizations.yourPersonalNutritionNeeds,
                routeName: NutritionTargetsPage.routeName,
                subtitle: localizations.personalNutritionNeedsHint,
              ),
              _buildSettingsTile(
                context,
                icon: Icons.display_settings_outlined,
                title: localizations.display,
                routeName: UISettingsSubPage.routeName,
                subtitle: localizations.displayHint,
              ),
            ],
          ),
          const SizedBox(height: pageSectionSpacing),
          SettingsGroup(
            children: [
              _buildSettingsTile(
                context,
                icon: Icons.storage_outlined,
                title: localizations.databaseManagement,
                routeName: DatabaseManagementSubPage.routeName,
                subtitle: localizations.databaseManagementHint,
              ),
              _buildSettingsTile(
                context,
                icon: Icons.import_export,
                title: localizations.backupAndRestore,
                routeName: BackupAndRestoreSubPage.routeName,
                subtitle: localizations.backupAndRestoreHint,
              ),
            ],
          ),
          const SizedBox(height: pageSectionSpacing),
          SettingsGroup(
            children: [
              _buildSettingsTile(
                context,
                icon: Icons.info_outline,
                title: localizations.aboutEnergize,
                routeName: AboutSubPage.routeName,
              ),
              _buildSettingsTile(
                context,
                icon: Icons.favorite_outline,
                title: localizations.supportMeByDonating,
                routeName: DonationSubPage.routeName,
                subtitle: 'Bitcoin, liberapay.com',
                tileColor: Theme.of(context).donateContainer,
                foregroundColor: Theme.of(context).onDonateContainer,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
