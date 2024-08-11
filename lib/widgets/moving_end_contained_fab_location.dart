import 'package:flutter/material.dart';

class MovingEndContainedFabLocation extends StandardFabLocation
    with FabEndOffsetX, FabContainedOffsetY {
  /// Same as [FloatingActionButtonLocation.endContained], but moves with the keyboard.
  const MovingEndContainedFabLocation();
  @override
  double getOffsetY(
    ScaffoldPrelayoutGeometry scaffoldGeometry,
    double adjustment,
  ) {
    final double keyboardPadding = scaffoldGeometry.minInsets.bottom / 2;
    return super.getOffsetY(scaffoldGeometry, adjustment) - keyboardPadding;
  }
}
