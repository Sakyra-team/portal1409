import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/auth/sms/bloc/sms_bloc.dart';
import 'package:portal1409/features/auth/sms/presentation/view/sms_page.dart';

@RoutePage()
class SmsScreen extends StatefulWidget {
  const SmsScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<SmsScreen> createState() => _SmsScreenState();
}

class _SmsScreenState extends State<SmsScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: header(context, [
        SafeArea(
          child: Center(
            child: Padding(
              padding: const .only(top: 64, left: 12, right: 12),
              child: BlocConsumer<SmsBloc, SmsState>(
                bloc: context.read<SmsBloc>(),
                listener: (context, state) {
                  if (state is SmsExceptionTeacher) {
                    showSnack("Ошибка авторизации");
                    context.router.pushPath("/login");
                  } else if (state is SmsLoaded) {
                    context.router.pushPath("/");
                  }
                },
                builder: (context, state) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: _getPage(state),
                  );
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _getPage(SmsState state) {
    if (state is SmsInitial) {
      return SmsPage(controller: controller, phone: widget.phoneNumber);
    } else if (state is SmsLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is SmsLoadingAccountInfo) {
      return Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            CircularProgressIndicator(),
            const SizedBox(height: 12),
            Text(
              "Загрузка\nданных пользователя",
              softWrap: true,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      );
    } else if (state is SmsLoaded) {
      return Center(
        child: Text(
          "Переадресация",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    } else if (state is SmsExceptionWrong) {
      return SmsPage(
        controller: controller,
        phone: widget.phoneNumber,
        isError: true,
      );
    }
    return UnknowError();
  }
}
