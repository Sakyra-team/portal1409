import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portal1409/core/widgets/buttons/buttons.dart';
import 'package:portal1409/features/auth/login/bloc/login_bloc.dart';
import 'package:portal1409/features/auth/sms/bloc/sms_bloc.dart';
import 'package:portal1409/features/auth/sms/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class SmsPage extends StatefulWidget {
  const SmsPage({super.key, required this.phone, this.isError, required this.controller});

  final TextEditingController controller;
  final String phone;
  final bool? isError;

  @override
  State<SmsPage> createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  late bool _isError;
  late bool isDisable = true;

  void textFieldListner() {
    if (widget.controller.text.length == 4) {
      setState(() {
        isDisable = false;
      });
    } else if (widget.controller.text.length > 4) {
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
  void initState() {
    super.initState();
    widget.controller.addListener(textFieldListner);
    widget.controller.text.length == 10 ? isDisable = false : isDisable = true;
    _isError = widget.isError ?? false;
  }

  @override
  void dispose() {
    widget.controller.removeListener(textFieldListner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: .center,
      children: [
        SvgPicture.asset("assets/images/logo.svg"),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                context.read<LoginBloc>().add(InitialLoginEvent());
                context.router.back();
              },
              icon: Icon(Icons.arrow_back_ios, size: 24),
            ),
            Text("Введите код из смс", style: theme.textTheme.titleLarge),
            const SizedBox(width: 24),
          ],
        ),
        const SizedBox(height: 32),

        AnimatedSwitcher(
          duration: Duration(milliseconds: 250),
          child: _isError
              ? SmsTextFieldError(controller: widget.controller)
              : SmsTextField(
                  controller: widget.controller,
                  phone: widget.phone,
                ),
        ),
        const SizedBox(height: 0),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 250),
          child: _isError
              ? Container(
                  padding: const .only(top: 5),
                  width: double.infinity,
                  child: Text(
                    "  Неверный код",
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onError,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async {
                        if (!await launchUrl(
                          Uri.parse("https://t.me/dit1409_bot"),
                        )) {
                          throw Exception('Could not launch ');
                        }
                      },
                      child: Text(
                        " Не пришёл код?",
                        style: theme.textTheme.labelSmall,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        if (!await launchUrl(
                          Uri.parse("https://t.me/dit1409_bot"),
                        )) {
                          throw Exception('Could not launch ');
                        }
                      },
                      child: Text(
                        "Техподдержка ",
                        style: theme.textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
        ),
        const SizedBox(height: 24),

        BasicButton(
          text: "Далее",
          isDisable: isDisable,
          func: () => context.read<SmsBloc>().add(
            LoadSms(phone: widget.phone, code: widget.controller.text),
          ),
        ),
      ],
    );
  }
}
