import 'dart:ui';

import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackKey =
    GlobalKey<ScaffoldMessengerState>();

// void showSnack(String text) {
//   final messenger = snackKey.currentState;
//   if (messenger == null) return;

//   messenger
//     ..hideCurrentSnackBar()
//     ..showSnackBar(
//       SnackBar(
//         behavior: SnackBarBehavior.floating,
//         animation: AnimationController(
//     vsync: this,
//     duration: const Duration(milliseconds: 500),
//     reverseDuration: const Duration(milliseconds: 500),
//   ),
//         content: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 26.0, sigmaY: 26.0),
//           child: Text(text),
//         ),
//       ),
//     );
// }

void showSnack(String text) {
  final messenger = snackKey.currentState;
  if (messenger == null) return;

  messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent, // Прозрачный фон для кастомного стиля
        elevation: 0,
        content: TweenAnimationBuilder<Offset>(
          duration: const Duration(milliseconds: 1000),
          // Начальное положение — за экраном слева (-1.0)
          tween: Tween(begin: const Offset(-1.0, 0), end: Offset.zero),
          curve: Curves.easeOutBack,
          builder: (context, offset, child) {
            return FractionalTranslation(
              translation: offset,
              child: ClipRRect(
                borderRadius: .circular(12),
                child: BackdropFilter(
                  filter: .blur(sigmaX: 26.0, sigmaY: 26.0),
                  child: Container(
                    padding: const .all(16),
                    color: Colors.transparent,
                    child: Text(text),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
}
