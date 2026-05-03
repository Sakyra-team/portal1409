import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portal1409/core/widgets/alert/overlay_alert.dart';

class OverlayUI extends StatefulWidget {
  const OverlayUI({
    super.key,
    required this.list,
    required this.completer,
    required this.overlayEntry,
    this.onCloseRequest,
  });

  final List<List> list;
  final Completer<int?> completer;
  final OverlayEntry overlayEntry;
  final void Function(Future<void> Function())? onCloseRequest;

  @override
  State<OverlayUI> createState() => _OverlayUIState();
}

class _OverlayUIState extends State<OverlayUI>
    with SingleTickerProviderStateMixin {
  late bool isProcessing = false;

  late AnimationController animationController;
  late Animation<double> opacity;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    opacity = Tween<double>(begin: 0.1, end: 1).animate(animationController);
    scale = Tween<double>(begin: 0.92, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOutCubic),
    );

    animationController.forward();

    widget.onCloseRequest?.call(closeWithoutParam);
  }

  Future<void> close(int index) async {
    if (isProcessing) return;
    isProcessing = true;

    await animationController.reverse();

    currentOverlay = null;
    widget.completer.complete(index);
    widget.overlayEntry.remove();
  }

  Future<void> closeWithoutParam() async {
    if (isProcessing) return;
    isProcessing = true;

    await animationController.reverse();

    currentOverlay = null;
    widget.completer.complete(-1);
    widget.overlayEntry.remove();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FadeTransition(
      opacity: opacity,
      child: ScaleTransition(
        scale: scale,
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
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.list.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: theme.splashColor,
                            highlightColor: theme.splashColor.withAlpha(67),
                            splashFactory: InkRipple.splashFactory,
                            borderRadius: index == 0
                                ? const .only(
                                    topLeft: .circular(15),
                                    topRight: .circular(15),
                                  )
                                : null,
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
            ),
          ],
        ),
      ),
    );
  }
}
