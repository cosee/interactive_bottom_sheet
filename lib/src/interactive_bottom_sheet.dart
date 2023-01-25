import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  /// Customization options for the [InteractiveBottomSheet]
  final InteractiveBottomSheetOptions options;

  /// Customization options for the DraggableArea
  final DraggableAreaOptions draggableAreaOptions;

  /// Optional Widget placed inside the [InteractiveBottomSheet]
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
          return CustomScrollView(
            controller: scrollController,
            slivers: [
              if (widget.options.showDraggableArea)
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _InteractiveBottomSheetDraggableArea(
                    options: widget.draggableAreaOptions,
                  ),
                ),
              SliverIgnorePointer(
                sliver: SliverToBoxAdapter(
                  child: widget.child,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _InteractiveBottomSheetDraggableArea
    extends SliverPersistentHeaderDelegate {
  const _InteractiveBottomSheetDraggableArea({
    required this.options,
  });

  final DraggableAreaOptions options;

  @override
  Widget build(BuildContext context, _, __) {
    return Container(
      decoration: BoxDecoration(
        color: options.draggableAreaColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(options.topBorderRadius),
        ),
        boxShadow: options.shadows,
      ),
      height: options.draggableAreaHeight,
      child: Center(
        child: Container(
          height: options.draggableAreaIndicatorHeight,
          width: options.draggableAreaIndicatorWidth,
          decoration: BoxDecoration(
            color: options.draggableAreaIndicatorColor,
            borderRadius: BorderRadius.all(
              Radius.circular(
                options.draggableAreaIndicatorRadius,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => options.draggableAreaHeight;

  @override
  double get minExtent => options.draggableAreaHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
