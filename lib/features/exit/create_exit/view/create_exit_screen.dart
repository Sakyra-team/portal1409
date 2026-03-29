import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portal1409/core/widgets/widgets.dart';

@RoutePage()
class CreateExitScreen extends StatefulWidget {
  const CreateExitScreen({super.key});

  @override
  State<CreateExitScreen> createState() => _CreateExitScreenState();
}

class _CreateExitScreenState extends State<CreateExitScreen> {
  final TextEditingController controllerFIO = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controllerFIO.dispose();
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
                      controller: controllerFIO,
                      placeholder: "Цифра",
                      list: const <List>[
                        [Icons.class_outlined, "7"],
                        [Icons.class_outlined, "8"],
                        [Icons.class_outlined, "9"],
                        [Icons.class_outlined, "10"],
                        [Icons.class_outlined, "11"],
                      ],
                    ),
                    const SizedBox(width: 8),
                    SmallCustomDropButton(
                      controller: controllerFIO,
                      placeholder: "Буква",
                      list: const <List>[
                        [Icons.class_outlined, "А"],
                        [Icons.class_outlined, "Б"],
                        [Icons.class_outlined, "В"],
                        [Icons.class_outlined, "Г"],
                        [Icons.class_outlined, "Д"],
                        [Icons.class_outlined, "Е"],
                        [Icons.class_outlined, "Ж"],
                        [Icons.class_outlined, "З"],
                        [Icons.class_outlined, "И"],
                        [Icons.class_outlined, "К"],
                        [Icons.class_outlined, "Л"],
                        [Icons.class_outlined, "М"],
                        [Icons.class_outlined, "Н"],
                        [Icons.class_outlined, "О"],
                        [Icons.class_outlined, "П"],
                        [Icons.class_outlined, "Р"],
                        [Icons.class_outlined, "С"],
                        [Icons.class_outlined, "Т"],
                        [Icons.class_outlined, "У"],
                        [Icons.class_outlined, "Э"],
                        [Icons.class_outlined, "Я"],
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 26),

                Text("  Причина", style: theme.textTheme.titleMedium),

                const SizedBox(height: 12),

                CustomDropButton(
                  controller: TextEditingController(),
                  list: [
                    [Icons.family_restroom_outlined, "Семейные обстоятельства"],
                    [Icons.person_2_outlined, "Приём у врача"],
                    [Icons.event_outlined, "Мероприятия"],
                  ],
                  placeholder: "--",
                ),

                const SizedBox(height: 12),

                CustomDropButton(
                  controller: TextEditingController(),
                  list: [
                    [Icons.alarm_outlined, "9:15"],
                    [Icons.alarm_outlined, "10:10"],
                    [Icons.alarm_outlined, "11:10"],
                    [Icons.alarm_outlined, "12:10"],
                    [Icons.alarm_outlined, "13:15"],
                    [Icons.alarm_outlined, "14:10"],
                    [Icons.alarm_outlined, "15:05"],
                  ],
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
