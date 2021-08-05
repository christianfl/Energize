import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/food.dart';
import '../../providers/app_settings.dart';

class DatabaseManagementSubPage extends StatefulWidget {
  static const routeName = '/settings/database-provider';

  @override
  _DatabaseManagementSubPageState createState() =>
      _DatabaseManagementSubPageState();
}

class _DatabaseManagementSubPageState extends State<DatabaseManagementSubPage> {
  var activePanelIndex = -1;
  static const double _datebaseImageWidth = 80;
  static const double _databaseImageHeight = 50;

  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Database management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                if (activePanelIndex == panelIndex) {
                  activePanelIndex = -1;
                } else {
                  activePanelIndex = panelIndex;
                }
              });
            },
            children: <ExpansionPanel>[
              ExpansionPanel(
                isExpanded: activePanelIndex == 0,
                canTapOnHeader: true,
                headerBuilder: (context, isExpanded) {
                  return SwitchListTile(
                    secondary: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Container(
                        width: _datebaseImageWidth,
                        height: _databaseImageHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            Food.openFoodFactsImageUrl,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'Open Food Facts',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    value: appSettings.isProviderOpenFoodFactsActivated,
                    onChanged: (val) =>
                        appSettings.isProviderOpenFoodFactsActivated = val,
                  );
                },
                body: Column(
                  children: [
                    ListTile(
                      title: Text('Publisher'),
                      subtitle: Text(
                          'Non-profit institution Open Food Facts ("OFF"), France'),
                    ),
                    ListTile(
                      title: Text('General information'),
                      subtitle: Text(
                          'Please be aware that whereas this database is very large, entries can be incomplete or out-of-date. Every registered user can update nutrient values. Adding new products is possible without creating an account. Deactivating this entry does not include EAN scanning as this uses OFF by default.'),
                    ),
                    InkWell(
                      onTap: () async {
                        if (await canLaunch(Food.openFoodFactsTermsUrl)) {
                          await launch(Food.openFoodFactsTermsUrl);
                        } else {
                          throw 'Could not launch url';
                        }
                      },
                      child: ListTile(
                        title: Text('Terms of use'),
                        subtitle: Text(
                            'By activating this database you agree to the terms.'),
                        trailing: Icon(Icons.link),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (await canLaunch(Food.openFoodFactsContributeUrl)) {
                          await launch(Food.openFoodFactsContributeUrl);
                        } else {
                          throw 'Could not launch url';
                        }
                      },
                      child: ListTile(
                        title: Text('Contribute'),
                        subtitle: Text(
                            'See how you can help improving this database.'),
                        trailing: Icon(Icons.link),
                      ),
                    ),
                  ],
                ),
              ),
              ExpansionPanel(
                isExpanded: activePanelIndex == 1,
                canTapOnHeader: true,
                headerBuilder: (context, isExpanded) {
                  return SwitchListTile(
                    secondary: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Container(
                        width: _datebaseImageWidth,
                        height: _databaseImageHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            Food.swissNutritionDatabaseImageUrl,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'Swiss Nutrition Database',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    value: appSettings.isProviderSndbActivated,
                    onChanged: (val) =>
                        appSettings.isProviderSndbActivated = val,
                  );
                },
                body: Column(
                  children: [
                    ListTile(
                      title: Text('Publisher'),
                      subtitle: Text(
                          'Bundesamt für Lebensmittelsicherheit und Veterinärwesen, Switzerland'),
                    ),
                    ListTile(
                      title: Text('General information'),
                      subtitle: Text(
                          'This database offers about 1.100 general products and many micronutrients. It is stored on your device and therefore works offline.'),
                    ),
                    InkWell(
                      onTap: () async {
                        if (await canLaunch(Food.swissNutritionDatabaseUrl)) {
                          await launch(Food.swissNutritionDatabaseUrl);
                        } else {
                          throw 'Could not launch url';
                        }
                      },
                      child: ListTile(
                        title: Text('Source'),
                        subtitle: Text('Tap here for futher information.'),
                        trailing: Icon(Icons.link),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
