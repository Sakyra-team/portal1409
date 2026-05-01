import 'package:flutter/material.dart';

class BasicTextField extends StatelessWidget {
  const BasicTextField({
    super.key,
    required this.controller,
    required this.placeholder,
    this.onSubmitted,
    this.isError,
  });

  final TextEditingController controller;
  final String placeholder;
  final VoidCallback? onSubmitted;
  final bool? isError;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: const .fromARGB(0, 0, 0, 0),
        border: .all(color: isError == true ? theme.colorScheme.error :  theme.dividerColor),
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
