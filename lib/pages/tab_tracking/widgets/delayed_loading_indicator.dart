import 'dart:async';

import 'package:flutter/material.dart';

/// Shows a progress indicator only when loading takes longer than one second.
class DelayedLoadingIndicator extends StatefulWidget {
  const DelayedLoadingIndicator({super.key});

  @override
  State<DelayedLoadingIndicator> createState() =>
      _DelayedLoadingIndicatorState();
}

class _DelayedLoadingIndicatorState extends State<DelayedLoadingIndicator> {
  Timer? _timer;
  var _showIndicator = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 1), () {
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
