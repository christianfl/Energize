import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/log_provider.dart';
import '../../services/food_database_bindings/food_database_binding_metadata.dart';
import '../../services/food_database_bindings/food_databases.dart';
import '../../widgets/food_database_switch_list_tile.dart';

class DatabaseManagementSubPage extends StatefulWidget {
  static const routeName = '/settings/database-provider';

  const DatabaseManagementSubPage({super.key});

  @override
  DatabaseManagementSubPageState createState() =>
      DatabaseManagementSubPageState();
}

class DatabaseManagementSubPageState extends State<DatabaseManagementSubPage> {
  String? _expandedOriginId;

  /// Returns an [Image.asset] with the given [imageUrl] on white background.
  Widget _foodDatabaseLogoContainer(String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      height: 160,
      width: double.infinity,
      child: Image.asset(imageUrl),
    );
  }

  /// Tries to open supplied URI in external Browser.
  void _openUrl(String uriString) {
    final uri = Uri.parse(uriString);

    try {
      launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      final logger = Provider.of<LogProvider>(context, listen: false);
      logger.error('Could not launch url', e);
    }
  }

  /// Tappable settings tile which opens an external link.
  Widget _linkTile(String title, String url, {String? subtitle}) {
    return ListTile(
      onTap: () => _openUrl(url),
      title: Text(title),
      subtitle: subtitle == null ? null : Text(subtitle),
      trailing: const Icon(Icons.link),
    );
  }

  /// Shows food database details in an expanded expansion panel.
  Widget _databaseDetails(FoodDatabaseBindingMetadata database) {
    final l = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _foodDatabaseLogoContainer(database.imageUrl),
        if (database.version case final version?)
          ListTile(title: Text(l.version), subtitle: Text(version)),
        ListTile(
          title: Text(
            database.supportedLanguages?.length == 1 ? l.language : l.languages,
          ),
          subtitle: Text(
            database.languageDescription?.call(l) ?? database.languagesLabel(l),
          ),
        ),
        if (database.publisher case final publisher?)
          ListTile(title: Text(l.publisher), subtitle: Text(publisher(l))),
        if (database.description case final description?)
          ListTile(
            title: Text(l.generalInformation),
            subtitle: Text(description(l)),
          ),
        if (database.sourceUrl case final url?)
          _linkTile(l.source, url, subtitle: l.tapHereForFurtherInformation),
        if (database.termsUrl case final url?)
          _linkTile(
            l.termsOfUse,
            url,
            subtitle: database.termsDescription?.call(l),
          ),
        if (database.contributeUrl case final url?)
          _linkTile(l.contribute, url, subtitle: l.databaseContributeText),
        if (database.privacyUrl case final url?)
          _linkTile(l.privacyPolicy, url),
      ],
    );
  }

  /// Builds one group per "offline" and "online" food databases.
  Widget _databaseGroup(bool isOnline, AppLocalizations l) {
    final databases = foodDatabases
        .map((binding) => binding.metadata)
        .where((database) => database.isOnline == isOnline)
        .toList();
    if (databases.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isOnline ? l.serverBased : l.storedOnDevice,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16.0),
        ExpansionPanelList(
          expansionCallback: (index, isExpanded) {
            setState(() {
              _expandedOriginId = _expandedOriginId == databases[index].originId
                  ? null
                  : databases[index].originId;
            });
          },
          children: [
            for (final database in databases)
              ExpansionPanel(
                isExpanded: _expandedOriginId == database.originId,
                canTapOnHeader: true,
                headerBuilder: (context, isExpanded) =>
                    FoodDatabaseSwitchListTile(database: database),
                body: _databaseDetails(database),
              ),
          ],
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l.databaseManagement)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final isOnline in [false, true]) _databaseGroup(isOnline, l),
          ],
        ),
      ),
    );
  }
}
