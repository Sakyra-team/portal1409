import 'package:flutter/material.dart';

class SmallTextField extends StatelessWidget {
  const SmallTextField({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.onSubmitted,
  });

  final TextEditingController controller;
  final String placeholder;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: MediaQuery.sizeOf(context).width / 2 - 16,
      height: 80,
      decoration: BoxDecoration(
        color: const .fromARGB(0, 0, 0, 0),
        border: .all(color: const .fromARGB(255, 204, 204, 204)),
        borderRadius: .all(.circular(21)),
      ),
      child: Center(
        child: TextField(
          onSubmitted: (_) => onSubmitted,
          controller: controller,
          keyboardType: .name,
          style: theme.textTheme.titleSmall,
          decoration: InputDecoration(
            label: Text(
              placeholder,
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
