import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal1409/features/exit/list_exit/cubit/list_exit_cubit.dart';

class ListExitEmptyPage extends StatelessWidget {
  const ListExitEmptyPage({super.key, required this.isOnlyMy});

  final bool isOnlyMy;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await context.read<ListExitCubit>().loadListExit(isOnlyMy),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                " История заявок",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                      onPressed: () => context.router.pushPath("/account"),
                icon: Image.asset(
                  "assets/images/account_icon.png",
                  width: 64,
                  height: 64,
                ),
              ),
            ],
          ),

          Expanded(
            child: Center(
              child: Text(
                "Заявок пока нет",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
