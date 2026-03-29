import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portal1409/core/core.dart';

OverlayEntry? currentOverlay;

void closeAllOverlays() {
  if (currentOverlay == null) return;
  currentOverlay!.remove();
  currentOverlay = null;
}

Future<int?> showOverlay(
  BuildContext context,
  List<List> list,
  GlobalKey parentKey,
  OverlayEnum? type,
  LayerLink link,
) async {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  if (currentOverlay != null) {
    currentOverlay!.remove();
    currentOverlay = null;
  }

  final Completer<int> completer = Completer<int>();

  overlayEntry = OverlayEntry(
    builder: (context) {
      final renderBox =
          parentKey.currentContext!.findRenderObject() as RenderBox;

      final parentPosition = renderBox.localToGlobal(Offset.zero);
      final screenHeight = MediaQuery.sizeOf(context).height;

      final isBottom = parentPosition.dy > screenHeight / 2;

      return Positioned.fill(
        child: Stack(
          children: [
            CompositedTransformFollower(
              link: link,
              targetAnchor: isBottom ? .topCenter : .bottomCenter,
              followerAnchor: isBottom ? .bottomCenter : .topCenter,
              offset: isBottom ? const Offset(0, -5) : const Offset(0, 5),
              child: SizedBox(
                width: type == .small
                    ? (MediaQuery.sizeOf(context).width / 2 - 16)
                    : (MediaQuery.sizeOf(context).width - 24),
                child: OverlayUI(
                  list: list,
                  completer: completer,
                  overlayEntry: overlayEntry,
                ),
              ),
            ),
            Positioned.fill(child: GestureDetector(onTap: () {
              overlayEntry.remove();
              currentOverlay = null;
            },))
          ],
        ),
      );
    },
  );

  currentOverlay = overlayEntry;
  overlay.insert(overlayEntry);

  return completer.future;
}
