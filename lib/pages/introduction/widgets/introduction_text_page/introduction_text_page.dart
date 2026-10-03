import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../utils/privacy_policy_dialog.dart';
import '../../../../widgets/info_card.dart';
import '../introduction_page_frame.dart';

/// Page shows some basic info, disclaimer, privacy notes.
class IntroductionTextPage extends StatelessWidget {
  final AppLocalizations localizations;

  const IntroductionTextPage({super.key, required this.localizations});

  @override
  Widget build(BuildContext context) {
    return IntroductionPageFrame(
      icon: Icons.waving_hand_outlined,
      title: localizations.welcomeToEnergize,
      children: [
        Text(localizations.introductionWelcomeText),
        const SizedBox(height: 20),
        InfoCard(
          icon: const Icon(Icons.health_and_safety_outlined),
          padding: const EdgeInsets.all(16),
          crossAxisAlignment: CrossAxisAlignment.start,
          message: localizations.nutritionGuidanceDisclaimer,
        ),
        const SizedBox(height: 12),
        InfoCard(
          icon: const Icon(Icons.lock_outline),
          padding: const EdgeInsets.all(16),
          crossAxisAlignment: CrossAxisAlignment.start,
          message: localizations.introductionDataPrivacyHint,
        ),
        const SizedBox(height: 8),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: TextButton.icon(
            onPressed: () => showPrivacyPolicyDialog(context),
            icon: const Icon(Icons.privacy_tip_outlined),
            label: Text(localizations.openPrivacyPolicy),
          ),
        ),
      ],
    );
  }
}
