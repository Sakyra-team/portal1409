import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/home/main/presentation/widgets/widgets.dart';
import 'package:portal1409/router/router.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Map<int, List> list = {
      0: [const Icon(Icons.directions_run_outlined, size: 48), "Разрешения на выход", () => context.router.pushPath("/exit/create")],
      1: [const Icon(Icons.elevator_outlined, size: 48), "Разрешения на лифт", () {}],
      2: [const Icon(Icons.speaker_outlined, size: 48), "Громкая связь", () {}],
      3: [const Icon(Icons.person_add_alt_1_outlined, size: 48), "Заказ пропуска", () {}],
    };
    return Scaffold(
      body: header([
        Center(
          child: Padding(
            padding: const .only(top: 40, left: 12, right: 12),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(" Главная", style: theme.textTheme.titleLarge),
                    IconButton(
                      onPressed: () => context.router.push(AccountRoute(heroTag: HeroTags.fromMainToAccount)),
                      icon: Hero(
                        tag: HeroTags.fromMainToAccount,
                        child: Image.asset(
                          "assets/images/account_icon.png",
                          width: 64,
                          height: 64,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                Row(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [ElevatorWidget(), LiquidProgress()],
                ),

                const SizedBox(height: 32),

                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.44,
                  shrinkWrap: true,
                  children: List.generate(
                    4,
                    (index) => BigCard(
                      icon: list[index]?[0],
                      text: list[index]?[1],
                      func: list[index]?[2],
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
