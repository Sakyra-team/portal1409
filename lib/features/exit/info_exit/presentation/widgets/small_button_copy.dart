import 'package:flutter/material.dart';

class SmallButtonCopy extends StatefulWidget {
  const SmallButtonCopy({super.key});

  @override
  State<SmallButtonCopy> createState() => _SmallButtonCopyState();
}

class _SmallButtonCopyState extends State<SmallButtonCopy> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      child: InkWell(
        borderRadius: const .all(.circular(18)),

        splashColor: theme.primaryColor,
        highlightColor: theme.primaryColor.withAlpha(67),
        splashFactory: InkRipple.splashFactory,
        child: Container(
          width: MediaQuery.sizeOf(context).width / 2 - 16,
          height: 68,

          decoration: BoxDecoration(
            borderRadius: const .all(.circular(18)),
            color: theme.splashColor,
          ),

          child: Center(
            child: Text(
              "Ссылка",
              style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
