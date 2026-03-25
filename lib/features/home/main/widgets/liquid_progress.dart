import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:portal1409/features/home/main/infrastructure/liquid_progress_infrastructure.dart';

class LiquidProgress extends StatelessWidget {
  const LiquidProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 24 - 25) / 2,
      height: 110,
      child: StreamBuilder<List<String?>>(
        stream: LiquidProgressService().statusStream,
        initialData: const ["Загрузка...", null],
        
        builder: (context, snapshot) => LiquidLinearProgressIndicator(
          value: 0.25,
          valueColor: AlwaysStoppedAnimation(theme.primaryColor),
          backgroundColor: theme.cardColor,
          borderColor: Colors.transparent,
          borderWidth: 0,
          borderRadius: 20,
          direction: .vertical,
          center: Padding(
            padding: const .symmetric(horizontal: 12, vertical: 12),
            child: Center(
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                children: [
                  Text(snapshot.data?[0] ?? "Ошибка", style: theme.textTheme.titleSmall),
                  snapshot.data?[1] != null ?
                  Text(
                    snapshot.data?[1] ?? "",
                    softWrap: true,
                    style: theme.textTheme.labelSmall,
                  ) : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
