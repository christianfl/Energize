import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/app_settings_provider.dart';
import '../../providers/log_provider.dart';
import '../../services/food_database_bindings/open_food_facts/open_food_facts_binding.dart';
import '../../services/food_database_bindings/swiss_food_composition_database/swiss_food_composition_database_binding.dart';
import '../../services/food_database_bindings/usda/usda_binding.dart';

class DatabaseManagementSubPage extends StatefulWidget {
  static const routeName = '/settings/database-provider';

  const DatabaseManagementSubPage({super.key});

  @override
  DatabaseManagementSubPageState createState() =>
      DatabaseManagementSubPageState();
}

class DatabaseManagementSubPageState extends State<DatabaseManagementSubPage> {
  var _activeOfflinePanelIndex = -1;
  var _activeOnlinePanelIndex = -1;

  /// Returns an [Image.asset] with the given [imageUrl] on white background.
  Widget _foodDatabaseLogoContainer(String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      height: 160,
      width: double.infinity,
      child: Image.asset(
        imageUrl,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.databaseManagement),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.storedOnDevice,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16.0),
            ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  _activeOnlinePanelIndex = -1;
                  if (_activeOfflinePanelIndex == panelIndex) {
                    _activeOfflinePanelIndex = -1;
                  } else {
                    _activeOfflinePanelIndex = panelIndex;
                  }
                });
              },
              children: <ExpansionPanel>[
                ExpansionPanel(
                  isExpanded: _activeOfflinePanelIndex == 0,
                  canTapOnHeader: true,
                  headerBuilder: (context, isExpanded) {
                    return SwitchListTile(
                      title: Text(
                        AppLocalizations.of(context)!
                            .swissFoodCompositionDatabase,
                      ),
                      value: appSettings.isProviderSndbActivated,
                      onChanged: (val) =>
                          appSettings.isProviderSndbActivated = val,
                    );
                  },
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _foodDatabaseLogoContainer(
                        SwissFoodCompositionDatabaseBinding.imageUrl,
                      ),
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.version),
                        subtitle: const Text('6.5'),
                      ),
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.languages),
                        subtitle: Text(
                          '${AppLocalizations.of(context)!.english}, ${AppLocalizations.of(context)!.german}, ${AppLocalizations.of(context)!.italian}, ${AppLocalizations.of(context)!.french}',
                        ),
                      ),
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.publisher),
                        subtitle: Text(
                          '${AppLocalizations.of(context)!.federalFoodSafetyAndVeterinaryOffice}, ${AppLocalizations.of(context)!.switzerland}',
                        ),
                        isThreeLine: true,
                      ),
                      ListTile(
                        title: Text(
                          AppLocalizations.of(context)!.generalInformation,
                        ),
                        subtitle: Text(
                          AppLocalizations.of(context)!
                              .swissFoodCompositionDatabaseGeneralInformationText,
                        ),
                        isThreeLine: true,
                      ),
                      InkWell(
                        onTap: () {
                          final uri = Uri.parse(
                            SwissFoodCompositionDatabaseBinding.sourceUrl,
                          );

                          try {
                            launchUrl(
                              uri,
                              mode: LaunchMode.externalApplication,
                            );
                          } catch (e) {
                            final logger = Provider.of<LogProvider>(
                              context,
                              listen: false,
                            );
                            logger.error('Could not launch url', e);
                          }
                        },
                        child: ListTile(
                          title: Text(AppLocalizations.of(context)!.source),
                          subtitle: Text(
                            AppLocalizations.of(context)!
                                .tapHereForFurtherInformation,
                          ),
                          trailing: const Icon(Icons.link),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              AppLocalizations.of(context)!.serverBased,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16.0),
            ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  _activeOfflinePanelIndex = -1;
                  if (_activeOnlinePanelIndex == panelIndex) {
                    _activeOnlinePanelIndex = -1;
                  } else {
                    _activeOnlinePanelIndex = panelIndex;
                  }
                });
              },
              children: <ExpansionPanel>[
                ExpansionPanel(
                  isExpanded: _activeOnlinePanelIndex == 0,
                  canTapOnHeader: true,
                  headerBuilder: (context, isExpanded) {
                    return SwitchListTile(
                      title: const Text('Open Food Facts'),
                      value: appSettings.isProviderOpenFoodFactsActivated,
                      onChanged: (val) =>
                          appSettings.isProviderOpenFoodFactsActivated = val,
                    );
                  },
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _foodDatabaseLogoContainer(OpenFoodFactsBinding.imageUrl),
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.language),
                        subtitle: Text(
                          AppLocalizations.of(context)!
                              .openFoodFactsVariousLanguagesText,
                        ),
                      ),
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.publisher),
                        subtitle: Text(
                          '${AppLocalizations.of(context)!.nonProfitInstitution} Open Food Facts, ${AppLocalizations.of(context)!.france}',
                        ),
                        isThreeLine: true,
                      ),
                      ListTile(
                        title: Text(
                          AppLocalizations.of(context)!.generalInformation,
                        ),
                        subtitle: Text(
                          AppLocalizations.of(context)!
                              .openFoodFactsGeneralInformationText,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          final uri = Uri.parse(OpenFoodFactsBinding.termsUrl);

                          try {
                            launchUrl(
                              uri,
                              mode: LaunchMode.externalApplication,
                            );
                          } catch (e) {
                            final logger = Provider.of<LogProvider>(
                              context,
                              listen: false,
                            );
                            logger.error('Could not launch url', e);
                          }
                        },
                        child: ListTile(
                          title: Text(AppLocalizations.of(context)!.termsOfUse),
                          subtitle: Text(
                            AppLocalizations.of(context)!
                                .openFoodFactsTermsText,
                          ),
                          trailing: const Icon(Icons.link),
                          isThreeLine: true,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          final uri =
                              Uri.parse(OpenFoodFactsBinding.contributeUrl);

                          try {
                            launchUrl(
                              uri,
                              mode: LaunchMode.externalApplication,
                            );
                          } catch (e) {
                            final logger = Provider.of<LogProvider>(
                              context,
                              listen: false,
                            );
                            logger.error('Could not launch url', e);
                          }
                        },
                        child: ListTile(
                          title: Text(AppLocalizations.of(context)!.contribute),
                          subtitle: Text(
                            AppLocalizations.of(context)!
                                .databaseContributeText,
                          ),
                          trailing: const Icon(Icons.link),
                          isThreeLine: true,
                        ),
                      ),
                    ],
                  ),
                ),
                ExpansionPanel(
                  isExpanded: _activeOnlinePanelIndex == 1,
                  canTapOnHeader: true,
                  headerBuilder: (context, isExpanded) {
                    return SwitchListTile(
                      title: const Text('USDA FoodData Central'),
                      value: appSettings.isProviderUsdaActivated,
                      onChanged: (val) =>
                          appSettings.isProviderUsdaActivated = val,
                    );
                  },
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _foodDatabaseLogoContainer(
                        USDABinding.imageUrl,
                      ),
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.language),
                        subtitle: Text(AppLocalizations.of(context)!.english),
                      ),
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.publisher),
                        subtitle: const Text(
                          'U.S. Department of Agriculture, Agricultural Research Service. FoodData Central, 2019. fdc.nal.usda.gov.',
                        ),
                        isThreeLine: true,
                      ),
                      ListTile(
                        title: Text(
                          AppLocalizations.of(context)!.generalInformation,
                        ),
                        subtitle: Text(
                          AppLocalizations.of(context)!
                              .usdaFoodDataCentralGeneralInformationText,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          final uri = Uri.parse(USDABinding.sourceUrl);

                          try {
                            launchUrl(
                              uri,
                              mode: LaunchMode.externalApplication,
                            );
                          } catch (e) {
                            final logger = Provider.of<LogProvider>(
                              context,
                              listen: false,
                            );
                            logger.error('Could not launch url', e);
                          }
                        },
                        child: ListTile(
                          title: Text(AppLocalizations.of(context)!.source),
                          subtitle: Text(
                            AppLocalizations.of(context)!
                                .tapHereForFurtherInformation,
                          ),
                          trailing: const Icon(Icons.link),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
