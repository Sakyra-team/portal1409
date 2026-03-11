import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class LiquidProgress extends StatelessWidget {
  const LiquidProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 24 - 25) / 2,
      height: 110,
      child: LiquidLinearProgressIndicator(
        value: 0.25,
        valueColor: AlwaysStoppedAnimation(theme.primaryColor),
        backgroundColor: theme.cardColor,
        borderColor: Colors.transparent,
        borderWidth: 0,
        borderRadius: 20,
        direction: Axis.vertical,
        center: Padding(
          padding: const .symmetric(horizontal: 12, vertical: 12),
          child: Column(
            mainAxisAlignment: .spaceAround,
            crossAxisAlignment: .start,
            children: [
              Text("3 мин.", style: theme.textTheme.titleMedium),
              Text(
                "До конца урока, далее большая перемена(20 мин.)",
                softWrap: true,
                style: theme.textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
