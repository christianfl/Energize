import 'dart:async';

import 'package:flutter/material.dart';

/// Shows a progress indicator after [delay] has elapsed.
/// Until then, a blank page is displayed.
class DelayedLoadingIndicator extends StatefulWidget {
  final Duration delay;

  const DelayedLoadingIndicator({required this.delay, super.key});

  @override
  State<DelayedLoadingIndicator> createState() =>
      _DelayedLoadingIndicatorState();
}

class _DelayedLoadingIndicatorState extends State<DelayedLoadingIndicator> {
  Timer? _timer;
  bool _showIndicator = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.delay, () {
      if (mounted) setState(() => _showIndicator = true);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _showIndicator
        ? const Center(child: CircularProgressIndicator())
        : const SizedBox.expand();
  }
}
