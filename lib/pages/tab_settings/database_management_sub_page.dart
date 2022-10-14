import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../providers/app_settings.dart';
import '../../services/food_database_bindings/open_food_facts/open_food_facts_binding.dart';
import '../../services/food_database_bindings/swiss_food_composition_database/swiss_food_composition_database_binding.dart';
import '../../services/food_database_bindings/usda/usda_binding.dart';
import '../../widgets/food_origin_logo_pill.dart';

class DatabaseManagementSubPage extends StatefulWidget {
  static const routeName = '/settings/database-provider';

  static const double _dbImageWidth = 80;
  static const double _dbImageHeight = 50;

  const DatabaseManagementSubPage({Key? key}) : super(key: key);

  @override
  _DatabaseManagementSubPageState createState() =>
      _DatabaseManagementSubPageState();
}

class _DatabaseManagementSubPageState extends State<DatabaseManagementSubPage> {
  var _activeOfflinePanelIndex = -1;
  var _activeOnlinePanelIndex = -1;

  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);

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
              style: Theme.of(context).textTheme.headline4,
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
                      secondary: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Container(
                          width: DatabaseManagementSubPage._dbImageWidth,
                          height: DatabaseManagementSubPage._dbImageHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: const FoodOriginLogoPill(
                              SwissFoodCompositionDatabaseBinding.originName),
                        ),
                      ),
                      title: Text(AppLocalizations.of(context)!
                          .swissFoodCompositionDatabase),
                      value: appSettings.isProviderSndbActivated,
                      onChanged: (val) =>
                          appSettings.isProviderSndbActivated = val,
                    );
                  },
                  body: Column(
                    children: [
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.language),
                        subtitle: Text(AppLocalizations.of(context)!.german),
                      ),
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.publisher),
                        subtitle: Text(
                            'Bundesamt für Lebensmittelsicherheit und Veterinärwesen, ${AppLocalizations.of(context)!.switzerland}'),
                        isThreeLine: true,
                      ),
                      ListTile(
                        title: Text(
                            AppLocalizations.of(context)!.generalInformation),
                        subtitle: Text(AppLocalizations.of(context)!
                            .swissFoodCompositionDatabaseGeneralInformationText),
                        isThreeLine: true,
                      ),
                      InkWell(
                        onTap: () async {
                          final uri = Uri.parse(
                              SwissFoodCompositionDatabaseBinding.sourceUrl);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            throw 'Could not launch url';
                          }
                        },
                        child: ListTile(
                          title: Text(AppLocalizations.of(context)!.source),
                          subtitle: Text(AppLocalizations.of(context)!
                              .tapHereForFurtherInformation),
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
              style: Theme.of(context).textTheme.headline4,
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
                      secondary: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Container(
                          width: DatabaseManagementSubPage._dbImageWidth,
                          height: DatabaseManagementSubPage._dbImageHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              OpenFoodFactsBinding.imageUrl,
                            ),
                          ),
                        ),
                      ),
                      title: const Text('Open Food Facts'),
                      value: appSettings.isProviderOpenFoodFactsActivated,
                      onChanged: (val) =>
                          appSettings.isProviderOpenFoodFactsActivated = val,
                    );
                  },
                  body: Column(
                    children: [
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.language),
                        subtitle: Text(AppLocalizations.of(context)!
                            .openFoodFactsVariousLanguagesText),
                      ),
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.publisher),
                        subtitle: Text(
                            '${AppLocalizations.of(context)!.nonProfitInstitution} Open Food Facts ("OFF"), ${AppLocalizations.of(context)!.france}'),
                        isThreeLine: true,
                      ),
                      ListTile(
                        title: Text(
                            AppLocalizations.of(context)!.generalInformation),
                        subtitle: Text(AppLocalizations.of(context)!
                            .openFoodFactsGeneralInformationText),
                      ),
                      InkWell(
                        onTap: () async {
                          final uri = Uri.parse(OpenFoodFactsBinding.termsUrl);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            throw 'Could not launch url';
                          }
                        },
                        child: ListTile(
                          title: Text(AppLocalizations.of(context)!.termsOfUse),
                          subtitle: Text(AppLocalizations.of(context)!
                              .openFoodFactsTermsText),
                          trailing: const Icon(Icons.link),
                          isThreeLine: true,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final uri =
                              Uri.parse(OpenFoodFactsBinding.contributeUrl);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            throw 'Could not launch url';
                          }
                        },
                        child: ListTile(
                          title: Text(AppLocalizations.of(context)!.contribute),
                          subtitle: Text(AppLocalizations.of(context)!
                              .databaseContributeText),
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
                      secondary: const Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: SizedBox(
                          width: DatabaseManagementSubPage._dbImageWidth,
                          child: FoodOriginLogoPill(
                            USDABinding.originName,
                            height: DatabaseManagementSubPage._dbImageHeight,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      title: const Text('USDA FoodData Central'),
                      value: appSettings.isProviderUsdaActivated,
                      onChanged: (val) =>
                          appSettings.isProviderUsdaActivated = val,
                    );
                  },
                  body: Column(
                    children: [
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.language),
                        subtitle: Text(AppLocalizations.of(context)!.english),
                      ),
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.publisher),
                        subtitle: const Text(
                            'U.S. Department of Agriculture, Agricultural Research Service. FoodData Central, 2019. fdc.nal.usda.gov.'),
                        isThreeLine: true,
                      ),
                      ListTile(
                        title: Text(
                            AppLocalizations.of(context)!.generalInformation),
                        subtitle: Text(AppLocalizations.of(context)!
                            .usdaFoodDataCentralGeneralInformationText),
                      ),
                      InkWell(
                        onTap: () async {
                          final uri = Uri.parse(USDABinding.sourceUrl);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            throw 'Could not launch url';
                          }
                        },
                        child: ListTile(
                          title: Text(AppLocalizations.of(context)!.source),
                          subtitle: Text(AppLocalizations.of(context)!
                              .tapHereForFurtherInformation),
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
