import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interactive_bottom_sheet/src/options.dart';

/// A StatelessWidget that represents the IndicatorWidget.
///
/// This widget is responsible for creating and displaying the indicator
/// on the DraggableArea.
/// It uses the options provided in the [DraggableAreaOptions]
/// to customize the appearance of the indicator.
class IndicatorWidget extends StatelessWidget {
  /// Constructor for the [IndicatorWidget] class.
  ///
  /// This constructor requires
  /// an instance of [DraggableAreaOptions] to be passed
  /// as a parameter. This instance is used to customize the appearance of the
  /// DraggableArea. The `key` parameter is optional and can be used to control
  /// the framework's widget replacement and state preservation decisions.
  const IndicatorWidget({required this.options, super.key});

  /// The options for the DraggableArea.
  ///
  /// This is an instance of [DraggableAreaOptions] which contains all the
  /// customization options for the DraggableArea. It includes parameters like
  /// top border radius, height, background color, indicator color, indicator
  /// width, indicator height,
  /// indicator radius, shadows, and a builder function.
  final DraggableAreaOptions options;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: options.indicatorHeight,
        width: options.indicatorWidth,
        decoration: BoxDecoration(
          color: options.indicatorColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              options.indicatorRadius,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<DraggableAreaOptions>('options', options),
    );
  }
}
