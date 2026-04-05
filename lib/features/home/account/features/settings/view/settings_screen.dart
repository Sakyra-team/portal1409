import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/home/services/cubit/service_cubit.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: header([
        Center(
          child: Padding(
            padding: const .only(top: 137, left: 12, right: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => context.router.back(),
                      icon: Icon(Icons.arrow_back_ios, size: 24),
                    ),

                    Text(
                      "Настройки\nПриложения",
                      textAlign: .center,
                      style: theme.textTheme.titleLarge?.copyWith(fontSize: 32),
                    ),

                    const SizedBox(width: 48),
                  ],
                ),

                const SizedBox(height: 48),

                BasicCard(
                  leadingIcon: Icons.security_outlined,
                  text: "Безопасность",
                  func: () => context.router.pushPath("/security"),
                  actionIcon: Icons.arrow_forward_ios,
                  actionIconColor: theme.hintColor,
                  actionIconSize: 24,
                ),

                const SizedBox(height: 12),

                BasicCard(
                  leadingIcon: Icons.storage_outlined,
                  text: "Очистить кэш",
                  func: () {
                    showCustomAlert(
                      context,
                      "Предупрежение",
                      "Подтвердить",
                      subtitileText: "Все данные в приложении будут удалены",
                      buttonFunc: () {
                        context.router.pop();
                        context.read<ServiceCubit>().removeAllFavorite();
                        showSnack("Кэш приложения очищен");
                      },
                    );
                  },
                  actionIcon: Icons.delete_outline,
                  actionIconColor: theme.colorScheme.error,
                  actionIconSize: 32,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
