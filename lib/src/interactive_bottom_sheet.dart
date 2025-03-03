import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interactive_bottom_sheet/src/indicator_widget.dart';
import 'package:interactive_bottom_sheet/src/options.dart';

/// The InteractiveBottomSheet.
class InteractiveBottomSheet extends StatefulWidget {
  /// Should be placed inside the bottomSheet property of a Scaffold.
  const InteractiveBottomSheet({
    super.key,
    this.options = const InteractiveBottomSheetOptions(),
    this.draggableAreaOptions = const DraggableAreaOptions(),
    this.child,
    this.footer,
  });

  /// Customization options for the [InteractiveBottomSheet].
  final InteractiveBottomSheetOptions options;

  /// Customization options for the DraggableArea.
  final DraggableAreaOptions draggableAreaOptions;

  /// Optional Widget placed inside the [InteractiveBottomSheet].
  final Widget? child;

  /// Optional Widget placed at the bottom of the [InteractiveBottomSheet].
  final Widget? footer;

  @override
  State<InteractiveBottomSheet> createState() => _InteractiveBottomSheetState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<InteractiveBottomSheetOptions>(
          'options',
          options,
        ),
      )
      ..add(
        DiagnosticsProperty<DraggableAreaOptions>(
          'draggableAreaOptions',
          draggableAreaOptions,
        ),
      );
  }
}

class _InteractiveBottomSheetState extends State<InteractiveBottomSheet> {
  late DraggableScrollableController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DraggableScrollableController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: widget.options.backgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(widget.draggableAreaOptions.topBorderRadius),
        ),
      ),
      child: DraggableScrollableSheet(
        expand: widget.options.expand,
        snap: widget.options.snap,
        minChildSize: widget.options.minimumSize,
        initialChildSize: widget.options.initialSize,
        maxChildSize: widget.options.maxSize,
        snapSizes: widget.options.snapList,
        controller: _controller,
        builder: (context, scrollController) => Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: widget.draggableAreaOptions.height,
              ),
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  if (widget.child != null) widget.child!,
                  if (widget.footer != null) widget.footer!,
                ],
              ),
            ),
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              controller: scrollController,
              child: _InteractiveBottomSheetDraggableArea(
                options: widget.draggableAreaOptions,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InteractiveBottomSheetDraggableArea extends StatelessWidget {
  const _InteractiveBottomSheetDraggableArea({
    required this.options,
  });

  final DraggableAreaOptions options;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: options.backgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(options.topBorderRadius),
        ),
        boxShadow: options.shadows,
      ),
      height: options.height,
      child: options.title != null
          ? Column(
              children: [
                IndicatorWidget(options: options),
                options.title!,
              ],
            )
          : IndicatorWidget(options: options),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<DraggableAreaOptions>('options', options));
  }
}
