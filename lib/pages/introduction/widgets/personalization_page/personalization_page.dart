import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../models/person/enums/sex.dart';
import '../../../../models/person/enums/weight_target.dart';
import '../../../../theme/energize_theme.dart';
import '../../../../utils/activity_level_description.dart';
import '../../../../widgets/positive_integer_field.dart';
import '../../../../widgets/responsive_field_pair.dart';
import '../introduction_page_frame.dart';

/// Page guides through setting personal body values to calculcate targets.
class PersonalizationPage extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController ageController;
  final TextEditingController weightController;
  final TextEditingController heightController;
  final Sex sex;
  final double activityLevel;
  final WeightTarget weightTarget;
  final bool targetsCalculated;
  final int currentStep;
  final ValueChanged<int> onStepChanged;
  final ValueChanged<Sex> onSexChanged;
  final ValueChanged<double> onActivityChanged;
  final ValueChanged<WeightTarget> onWeightTargetChanged;
  final VoidCallback onCalculateTargets;

  const PersonalizationPage({
    super.key,
    required this.formKey,
    required this.ageController,
    required this.weightController,
    required this.heightController,
    required this.sex,
    required this.activityLevel,
    required this.weightTarget,
    required this.targetsCalculated,
    required this.currentStep,
    required this.onStepChanged,
    required this.onSexChanged,
    required this.onActivityChanged,
    required this.onWeightTargetChanged,
    required this.onCalculateTargets,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return IntroductionPageFrame(
      icon: Icons.tune,
      title: localizations.easyPersonalization,
      subtitle: localizations.easyPersonalizationHint,
      children: [
        Form(
          key: formKey,
          child: Stepper(
            currentStep: currentStep,
            physics: const NeverScrollableScrollPhysics(),
            margin: EdgeInsets.zero,
            onStepTapped: onStepChanged,
            onStepContinue: currentStep < 2
                ? () => onStepChanged(currentStep + 1)
                : null,
            onStepCancel: currentStep > 0
                ? () => onStepChanged(currentStep - 1)
                : null,
            controlsBuilder: (context, details) {
              if (details.currentStep == 2) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    FilledButton(
                      onPressed: details.onStepContinue,
                      child: Text(localizations.next),
                    ),
                    if (details.currentStep > 0) ...[
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: details.onStepCancel,
                        child: Text(
                          MaterialLocalizations.of(context).backButtonTooltip,
                        ),
                      ),
                    ],
                  ],
                ),
              );
            },
            steps: [
              Step(
                title: Text('${localizations.age} & ${localizations.sex}'),
                state: currentStep > 0 ? StepState.complete : StepState.indexed,
                isActive: currentStep >= 0,
                content: ResponsiveFieldPair(
                  first: PositiveIntegerField(
                    controller: ageController,
                    label: localizations.age,
                    suffix: localizations.years,
                  ),
                  second: DropdownButtonFormField<Sex>(
                    initialValue: sex,
                    isExpanded: true,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: localizations.sex,
                    ),
                    items: Sex.values
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.toLocalizedString(context)),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) onSexChanged(value);
                    },
                  ),
                ),
              ),
              Step(
                title: Text(
                  '${localizations.weight} & ${localizations.height}',
                ),
                state: currentStep > 1 ? StepState.complete : StepState.indexed,
                isActive: currentStep >= 1,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ResponsiveFieldPair(
                      first: PositiveIntegerField(
                        controller: weightController,
                        label: localizations.weight,
                        suffix: 'kg',
                      ),
                      second: PositiveIntegerField(
                        controller: heightController,
                        label: localizations.height,
                        suffix: 'cm',
                      ),
                    ),
                  ],
                ),
              ),
              Step(
                title: Text(localizations.behaviourAndTarget),
                isActive: currentStep >= 2,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${localizations.activityLevel}: ${activityLevel.toStringAsFixed(1)}',
                          ),
                        ),
                        Tooltip(
                          message: activityLevelDescription(
                            localizations,
                            activityLevel,
                          ),
                          triggerMode: TooltipTriggerMode.tap,
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.info_outline, size: 20),
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: activityLevel,
                      min: 1,
                      max: 2,
                      divisions: 10,
                      label: activityLevel.toStringAsFixed(1),
                      onChanged: onActivityChanged,
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<WeightTarget>(
                      initialValue: weightTarget,
                      isExpanded: true,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: localizations.weightTarget,
                      ),
                      items: WeightTarget.values
                          .map(
                            (value) => DropdownMenuItem(
                              value: value,
                              child: Text(value.toLocalizedString(context)),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) onWeightTargetChanged(value);
                      },
                    ),
                    const SizedBox(height: 20),
                    FilledButton.tonalIcon(
                      onPressed: onCalculateTargets,
                      style: targetsCalculated
                          ? FilledButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).successContainer,
                              foregroundColor: Theme.of(
                                context,
                              ).onSuccessContainer,
                            )
                          : null,
                      icon: Icon(
                        targetsCalculated
                            ? Icons.check
                            : Icons.calculate_outlined,
                      ),
                      label: Text(
                        targetsCalculated
                            ? localizations.targetsSet
                            : localizations.calculateTargets,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
