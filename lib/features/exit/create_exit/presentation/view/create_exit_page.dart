import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/exit/create_exit/cubit/create_exit_cubit.dart';
import 'package:portal1409/features/exit/create_exit/data/create_exit_data.dart';
import 'package:portal1409/features/exit/create_exit/presentation/widgets/widgets.dart';
import 'package:portal1409/repository/account/account_repository.dart';

class CreateExitPage extends StatefulWidget {
  const CreateExitPage({
    super.key,
    required this.controllerFIO,
    required this.controllerSymbol,
  });

  final TextEditingController controllerFIO;
  final TextEditingController controllerSymbol;

  @override
  State<CreateExitPage> createState() => _CreateExitPageState();
}

class _CreateExitPageState extends State<CreateExitPage> {
  late String? classNumberValue = GetIt.I<AccountRepository>().getGroupNumber().toString();
  late String? causeValue = null;
  late String? timeValue = null;

  late bool isErrorName = false;
  late bool isErrorNumber = false;
  late bool isErrorSymbol = false;
  late bool isErrorCause = false;
  late bool isErrorTime = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      children: [
        const SizedBox(height: 20),
        Text(
          "Создание заявки",
          textAlign: .center,
          style: theme.textTheme.titleLarge,
        ),

        const SizedBox(height: 40),

        Text("  ФИО учащегося", style: theme.textTheme.titleMedium),

        const SizedBox(height: 12),

        BasicTextField(
          controller: widget.controllerFIO,
          placeholder: "ФИО",
          isError: isErrorName,
        ),

        const SizedBox(height: 26),

        Text("  Класс", style: theme.textTheme.titleMedium),

        const SizedBox(height: 12),

        Row(
          children: [
            SmallCustomDropButton(
              placeholder: "Цифра",
              list: classList,
              onSelect: (value) => classNumberValue = value,
              isError: isErrorNumber,
              defaultText: GetIt.I<AccountRepository>().getGroupNumber().toString(),
            ),
            const SizedBox(width: 8),
            SmallTextField(
              controller: widget.controllerSymbol,
              placeholder: "Буква",
              isError: isErrorSymbol,
            ),
          ],
        ),

        const SizedBox(height: 26),

        Text("  Причина", style: theme.textTheme.titleMedium),

        const SizedBox(height: 12),

        CustomDropButton(
          list: causeList,
          placeholder: "--",
          onSelect: (value) => causeValue = value,
          isError: isErrorCause,
        ),

        const SizedBox(height: 12),

        CustomDropButton(
          list: timeList,
          placeholder: "Время выхода (после)",
          onSelect: (value) => timeValue = value,
          isError: isErrorTime,
        ),

        const SizedBox(height: 24),

        BasicButton(
          text: "Создать заявку",
          onTap: () async {
            if (widget.controllerFIO.text == "") {
              setState(() => isErrorName = true);
            }  else {
              setState(() => isErrorName =false);
            }
            if (widget.controllerSymbol.text == "") {
              setState(() => isErrorSymbol = true);
            } else {
              setState(() => isErrorSymbol =false);
            }
            if (classNumberValue == null) {
              setState(() => isErrorNumber = true);
            } else {
              setState(() => isErrorNumber =false);
            }
            if (causeValue == null) {
              setState(() => isErrorCause = true);
            } else {
              setState(() => isErrorCause =false);
            }
            if (timeValue == null) {
              setState(() => isErrorTime = true);
            } else {
              setState(() => isErrorTime =false);
            }

            if (!isErrorName &&
                !isErrorCause &&
                !isErrorNumber &&
                !isErrorSymbol &&
                !isErrorTime) {
              await context.read<CreateExitCubit>().createApplication(
                widget.controllerFIO.text,
                classNumberValue!,
                widget.controllerSymbol.text,
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
