import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portal1409/core/data/data.dart';

OverlayEntry? _currentOverlay;

Offset calcPosition(
  BuildContext context,
  GlobalKey parentKey,
  OverlayEnum type,
) {
  final RenderBox renderBox =
      parentKey.currentContext!.findRenderObject() as RenderBox;

  late double x = 12;
  late double y = 100;

  final double screenWidth = MediaQuery.of(context).size.width;
  final double screenHeight = MediaQuery.of(context).size.height;
  final double parentWidth = renderBox.size.width;
  final double parentHeight = renderBox.size.height;
  final double childWidth = type == .small
      ? (MediaQuery.of(context).size.width / 2 - 16)
      : (MediaQuery.of(context).size.width - 24);
  final Offset parentPosition = renderBox.localToGlobal(.zero);

  debugPrint("Width $parentWidth");
  debugPrint("Height $parentHeight");
  debugPrint("childWidth $childWidth");
  debugPrint("screenWidth $screenWidth");
  debugPrint("screenHeight $screenHeight");
  debugPrint("Posititon $parentPosition");

  // y

  if (parentPosition.dy <= (screenHeight / 3)) {
    y = parentPosition.dy + parentHeight + 5;
  } else {
    y = parentPosition.dy;
  }

  // x

  if (type == .small) {
    if (parentPosition.dx <= (screenWidth / 2)) {
      x = 12;
    } else {
      x = parentPosition.dx;
    }
  }

  return Offset(x, y);
}

Future<int> showOverlay(
  BuildContext context,
  List<List> list,
  GlobalKey parentKey,
  OverlayEnum? type,
) async {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  if (_currentOverlay != null) {
    _currentOverlay!.remove();
    _currentOverlay = null;
  }

  final Completer<int> completer = Completer<int>();

  final screenWeight = MediaQuery.of(context).size.width;

  overlayEntry = OverlayEntry(
    builder: (context) {
      return Positioned(
        width: type == .small ? (screenWeight / 2 - 16) : (MediaQuery.of(context).size.width - 24),
        top: calcPosition(context, parentKey, type ?? OverlayEnum.small).dy,
        left: calcPosition(context, parentKey, type ?? OverlayEnum.small).dx,
        child: _OverlayUI(
          list: list,
          completer: completer,
          overlayEntry: overlayEntry,
        ),
      );
    },
  );

  _currentOverlay = overlayEntry;
  overlay.insert(overlayEntry);

  return completer.future;
}



class _OverlayUI extends StatefulWidget {
  const _OverlayUI({
    required this.list,
    required this.completer,
    required this.overlayEntry,
  });

  final List<List> list;
  final Completer<int> completer;
  final OverlayEntry overlayEntry;

  @override
  State<_OverlayUI> createState() => _OverlayUIState();
}

class _OverlayUIState extends State<_OverlayUI>
    with SingleTickerProviderStateMixin {
  late bool isProcessing = false;

  late AnimationController animationController;
  late Animation<double> opacity;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 175),
    );
    opacity = Tween<double>(begin: 0, end: 1).animate(animationController);

    animationController.forward();
  }

  Future<void> close(int index) async {
    await animationController.reverse();
    if (isProcessing) return;
    isProcessing = true;
    Future.delayed(Duration(milliseconds: 175), () {
      widget.completer.complete(index);
      widget.overlayEntry.remove();
      _currentOverlay = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FadeTransition(
      opacity: opacity,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: .circular(15),
              child: BackdropFilter(
                filter: .blur(sigmaX: 26, sigmaY: 26),
                child: Container(color: theme.cardColor),
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) => Padding(
              padding: const .symmetric(horizontal: 0, vertical: 0),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: Material(
                  color: Colors.transparent,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.list.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: theme.splashColor,
                        highlightColor: theme.splashColor.withAlpha(67),
                        splashFactory: InkRipple.splashFactory,
                        onTap: () async => await close(index),
                        child: Padding(
                          padding: const .symmetric(
                            vertical: 12,
                            horizontal: 18,
                          ),
                          child: Row(
                            mainAxisSize: .min,
                            children: [
                              Icon(widget.list[index][0], size: 32),
                              const SizedBox(width: 20),
                              Text(
                                widget.list[index][1],
                                style: theme.textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
