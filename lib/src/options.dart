import 'package:flutter/material.dart';

/// Options class.
class InteractiveBottomSheetOptions {
  ///  Contains all options for customization of the InteractiveBottomSheet.
  const InteractiveBottomSheetOptions({
    this.backgroundColor = Colors.white,
    this.expand = false,
    this.snap = true,
    this.maxSize = 1,
    this.initialSize = 0.25,
    this.minimumSize = 0.25,
    this.snapList = const [0.5],
  }) : assert(
          minimumSize <= initialSize,
          'MinimumSize must be smaller than or equal to initialSize.',
        );

  /// The background color of the whole widget.
  final Color backgroundColor;

  /// Decides, if the sheet snaps to the nearest position declared in snapList
  /// when if the user stops dragging.
  final bool snap;

  /// Decides, if the widget should expand to fill the available space in its
  /// parent or not.
  final bool expand;

  /// The initial height of the bottom sheet, goes from 0.0 to 1.0.
  /// Note that using values under 0.1 might create problems
  /// dragging the widget at all.
  final double initialSize;

  /// The maximum height of the bottom sheet.
  final double maxSize;

  /// The minimum height of the bottom sheet. The minimumSize must be smaller
  /// than or equal to initialSize.
  final double minimumSize;

  /// If snap is true, the bottom sheets snaps to the nearest point declared
  /// in this list when the user stops dragging.
  final List<double> snapList;
}

/// Options class for the DraggableArea.
class DraggableAreaOptions {
  ///  Contains all options for customization of the DraggableArea.
  const DraggableAreaOptions({
    this.topBorderRadius = 0.0,
    this.height = 50.0,
    this.backgroundColor = Colors.white,
    this.indicatorColor = Colors.black,
    this.indicatorWidth = 60.0,
    this.indicatorHeight = 5.0,
    this.indicatorRadius = 5.0,
    this.shadows = const [BoxShadow(color: Colors.grey, blurRadius: 1)],
  });

  /// Top Radius of the bottom sheet. To see it, a transparent background color
  /// for the bottomSheetTheme is necessary.
  final double topBorderRadius;

  /// The height of the DraggableArea.
  final double height;

  /// The color of the DraggableArea.
  final Color backgroundColor;

  /// The color of the Indicator.
  final Color indicatorColor;

  /// The width of the Indicator.
  final double indicatorWidth;

  /// The height of the Indicator.
  final double indicatorHeight;

  /// The top radius of the Indicator.
  final double indicatorRadius;

  /// Defines the shadow beneath the DraggableArea.
  final List<BoxShadow> shadows;
}
