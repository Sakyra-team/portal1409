import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portal1409/core/widgets/widgets.dart';

@RoutePage()
class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: header(context, [
        Padding(
          padding: const .only(left: 12, right: 12, top: 48),
          child: Center(
            child: Column(),
          ),
        ),
      ]),
    );
  }
}
