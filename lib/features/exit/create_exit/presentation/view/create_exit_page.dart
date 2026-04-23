import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/exit/create_exit/cubit/create_exit_cubit.dart';
import 'package:portal1409/features/exit/create_exit/data/create_exit_data.dart';
import 'package:portal1409/features/exit/create_exit/presentation/widgets/widgets.dart';

class CreateExitPage extends StatelessWidget {
  const CreateExitPage({
    super.key,
    required this.controllerFIO,
    required this.controllerSymbol,
  });

  final TextEditingController controllerFIO;
  final TextEditingController controllerSymbol;

  static String? classNumberValue = null;
  static String? causeValue = null;
  static String? timeValue = null;

  static late bool isErrorName = false;
  static bool isErrorNumber = false;
  static bool isErrorSymbol = false;
  static bool isErrorCause = false;
  static bool isErrorTime = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      children: [
        const SizedBox(height: 28),
        Text(
          "Создание заявки",
          textAlign: .center,
          style: theme.textTheme.titleLarge,
        ),

        const SizedBox(height: 32),

        Text("  ФИО учащегося", style: theme.textTheme.titleMedium),

        const SizedBox(height: 12),

        BasicTextField(controller: controllerFIO, placeholder: "ФИО"),

        const SizedBox(height: 26),

        Text("  Класс", style: theme.textTheme.titleMedium),

        const SizedBox(height: 12),

        Row(
          children: [
            SmallCustomDropButton(
              placeholder: "Цифра",
              list: classList,
              onSelect: (value) => classNumberValue = value,
            ),
            const SizedBox(width: 8),
            SmallTextField(controller: controllerSymbol, placeholder: "Буква"),
          ],
        ),

        const SizedBox(height: 26),

        Text("  Причина", style: theme.textTheme.titleMedium),

        const SizedBox(height: 12),

        CustomDropButton(
          list: causeList,
          placeholder: "--",
          onSelect: (value) => causeValue = value,
        ),

        const SizedBox(height: 12),

        CustomDropButton(
          list: timeList,
          placeholder: "Время выхода (после)",
          onSelect: (value) => timeValue = value,
        ),

        const SizedBox(height: 24),

        BasicButton(
          text: "Создать заявку",
          onTap: () async {
            if (controllerFIO.text == "") {
              isErrorName = true;
            }
            if (controllerSymbol.text == "") {
              isErrorSymbol = true;
            }
            if (classNumberValue == null) {
              isErrorNumber = true;
            }
            if (causeValue == null) {
              isErrorCause = true;
            }
            if (timeValue == null) {
              isErrorTime = true;
            }

            if (!isErrorName &&
                !isErrorCause &&
                !isErrorNumber &&
                !isErrorSymbol &&
                !isErrorTime) {
              await context.read<CreateExitCubit>().createApplication(
                controllerFIO.text,
                classNumberValue!,
                controllerSymbol.text,
                causeValue!,
                timeValue!,
              );
            }
          },
        ),
      ],
    );
  }
}
