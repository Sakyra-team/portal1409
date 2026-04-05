import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal1409/core/widgets/snackbar/custom_snack.dart';
import 'package:portal1409/features/home/main/cubit/lift_cubit.dart';

class ElevatorWidget extends StatelessWidget {
  const ElevatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Map<int, List> list = {
      0: [1, "1 этаж"],
      1: [2, "2 этаж"],
      2: [3, "3 этаж"],
      3: [4, "4 этаж"],
    };
    return BlocListener<LiftCubit, LiftState>(
      bloc: context.read<LiftCubit>(),
      listener: (context, state) {
        if (state is LiftSeccess) {
          showSnack("Лифт успешно вызван");
        } else if (state is LiftError) {
          showSnack("Ошибка вызова лифта");
        }

        context.read<LiftCubit>().liftInitial();
      },
      child: Column(
        children: [
          Text("Вызов лифта", style: theme.textTheme.titleSmall),
          const SizedBox(height: 16),
          SizedBox(
            width: (MediaQuery.of(context).size.width - 24 - 25) / 2,
            child: GridView.count(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 2.52,
              children: List.generate(
                4,
                (index) => GestureDetector(
                  onTap: () => context.read<LiftCubit>().lift(list[index]?[0]),
                  child: ClipRRect(
                    borderRadius: .circular(10),
                    child: BackdropFilter(
                      filter: .blur(sigmaX: 26, sigmaY: 26),
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          border: Border.all(color: .fromARGB(255, 51, 51, 53)),
                          borderRadius: .circular(10),
                        ),
                        child: Center(
                          child: Text(
                            list[index]?[1],
                            style: theme.textTheme.labelSmall,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
