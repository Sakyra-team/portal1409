import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portal1409/core/core.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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