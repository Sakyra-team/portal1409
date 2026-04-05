import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal1409/features/auth/sms/bloc/sms_bloc.dart';

class SmsTextField extends StatelessWidget {
  const SmsTextField({super.key, required this.controller, required this.phone});

  final TextEditingController controller;
  final String phone;

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
        child: TextField(
          
          controller: controller,
          keyboardType: .number,
          autofocus: true,
          style: theme.textTheme.titleSmall,
          onSubmitted: (_) => controller.text.length == 4 ? context.read<SmsBloc>().add(LoadSms(phone: phone, code: controller.text)) : null,
          decoration: InputDecoration(
            label: Text("Введите код из смс", style: theme.textTheme.labelLarge?.copyWith(color: Colors.white),),
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
