import 'package:energize/l10n/app_localizations.dart';
import 'package:energize/models/app_settings.dart';
import 'package:energize/pages/introduction/introduction_page.dart';
import 'package:energize/providers/app_settings_provider.dart';
import 'package:energize/providers/body_targets_provider.dart';
import 'package:energize/providers/log_provider.dart';
import 'package:energize/services/food_database_bindings/open_food_facts/open_food_facts_binding.dart';
import 'package:energize/services/introduction_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../test_utils/key_value_storage_service_mock.dart';
import '../test_utils/log_service_mock.dart';

void main() {
  late KeyValueStorageServiceMock storage;
  late AppSettingsProvider settings;
  late BodyTargetsProvider targets;
  late IntroductionService introduction;
  late AppLocalizations localizations;
  late MaterialLocalizations material;

  Future<void> openIntroduction(
    WidgetTester tester, {
    bool isReplay = false,
    bool databasesActivated = false,
  }) async {
    storage = KeyValueStorageServiceMock();
    storage.keyValueStorage.addAll({
      AppSettings.isProviderSndbActivatedKey: databasesActivated,
      AppSettings.isProviderOpenFoodFactsActivatedKey: databasesActivated,
      AppSettings.isProviderUsdaActivatedKey: databasesActivated,
    });
    final logger = LogProvider();
    settings = AppSettingsProvider(keyValueStorage: storage, logger: logger);
    targets = BodyTargetsProvider(keyValueStorage: storage, logger: logger);
    introduction = IntroductionService(
      keyValueStorage: storage,
      logger: LogServiceMock(),
      hasExistingDatabase: () async => databasesActivated,
    );
    await Future.wait([settings.initialized, targets.initialized]);

    final navigator = GlobalKey<NavigatorState>();
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: settings),
          ChangeNotifierProvider.value(value: targets),
          Provider.value(value: introduction),
        ],
        child: MaterialApp(
          navigatorKey: navigator,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          // Keep a route underneath so closing and system back work as real.
          initialRoute: IntroductionPage.routeName,
          routes: {
            '/': (_) => const Scaffold(),
            IntroductionPage.routeName: (_) => IntroductionPage(
              isReplay: isReplay,
              onCompleted: () => navigator.currentState!.pop(),
            ),
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    final context = tester.element(find.byType(IntroductionPage));
    localizations = AppLocalizations.of(context)!;
    material = MaterialLocalizations.of(context);
  }

  Future<void> tapText(WidgetTester tester, String text) async {
    final finder = find.text(text).hitTestable();
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> enterNumber(WidgetTester tester, String label, String value) {
    return tester.enterText(find.widgetWithText(TextFormField, label), value);
  }

  Future<void> acceptConsent(WidgetTester tester) async {
    await tester.tap(find.byType(CheckboxListTile));
    await tester.pump();
    await tapText(tester, localizations.confirmAndActivate);
  }

  testWidgets('activates online databases only after accepting their notices', (
    tester,
  ) async {
    await openIntroduction(tester);
    await tapText(tester, localizations.next);
    await tapText(
      tester,
      OpenFoodFactsBinding().metadata.displayName(localizations),
    );

    expect(settings.isProviderOpenFoodFactsActivated, isFalse);
    // Confirming without checking the notice must not activate the database.
    await tapText(tester, localizations.confirmAndActivate);
    expect(settings.isProviderOpenFoodFactsActivated, isFalse);
    await acceptConsent(tester);
    expect(settings.isProviderOpenFoodFactsActivated, isTrue);
  });

  testWidgets('requires confirmation for pre-existing online activations', (
    tester,
  ) async {
    await openIntroduction(tester, databasesActivated: true);
    await tapText(tester, localizations.next);
    await tapText(tester, localizations.next);
    expect(find.text(localizations.confirmDatabaseActivation), findsOneWidget);

    await tapText(tester, material.cancelButtonLabel);
    expect(find.text(localizations.selectFoodDatabases), findsOneWidget);

    await tapText(tester, localizations.next);
    await acceptConsent(tester);
    expect(find.text(localizations.confirmDatabaseActivation), findsOneWidget);
    await acceptConsent(tester);
    expect(find.text(localizations.easyPersonalization), findsOneWidget);
  });

  testWidgets('validates inputs, applies targets, and completes intro', (
    tester,
  ) async {
    await openIntroduction(tester);
    await tapText(tester, localizations.next);
    await tapText(tester, localizations.next);

    // Missing inputs keep calculation from proceeding.
    await tester.ensureVisible(find.text(localizations.behaviourAndTarget));
    await tapText(tester, localizations.behaviourAndTarget);
    await tester.ensureVisible(find.text(localizations.calculateTargets));
    await tapText(tester, localizations.calculateTargets);
    expect(find.byType(SnackBar), findsOneWidget);
    expect(targets.caloriesTarget, 0);
    await tapText(tester, material.closeButtonLabel);

    // Enter personal values and then apply the previewed targets.
    await enterNumber(tester, localizations.age, '20');
    await tester.ensureVisible(find.text(localizations.notSpecified));
    await tapText(tester, localizations.notSpecified);
    await tester.tap(find.text(localizations.female).last);
    await tester.pumpAndSettle();
    await tapText(tester, localizations.next);
    await enterNumber(tester, localizations.weight, '80');
    await enterNumber(tester, localizations.height, '180');
    await tapText(tester, localizations.next);
    await tester.ensureVisible(find.text(localizations.calculateTargets));
    await tapText(tester, localizations.calculateTargets);
    expect(targets.caloriesTarget, 0);
    await tapText(tester, localizations.apply);
    expect(targets.caloriesTarget, 2329.6);
    expect(find.text(localizations.targetsSet), findsOneWidget);

    await tapText(tester, localizations.finish);
    expect(find.byType(IntroductionPage), findsNothing);
    expect(
      await introduction.completedVersion,
      IntroductionService.currentVersion,
    );
    expect(storage.keyValueStorage['sex'], 'female');
  });

  testWidgets(
    'replay can close, preserving saved changes and discarding draft edits',
    (tester) async {
      await openIntroduction(tester, isReplay: true, databasesActivated: true);
      await tapText(tester, localizations.next);
      await tapText(
        tester,
        OpenFoodFactsBinding().metadata.displayName(localizations),
      );
      await tapText(tester, localizations.next);
      // Previously enabled databases don't need confirmation in replay.
      expect(find.text(localizations.easyPersonalization), findsOneWidget);
      await enterNumber(tester, localizations.age, '35');
      await tester.tap(find.byTooltip(material.closeButtonTooltip));
      await tester.pumpAndSettle();

      expect(find.byType(IntroductionPage), findsNothing);
      expect(targets.age, isNull);
      expect(settings.isProviderOpenFoodFactsActivated, isFalse);
    },
  );

  for (final isReplay in [false, true]) {
    testWidgets(
      'system back ${isReplay ? 'closes replay' : 'keeps initial introduction open'}',
      (tester) async {
        await openIntroduction(tester, isReplay: isReplay);
        await tester.binding.handlePopRoute();
        await tester.pumpAndSettle();
        expect(
          find.byType(IntroductionPage),
          isReplay ? findsNothing : findsOneWidget,
        );
      },
    );
  }
}
