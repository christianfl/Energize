import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/app_settings_provider.dart';
import '../../providers/body_targets_provider.dart';
import '../../providers/log_provider.dart';
import '../../services/introduction_service.dart';
import '../../widgets/delayed_loading_indicator.dart';
import '../tabs_page.dart';
import 'introduction_page.dart';

/// Gate that decides to show which of the following Widgets:
///
/// - If current intro version has not been seen, returns [IntroductionPage].
/// - If current intro has already be seen, returns [TabsPage].
class IntroductionGate extends StatefulWidget {
  const IntroductionGate({super.key});

  @override
  State<IntroductionGate> createState() => _IntroductionGateState();
}

class _IntroductionGateState extends State<IntroductionGate> {
  Future<bool>? _preparation;
  var _completed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _preparation ??= _prepare();
  }

  Future<bool> _prepare() async {
    final appSettings = context.read<AppSettingsProvider>();
    final bodyTargets = context.read<BodyTargetsProvider>();
    final introduction = context.read<IntroductionService>();
    final logger = context.read<LogProvider>();

    try {
      await Future.wait([appSettings.initialized, bodyTargets.initialized]);
      return await introduction.prepare(appSettings);
    } catch (e, st) {
      logger.error('Could not prepare the introduction', e, st);
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_completed) return const TabsPage();

    return FutureBuilder<bool>(
      future: _preparation,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasError) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(AppLocalizations.of(context)!.unknownErrorText),
                      const SizedBox(height: 16),
                      FilledButton.icon(
                        onPressed: () =>
                            setState(() => _preparation = _prepare()),
                        icon: const Icon(Icons.refresh),
                        label: Text(
                          MaterialLocalizations.of(
                            context,
                          ).refreshIndicatorSemanticLabel,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        if (!snapshot.hasData) {
          return const Scaffold(
            body: DelayedLoadingIndicator(delay: Duration(seconds: 3)),
          );
        }
        if (!snapshot.data!) return const TabsPage();

        return IntroductionPage(
          onCompleted: () => setState(() => _completed = true),
        );
      },
    );
  }
}
