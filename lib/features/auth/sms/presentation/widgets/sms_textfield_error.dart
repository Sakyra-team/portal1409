import 'package:flutter/material.dart';

class SmsTextFieldError extends StatefulWidget {
  const SmsTextFieldError({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<SmsTextFieldError> createState() => _SmsTextFieldErrorState();
}

class _SmsTextFieldErrorState extends State<SmsTextFieldError> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(controllerListner);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(controllerListner);
  }

  void controllerListner() {
    if (widget.controller.text.length > 4) {
      widget.controller.text.substring(0, widget.controller.text.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: const .fromARGB(0, 0, 0, 0),
        border: .all(color: theme.colorScheme.onError),
        borderRadius: .all(.circular(21)),
      ),
      child: Center(
        child: TextField(
          controller: widget.controller,
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
    );
  }
}
