
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/auth/login/bloc/login_bloc.dart';
import 'package:portal1409/features/auth/login/presentation/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool isDisable = true;

  @override
  void initState() {
    widget.controller.addListener(textFieldListner);
    widget.controller.text.length == 10 ? isDisable = false : isDisable = true;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(textFieldListner);
  }

  void textFieldListner() {
    if (widget.controller.text.length == 10) {
      setState(() {
        isDisable = false;
      });
    } else if (widget.controller.text.length > 10) {
      widget.controller.text = widget.controller.text.substring(
        0,
        widget.controller.text.length - 1,
      );
    } else {
      setState(() {
        isDisable = true;
      });
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

        PhoneTextField(controller: widget.controller),

        const SizedBox(height: 32),

        BasicButton(
          text: "Далее",
          isDisable: isDisable,
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
