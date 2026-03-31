import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portal1409/core/widgets/widgets.dart';
import 'package:portal1409/features/exit/create_exit/data/create_exit_data.dart';

@RoutePage()
class CreateExitScreen extends StatefulWidget {
  const CreateExitScreen({super.key});

  @override
  State<CreateExitScreen> createState() => _CreateExitScreenState();
}

class _CreateExitScreenState extends State<CreateExitScreen> {
  final TextEditingController controllerFIO = TextEditingController();
  late TextEditingController controllerSymbol = TextEditingController();
  // ignore: avoid_init_to_null
  late int? vcNumber = null;
  // ignore: avoid_init_to_null
  late int? vcCause = null;
  // ignore: avoid_init_to_null
  late int? vcTime = null;

  void _vcNumber(int? number) {
    if (number == null) return;
    setState(() {
      vcNumber = number;
    });
  }

  void _vcCause(int? cause) {
    if (cause == null) return;
    setState(() {
      vcCause = cause;
    });
  }

  void _vcTime(int? time) {
    if (time == null) return;
    setState(() {
      vcTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: header([
        Center(
          child: Padding(
            padding: const .only(top: 68, left: 12, right: 12),
            child: ListView(
              children: [
                Text(
                  "Создание заявки",
                  textAlign: .center,
                  style: theme.textTheme.titleLarge,
                ),

                const SizedBox(height: 68),

                Text("  ФИО учащегося", style: theme.textTheme.titleMedium),

                const SizedBox(height: 12),

                BasicTextField(controller: controllerFIO, placeholder: "ФИО"),

                const SizedBox(height: 26),

                Text("  Класс", style: theme.textTheme.titleMedium),

                const SizedBox(height: 12),

                Row(
                  children: [
                    SmallCustomDropButton(
                      text: (vcNumber != null && vcNumber != -1) ? classList[vcNumber!][1] : null,
                      valueChanged: _vcNumber,
                      placeholder: "Цифра",
                      list: classList,
                    ),
                    const SizedBox(width: 8),
                    SmallTextField(
                      controller: controllerSymbol,
                      placeholder: "Буква",
                      onSubmitted: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 26),

                Text("  Причина", style: theme.textTheme.titleMedium),

                const SizedBox(height: 12),

                CustomDropButton(
                  text: (vcCause != null && vcCause != -1) ? causeList[vcCause!][1] : null,
                  valueChanged: _vcCause,
                  list: causeList,
                  placeholder: "--",
                ),

                const SizedBox(height: 12),

                CustomDropButton(
                  text: (vcTime != null && vcTime != -1) ? timeList[vcTime!][1] : null,
                  valueChanged: _vcTime,
                  list: timeList,
                  placeholder: "Время выхода (после)",
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
