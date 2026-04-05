
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/auth/login/bloc/login_bloc.dart';
import 'package:portal1409/features/auth/login/presentation/widgets/widgets.dart';

class LoginPageErrorTeacher extends StatefulWidget {
  const LoginPageErrorTeacher({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<LoginPageErrorTeacher> createState() => _LoginPageErrorTeacherState();
}

class _LoginPageErrorTeacherState extends State<LoginPageErrorTeacher> {
  late int lastTextFieldLenght;

  @override
  void initState() {
    lastTextFieldLenght = widget.controller.text.length;
    widget.controller.addListener(textFieldListner);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(textFieldListner);
    super.dispose();
  }

  void textFieldListner() {
    if (lastTextFieldLenght > widget.controller.text.length) {
      context.read<LoginBloc>().add(InitialLoginEvent());
    }
    
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: .center,
      children: [
        SvgPicture.asset("assets/images/logo.svg"),
        const SizedBox(height: 30),
        Text("Добро пожаловать!", style: theme.textTheme.titleLarge),
        const SizedBox(height: 60),

        PhoneTextFieldError(controller: widget.controller),

        const SizedBox(height: 32),

        BasicButton(
          text: "Далее",
          isDisable: false,
          onTap: () {
            context.read<LoginBloc>().add(
              LoadLogin(phoneNumber: "7${widget.controller.text}"),
            );
          },
        ),
      ],
    );
  }
}
