import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../models/person/enums/sex.dart';
import '../../models/person/enums/weight_target.dart';
import '../../providers/app_settings_provider.dart';
import '../../providers/body_targets_provider.dart';
import '../../services/food_database_bindings/food_databases.dart';
import '../../services/introduction_service.dart';
import '../../services/nutrition_targets_calculator/nutrition_targets_calculator.dart';
import '../../utils/food_database_activation.dart';
import 'widgets/database_selection_page/database_selection_page.dart';
import 'widgets/introduction_text_page/introduction_text_page.dart';
import 'widgets/nutrition_targets_preview_dialog.dart';
import 'widgets/personalization_page/personalization_page.dart';

/// Steps through guidance, databases, and personalization.
class IntroductionPage extends StatefulWidget {
  static const routeName = '/introduction';

  final VoidCallback onCompleted;
  final bool isReplay;

  const IntroductionPage({
    super.key,
    required this.onCompleted,
    this.isReplay = false,
  });

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final _pageController = PageController();
  final _personalizationFormKey = GlobalKey<FormState>();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _confirmedDatabases = <String>{};

  var _page = 0;
  var _draftInitialized = false;
  var _isSaving = false;
  var _targetsCalculated = false;
  var _personalizationStep = 0;

  // Initialize from the provider before building.
  late Sex _sex;
  late double _activityLevel;
  late WeightTarget _weightTarget;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_draftInitialized) return;

    final targets = context.read<BodyTargetsProvider>();
    _ageController.text = targets.age?.toString() ?? '';
    _weightController.text = targets.weight?.toString() ?? '';
    _heightController.text = targets.height?.toString() ?? '';
    _sex = targets.sex;
    _activityLevel = targets.activityLevel;
    _weightTarget = targets.weightTarget;
    _ageController.addListener(_markPersonalizationChanged);
    _weightController.addListener(_markPersonalizationChanged);
    _heightController.addListener(_markPersonalizationChanged);
    if (widget.isReplay) {
      final settings = context.read<AppSettingsProvider>();
      _confirmedDatabases.addAll(
        foodDatabases
            .map((binding) => binding.metadata)
            .map((database) => database.originName)
            .where(settings.isFoodDatabaseActivated),
      );
    }
    _draftInitialized = true;
  }

  @override
  void dispose() {
    _pageController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  Future<void> _goForward() async {
    if (_isSaving) return;

    FocusManager.instance.primaryFocus?.unfocus();
    setState(() => _isSaving = true);
    try {
      if (_page == 1) {
        final accepted = await ensureEnabledFoodDatabaseConsents(
          context,
          confirmedDatabases: _confirmedDatabases,
        );
        if (!accepted || !mounted) return;
      }

      if (_page < 2) {
        await _pageController.nextPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
        return;
      }

      final completed = widget.isReplay
          ? true
          : await context.read<IntroductionService>().complete();
      if (!mounted) return;

      if (completed) {
        widget.onCompleted();
      } else {
        _showSaveError();
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  void _markPersonalizationChanged() {
    setState(() => _targetsCalculated = false);
  }

  void _changePersonalization(VoidCallback change) {
    setState(() {
      change();
      _targetsCalculated = false;
    });
  }

  Future<void> _calculateTargets() async {
    if (_isSaving) return;
    final missingStep = _firstIncompleteCalculationStep;
    if (missingStep != null) {
      setState(() => _personalizationStep = missingStep);
      final localizations = AppLocalizations.of(context)!;
      final messenger = ScaffoldMessenger.of(context);
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            localizations.targetCalculationRequirementsText(
              localizations.age,
              localizations.weight,
              localizations.height,
              localizations.female,
              localizations.male,
            ),
          ),
          action: SnackBarAction(
            label: MaterialLocalizations.of(context).closeButtonLabel,
            onPressed: messenger.hideCurrentSnackBar,
          ),
        ),
      );

      return;
    }

    if (!_personalizationFormKey.currentState!.validate()) return;

    final age = int.tryParse(_ageController.text);
    final weight = int.tryParse(_weightController.text);
    final height = int.tryParse(_heightController.text);
    if (age == null ||
        weight == null ||
        height == null ||
        !_hasCalculationReference) {
      return;
    }

    final bodyTargets = context.read<BodyTargetsProvider>();
    final targets = NutritionTargetsCalculator.calculate(
      age: age,
      sex: _sex,
      weight: weight,
      height: height,
      activityLevel: _activityLevel,
      weightTarget: _weightTarget,
      proteinRatio: bodyTargets.proteinRatio,
      carbsRatio: bodyTargets.carbsRatio,
      fatRatio: bodyTargets.fatRatio,
    );
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() => _isSaving = true);
    try {
      final apply = await showDialog<bool>(
        context: context,
        builder: (context) => NutritionTargetsPreviewDialog(targets: targets),
      );
      if (apply != true || !mounted) return;

      final personalizationSaved = await bodyTargets.savePersonalization(
        age: age,
        sex: _sex,
        weight: weight,
        height: height,
        activityLevel: _activityLevel,
        weightTarget: _weightTarget,
      );
      final targetsSaved =
          personalizationSaved &&
          await bodyTargets.saveCalculatedNutritionTargets(targets);
      if (!mounted) return;

      setState(() => _targetsCalculated = targetsSaved);
      if (!targetsSaved) _showSaveError();
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  void _showSaveError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.settingsSaveError)),
    );
  }

  void _goBack() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  /// Returns the step to show when calculation inputs are missing or invalid:
  /// 0 for age/sex, 1 for weight/height, or null when all inputs are valid.
  int? get _firstIncompleteCalculationStep {
    if (!_hasPositiveValue(_ageController) || !_hasCalculationReference) {
      return 0;
    }
    if (!_hasPositiveValue(_weightController) ||
        !_hasPositiveValue(_heightController)) {
      return 1;
    }
    return null;
  }

  /// Whether [controller] contains a positive whole number.
  bool _hasPositiveValue(TextEditingController controller) {
    final value = int.tryParse(controller.text);
    return value != null && value > 0;
  }

  /// Whether used formula provides a reference for selected sex.
  bool get _hasCalculationReference {
    return _sex == Sex.female || _sex == Sex.male;
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return PopScope(
      canPop: widget.isReplay && !_isSaving,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(localizations.introductionTitle),
          actions: [
            if (widget.isReplay)
              IconButton(
                tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
                onPressed: _isSaving ? null : () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              LinearProgressIndicator(value: (_page + 1) / 3),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (page) => setState(() => _page = page),
                  children: [
                    IntroductionTextPage(localizations: localizations),
                    DatabaseSelectionPage(
                      onDatabaseActivated: (database) =>
                          _confirmedDatabases.add(database.originName),
                    ),
                    ExcludeFocus(
                      excluding: _isSaving,
                      child: AbsorbPointer(
                        absorbing: _isSaving,
                        child: PersonalizationPage(
                          formKey: _personalizationFormKey,
                          ageController: _ageController,
                          weightController: _weightController,
                          heightController: _heightController,
                          sex: _sex,
                          activityLevel: _activityLevel,
                          weightTarget: _weightTarget,
                          targetsCalculated: _targetsCalculated,
                          currentStep: _personalizationStep,
                          onStepChanged: (step) =>
                              setState(() => _personalizationStep = step),
                          onSexChanged: (value) =>
                              _changePersonalization(() => _sex = value),
                          onActivityChanged: (value) => _changePersonalization(
                            () => _activityLevel = value,
                          ),
                          onWeightTargetChanged: (value) =>
                              _changePersonalization(
                                () => _weightTarget = value,
                              ),
                          onCalculateTargets: _calculateTargets,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    if (_page > 0)
                      TextButton(
                        onPressed: _isSaving ? null : _goBack,
                        child: Text(
                          MaterialLocalizations.of(context).backButtonTooltip,
                        ),
                      ),
                    const Spacer(),
                    if (_page == 2 && !_targetsCalculated)
                      TextButton(
                        onPressed: _isSaving ? null : _goForward,
                        child: Text(localizations.skip),
                      )
                    else
                      FilledButton(
                        onPressed: _isSaving ? null : _goForward,
                        child: Text(
                          _page == 2
                              ? localizations.finish
                              : localizations.next,
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
