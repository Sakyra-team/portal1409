import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/home/account/presentation/widgets/widgets.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key, required this.heroTag});

  final String heroTag;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: header([
        Center(
          child: Padding(
            padding: const .only(top: 64, left: 12, right: 12),
            child: ListView(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Hero(
                    tag: heroTag,
                    child: Image.asset(
                      "assets/images/account_icon.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),

                const SizedBox(height: 40),
                Text(
                  "Иван Иванов",
                  textAlign: .center,
                  style: theme.textTheme.titleLarge?.copyWith(fontSize: 32),
                ),

                const SizedBox(height: 32),

                BasicCard(
                  leadingIcon: Icons.settings_outlined,
                  text: "Настройки",
                  func: () => context.router.pushPath("/settings"),
                  actionIcon: Icons.arrow_forward_ios,
                  actionIconColor: theme.hintColor,
                  actionIconSize: 24,
                ),

                const SizedBox(height: 12),

                BasicCard(
                  leadingIcon: Icons.support_agent_outlined,
                  text: "Помощь",
                  func: () {},
                  actionIcon: Icons.arrow_forward_ios,
                  actionIconColor: theme.hintColor,
                  actionIconSize: 24,
                ),

                const SizedBox(height: 12),

                ClipRRect(
                  borderRadius: .circular(23),
                  child: BackdropFilter(
                    filter: .blur(sigmaX: 26, sigmaY: 26),
                    child: Container(
                      width: double.infinity,
                      padding: .symmetric(horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: .circular(23),
                      ),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Center(
                            child: Text(
                              "Мой класс",
                              style: theme.textTheme.titleMedium,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Center(
                            child: Text(
                              "Мой класс",
                              style: theme.textTheme.titleSmall,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text("Логин:", style: theme.textTheme.labelLarge),
                              Text(
                                "it@school1409.ru",
                                style: theme.textTheme.labelLarge,
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          Divider(),
                          const SizedBox(height: 8),

                          Text(
                            "Класс по умолчанию",
                            style: theme.textTheme.titleSmall,
                          ),

                          const SizedBox(height: 12),

                          Row(children: []),
                          const SizedBox(height: 24),

                          AccountButton(text: "Сохранить класс"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
