import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackKey =
    GlobalKey<ScaffoldMessengerState>();

void showSnack(
  String text) {
  final messenger = snackKey.currentState;
  if (messenger == null) return;

  messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
}
