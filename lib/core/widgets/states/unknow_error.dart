import 'package:flutter/material.dart';
import 'package:portal1409/core/core.dart';

class UnknowError extends StatelessWidget {
  const UnknowError({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .center,
        children: [
          Text("Неизвестная ошибка", style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),

          Text(
            "В приложении критическая ошибка. Необходима перезагрузка приложения. Вы можете воспользоватся сайтов my1409.ru как временное решение. Отправьте данные об ошибке разработчику нажав кнопку снизу",
            textAlign: .center,
            softWrap: true,
          ),
          const SizedBox(height: 8),

        TextButton(onPressed: () => showCustomAlert(context, "Успешно", "Хорошо", subtitileText: "Данные успшено отправлены разработчику, ответ придёт в виде уведомления в приложении"), child: Text("Отправить"))
        ],
      ),
    );
  }
}
