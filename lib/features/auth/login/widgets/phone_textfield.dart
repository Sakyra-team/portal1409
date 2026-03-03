import 'package:flutter/material.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: const .fromARGB(0, 0, 0, 0),
        border: .all(color: const .fromARGB(255, 204, 204, 204)),
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
    );
  }
}
