import 'package:flutter/material.dart';

class PhoneTextFieldError extends StatelessWidget {
  const PhoneTextFieldError({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      children: [
        Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: const .fromARGB(0, 0, 0, 0),
            border: .all(color: theme.colorScheme.onError),
            borderRadius: .all(.circular(21)),
          ),
          child: Center(
            child: Row(
              mainAxisSize: .min,
              children: [
                Text("     +7", style: theme.textTheme.titleSmall),
                Expanded(
                  child: TextField(
                    controller: controller,
                    keyboardType: .number,
                    autofocus: true,
                    style: theme.textTheme.titleSmall,
                    decoration: InputDecoration(
                      contentPadding: .symmetric(horizontal: 12),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 5),

        Text(
          "     Учитель не найден",
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onError,
          ),
        ),
      ],
    );
  }
}
