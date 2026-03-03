import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/auth/login/bloc/login_bloc.dart';
import 'package:portal1409/features/auth/login/widgets/widgets.dart';

// It in global level because i use it in login_screen.dart
final TextEditingController controller = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool isDisable = true;

  @override
  void initState() {
    controller.addListener(textFieldListner);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(textFieldListner);
    super.dispose();
  }

  void textFieldListner() {
    if (controller.text.length == 10) {
      setState(() {
        isDisable = false;
      });
    } else if (controller.text.length > 10) {
      controller.text = controller.text.substring(0, controller.text.length - 1);
    } 
    else {
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

        PhoneTextField(controller: controller),

        const SizedBox(height: 32),

        BasicButton(
          text: "Далее",
          isDisable: isDisable,
          func: () {
            context.read<LoginBloc>().add(
              LoadLogin(phoneNumber: "7${controller.text}"),
            );
          },
        ),
      ],
    );
  }
}
