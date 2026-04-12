import 'package:flutter/material.dart';

class SmallButtonDelete extends StatefulWidget {
  const SmallButtonDelete({super.key});

  @override
  State<SmallButtonDelete> createState() => _SmallButtonDeleteState();
}

class _SmallButtonDeleteState extends State<SmallButtonDelete> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      child: Container(
        width: MediaQuery.sizeOf(context).width / 2 - 16,
        height: 68,

        decoration: BoxDecoration(
          borderRadius: const .all(.circular(18)),
          color: theme.colorScheme.secondary,
        ),

        child: Center(
          child: Text(
            "Запретить",
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
