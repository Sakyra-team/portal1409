import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portal1409/core/core.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: header(context, [
        Center(
          child: Text("В разработке 🔥", style: theme.textTheme.titleLarge,),
        )
      ]),
    );
  }
}