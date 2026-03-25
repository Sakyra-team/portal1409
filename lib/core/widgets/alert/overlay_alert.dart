import 'dart:async';

import 'package:flutter/material.dart';

Future<int> showOverlay(BuildContext context, List<String> list) async {
  final overlay = Overlay.of(context);

  final completer = Completer<int>();

  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 100,
      left: 20,
      right: 20,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          constraints: BoxConstraints(maxHeight: 300),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: list.length,
            separatorBuilder: (context, index) => Container(
              width: 250,
              height: 1,
              color: Theme.of(context).hintColor,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  overlayEntry.remove();
                  completer.complete(index);
                },
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: .blur(sigmaX: 26, sigmaY: 26),
                    child: Container(
                      height: 64,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(Icons.add_a_photo),
                            Text(list[index]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ),
  );
  overlay.insert(overlayEntry);

  return completer.future;
}
