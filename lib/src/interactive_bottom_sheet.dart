import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interactive_bottom_sheet/src/options.dart';

/// The InteractiveBottomSheet.
class InteractiveBottomSheet extends StatefulWidget {
  /// Should be placed inside the bottomSheet property of a Scaffold
  const InteractiveBottomSheet({super.key, required this.options, this.child});

  /// Customization options
  final InteractiveBottomSheetOptions options;

  /// Optional Widget placed inside the BottomSheet
  final Widget? child;

  @override
  State<InteractiveBottomSheet> createState() => _InteractiveBottomSheetState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<InteractiveBottomSheetOptions>(
        'options',
        options,
      ),
    );
  }
}

class _InteractiveBottomSheetState extends State<InteractiveBottomSheet> {
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(widget.options.topBorderRadius),
        ),
      ),
      child: DraggableScrollableSheet(
        expand: widget.options.expand,
        snap: widget.options.snap,
        initialChildSize: widget.options.initialSize,
        maxChildSize: widget.options.maxSize,
        snapSizes: widget.options.snapList,
        controller: _draggableScrollableController,
        builder: (context, scrollController) {
          return Column(
            children: [
              if (widget.options.showDraggableArea)
                _InteractiveBottomSheetDraggableArea(widget: widget),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  primary: false,
                  child: widget.child ?? const SizedBox.shrink(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _InteractiveBottomSheetDraggableArea extends StatelessWidget {
  const _InteractiveBottomSheetDraggableArea({
    required this.widget,
  });

  final InteractiveBottomSheet widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.options.draggableAreaColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(widget.options.topBorderRadius),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
          ),
        ],
      ),
      height: widget.options.draggableAreaHeight,
      child: Center(
        child: Container(
          height: widget.options.draggableAreaIndicatorHeight,
          width: widget.options.draggableAreaIndicatorWidth,
          decoration: BoxDecoration(
            color: widget.options.draggableAreaIndicatorColor,
            borderRadius: BorderRadius.all(
              Radius.circular(
                widget.options.draggableAreaIndicatorRadius,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
