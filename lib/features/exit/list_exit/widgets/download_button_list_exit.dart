import 'package:flutter/material.dart';
import 'package:portal1409/core/core.dart';

class DownloadButtonListExit extends StatelessWidget {
  const DownloadButtonListExit({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => showSnack("В разработке 🔥"),
      child: Container(
        width: double.infinity,
        height: 47,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: .circular(12)
        ),
      
          child: Row(
            mainAxisAlignment: .center,
            mainAxisSize: .min,
            children: [
              Icon(Icons.download_rounded, size: 26,),
              const SizedBox(width: 5,),
              Text("Скачать таблицу", style: theme.textTheme.titleSmall,)
            ],
          ),
      ),
    );
  }
}