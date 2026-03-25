import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portal1409/core/widgets/widgets.dart';

@RoutePage()
class CreateExitScreen extends StatelessWidget {
  const CreateExitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: header([
        Center(child: Padding(
            padding: const .only(top: 40, left: 12, right: 12),),)
      ]),
    );
  }
}