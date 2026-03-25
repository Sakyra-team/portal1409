import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/core/widgets/cards/basic_card.dart';
import 'package:portal1409/features/home/services/cubit/service_cubit.dart';
import 'package:portal1409/features/home/services/domain/service_domain.dart';
import 'package:portal1409/features/home/services/domain/service_enum.dart';
import 'package:portal1409/router/router.dart';

class ServicePageNoFavorite extends StatelessWidget {
  const ServicePageNoFavorite({super.key, required this.state});

  final ServiceSpace state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(" Сервисы", style: theme.textTheme.titleLarge),
            IconButton(
              onPressed: () => context.router.push(AccountRoute(heroTag: HeroTags.fromServiceToAccount)),
              icon: Hero(
                tag: HeroTags.fromServiceToAccount,
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

        ...servicesMap.entries.map((category) {
          final services = category.value;

          return Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              Text(
                category.key.name == ServiceEnum.morePopularity.name
                    ? " Популярные"
                    : category.key.name == ServiceEnum.alerts.name
                    ? " Оповещения"
                    : category.key.name == ServiceEnum.polygon.name
                    ? " Полигон"
                    : " Дургое",
                style: theme.textTheme.titleMedium,
              ),

              const SizedBox(height: 16),

              ...services.entries.expand((service) {
                return [
                  AnimatedSwitcher(duration: Duration(milliseconds: 200)),
                  BasicCard(
                    leadingIcon: service.value["icon"],
                    text: service.value["text"],
                    func: service.value["func"],
                    actionIcon: Icons.favorite_border,
                    actionIconFunc: () async {
                      await context.read<ServiceCubit>().addFavorite(
                        service.key,
                      );
                      if (!context.mounted) return;
                      context.read<ServiceCubit>().loadFavorite();
                    },
                  ),
                  const SizedBox(height: 12),
                ];
              }),

              const SizedBox(height: 26),
            ],
          );
        }),
      ],
    );
  }

  bool isFavorite(int id, List<String> list) {
    if (list.contains(id.toString())) {
      return true;
    }
    return false;
  }
}
