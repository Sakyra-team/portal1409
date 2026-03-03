import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/auth/login/bloc/login_bloc.dart';
import 'package:portal1409/features/auth/login/view/login_page.dart';
import 'package:portal1409/router/router.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: header([
        SafeArea(
          child: Center(
            child: Padding(
              padding: const .only(top: 64, left: 12, right: 12),
              child: BlocBuilder(
                bloc: context.read<LoginBloc>(),
                builder: (context, state) {
                  if (state is LoginInitial) {
                    return LoginPage();
                  } else if (state is LoginLoading) {
                    return Center(child: CircularProgressIndicator());
                  } 
                  else if (state is LoginLoaded) {
                    context.router.push(SmsRoute(phoneNumber: "7${controller.text}"));
                    return Center(
                      child: Text(
                        "Переадресация",
                        style: theme.textTheme.titleMedium,
                      ),
                    );
                  }
                  return UnknowError();
                },
              ),
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).viewInsets.bottom == 0
              ? (MediaQuery.of(context).viewPadding.bottom)
              : -MediaQuery.of(context).viewInsets.bottom,
          width: MediaQuery.of(context).size.width,
          child: Text(
            "Версия 2.0.0",
            textAlign: .center,
            style: theme.textTheme.labelSmall?.copyWith(color: theme.hintColor),
          ),
        ),
      ]),
    );
  }
}
