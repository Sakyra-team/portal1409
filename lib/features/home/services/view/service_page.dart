import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/home/services/cubit/service_cubit.dart';
import 'package:portal1409/features/home/services/domain/service_domain.dart';
import 'package:portal1409/features/home/services/domain/service_enum.dart';
import 'package:portal1409/router/router.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key, required this.state});

  final ServiceLoaded state;

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

        Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            Text(" Избранное", style: theme.textTheme.titleMedium),

            const SizedBox(height: 16),

            ..._getFavoriteCards(state.list, context),

            const SizedBox(height: 26),
          ],
        ),

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
                  BasicCard(
                    leadingIcon: service.value["icon"],
                    text: service.value["text"],
                    func: service.value["func"],
                    actionIcon: isFavorite(service.key, state.list)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    actionIconFunc: () async {
                      if (state.list.contains(service.key.toString())) {
                        await context.read<ServiceCubit>().removeFavorite(
                          service.key,
                        );
                      } else {
                        await context.read<ServiceCubit>().addFavorite(
                          service.key,
                        );
                      }
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

  List<Widget> _getFavoriteCards(List<String> list, BuildContext context) {
    final List<Widget> result = [];

    for (int l = 0; l < list.length; l++) {
      for (int i = 0; i < servicesMapWithout.length; i++) {
        if (i.toString() == list[l]) {
          result.add(
            BasicCard(
              leadingIcon: servicesMapWithout[int.parse(list[l])]?["icon"],
              text: servicesMapWithout[int.parse(list[l])]?["text"],
              func: servicesMapWithout[int.parse(list[l])]?["func"],
              actionIcon: Icons.favorite,
              actionIconFunc: () async {
                await context.read<ServiceCubit>().removeFavorite(
                  int.parse(list[l]),
                );
                if (!context.mounted) return;
                context.read<ServiceCubit>().loadFavorite();
              },
            ),
          );
          result.add(const SizedBox(height: 12));
        }
      }
    }
    return result;
  }

  bool isFavorite(int id, List<String> list) {
    if (list.contains(id.toString())) {
      return true;
    }
    return false;
  }
}
