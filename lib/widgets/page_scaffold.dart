import 'package:flutter/material.dart';

import '../config/layout_config.dart';
import 'constrained_width_content.dart';

/// Scaffold with improvements concerning max page content width.
class PageScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;

  /// Must use [FabEndOffsetX] so the button aligns with the content's end edge.
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final double maxContentWidth;

  const PageScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.maxContentWidth = defaultMaxContentWidth,
  }) : assert(
         floatingActionButtonLocation == null ||
             floatingActionButtonLocation is FabEndOffsetX,
         'floatingActionButtonLocation must use FabEndOffsetX.',
       );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: ConstrainedWidthContent(maxWidth: maxContentWidth, child: body),
      bottomNavigationBar: bottomNavigationBar == null
          ? null
          : ConstrainedWidthContent(
              maxWidth: maxContentWidth,
              child: bottomNavigationBar!,
            ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: _ContentFabLocation(
        floatingActionButtonLocation ?? FloatingActionButtonLocation.endFloat,
        maxContentWidth,
      ),
    );
  }
}

class _ContentFabLocation extends FloatingActionButtonLocation {
  final FloatingActionButtonLocation _baseLocation;
  final double _contentWidth;

  const _ContentFabLocation(this._baseLocation, this._contentWidth);

  // Rebuilding the same placement must not restart Scaffold's move animation.
  // Without this, the fab flickers on window resize.
  @override
  bool operator ==(Object other) =>
      other is _ContentFabLocation &&
      other._baseLocation == _baseLocation &&
      other._contentWidth == _contentWidth;

  @override
  int get hashCode => Object.hash(_baseLocation, _contentWidth);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final baseOffset = _baseLocation.getOffset(scaffoldGeometry);
    final horizontalInset =
        ((scaffoldGeometry.scaffoldSize.width - _contentWidth) / 2).clamp(
          0.0,
          double.infinity,
        );

    return baseOffset +
        Offset(
          scaffoldGeometry.textDirection == TextDirection.ltr
              ? -horizontalInset
              : horizontalInset,
          0.0,
        );
  }
}
