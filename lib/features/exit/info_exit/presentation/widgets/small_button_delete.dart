import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal1409/features/exit/info_exit/cubit/info_exit_cubit.dart';

class SmallButtonDelete extends StatefulWidget {
  const SmallButtonDelete({super.key, required this.uuid});

  final String uuid;

  @override
  State<SmallButtonDelete> createState() => _SmallButtonDeleteState();
}

class _SmallButtonDeleteState extends State<SmallButtonDelete> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => context.read<InfoExitCubit>().delete(widget.uuid),
      child: Container(
        width: MediaQuery.sizeOf(context).width / 2 - 16,
        height: 68,

        decoration: BoxDecoration(
          borderRadius: const .all(.circular(18)),
          color: theme.colorScheme.secondary,
        ),

        child: Center(
          child: Text(
            "Запретить",
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
