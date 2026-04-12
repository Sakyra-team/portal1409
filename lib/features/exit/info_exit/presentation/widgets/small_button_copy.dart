import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SmallButtonCopy extends StatefulWidget {
  const SmallButtonCopy({super.key, required this.uuid, required this.isFull});

  final String uuid;
  final bool isFull;

  @override
  State<SmallButtonCopy> createState() => _SmallButtonCopyState();
}

class _SmallButtonCopyState extends State<SmallButtonCopy> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () async => await Clipboard.setData(ClipboardData(text: "https://my1409.ru/application/${widget.uuid}")),
      child: Container(
        width: widget.isFull ? double.infinity : MediaQuery.sizeOf(context).width / 2 - 16,
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
    );
  }
}
