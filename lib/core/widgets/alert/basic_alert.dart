import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

Future<void> showCustomAlert(
  BuildContext context,
  String titleText,
  String buttonText, {
  String? subtitileText,
  String? textButtonText,
  VoidCallback? buttonFunc,
  VoidCallback? textButtonFunc,
  VoidCallback? spaceFunc,
}) {
  final theme = Theme.of(context);
  return showDialog(
    useSafeArea: false,
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: spaceFunc ?? () => context.router.pop(),
              child: Container(color: Colors.black.withAlpha(51)),
            ),
          ),
          Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Dialog(
                backgroundColor: theme.cardColor.withAlpha(255),
                shape: RoundedRectangleBorder(
                  borderRadius: .circular(20),
                ),
                child: Padding(
                  padding: const .all(20),
                  child: Column(
                    mainAxisSize: .min,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        titleText,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
              
                      const SizedBox(height: 8),
              
                      subtitileText == null
                          ? const SizedBox()
                          : Text(
                              subtitileText,
                              softWrap: true,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ), // Subtitle
              
                      const SizedBox(height: 25),
              
                      GestureDetector(
                        onTap: buttonFunc ?? () => context.router.pop(),
                        child: Container(
                          width: double.infinity,
                          height: 44,
              
                          decoration: BoxDecoration(
                            borderRadius: const .all(.circular(12)),
                            color: theme.primaryColor,
                          ),
              
                          child: Center(
                            child: Text(
                              buttonText,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
              
                      textButtonText == null
                          ? const SizedBox()
                          : Column(
                              mainAxisSize: .min,
                              crossAxisAlignment: .center,
                              children: [
                                const SizedBox(height: 10),
                                TextButton(
                                  onPressed: textButtonFunc,
                                  child: Text(
                                    textButtonText,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 14,
                                      color: theme.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
