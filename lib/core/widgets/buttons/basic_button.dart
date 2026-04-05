import 'package:flutter/material.dart';

class BasicButton extends StatefulWidget {
  const BasicButton({super.key, required this.text, this.onTap, this.isDisable});

  final String text;
  final bool? isDisable;
  final VoidCallback? onTap;

  @override
  State<BasicButton> createState() => _BasicButtonState();
}

class _BasicButtonState extends State<BasicButton> {
  @override
  Widget build(BuildContext context) {
    final bool buttonState = widget.isDisable ?? false;
    final theme = Theme.of(context);
    if (buttonState == false) {
      return GestureDetector(
        onTap: widget.onTap,

        child: Container(
          width: double.infinity,
          height: 68,
          decoration: BoxDecoration(
            borderRadius: const .all(Radius.circular(24)),
            color: theme.primaryColor,
          ),

          child: Center(
            child: Text(
              widget.text,
              style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
        ),
      );
    }
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 68,

        decoration: BoxDecoration(
          borderRadius: const .all(.circular(24)),
          color: const Color.fromARGB(255, 229, 231, 235),
        ),

        child: Center(
          child: Text(
            widget.text,
            style: theme.textTheme.titleMedium?.copyWith(
              color: const .fromARGB(255, 156, 163, 175),
            ),
          ),
        ),
      ),
    );
  }
}
