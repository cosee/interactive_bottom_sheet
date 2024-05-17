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
  });

  /// Customization options for the [InteractiveBottomSheet].
  final InteractiveBottomSheetOptions options;

  /// Customization options for the DraggableArea.
  final DraggableAreaOptions draggableAreaOptions;

  /// Optional Widget placed inside the [InteractiveBottomSheet].
  final Widget? child;

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
        initialChildSize: widget.options.initialSize,
        maxChildSize: widget.options.maxSize,
        snapSizes: widget.options.snapList,
        controller: _controller,
        builder: (context, scrollController) {
          return Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: widget.draggableAreaOptions.height,
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: widget.child,
                    ),
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
          );
        },
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
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: IndicatorWidget(options: options),
                ),
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
