import 'package:flutter/material.dart';

class TextFieldListExit extends StatelessWidget {
  const TextFieldListExit({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 57,
      decoration: BoxDecoration(
        color: const .fromARGB(0, 0, 0, 0),
        border: .all(color: const .fromARGB(255, 204, 204, 204)),
        borderRadius: .circular(13),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          keyboardType: .name,
          style: theme.textTheme.titleSmall,
          decoration: InputDecoration(
            label: Text(
              "Поиск по имени",
              style: theme.textTheme.labelLarge?.copyWith(color: Colors.white),
            ),
            contentPadding: .symmetric(horizontal: 12),

            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
