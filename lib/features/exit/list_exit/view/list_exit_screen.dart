import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/exit/list_exit/cubit/list_exit_cubit.dart';
import 'package:portal1409/features/exit/list_exit/view/view.dart';

@RoutePage()
class ListExitScreen extends StatefulWidget {
  const ListExitScreen({super.key});

  @override
  State<ListExitScreen> createState() => _ListExitScreenState();
}

class _ListExitScreenState extends State<ListExitScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ListExitCubit>().loadListExit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: header([
        Center(
          child: Padding(
            padding: const .only(top: 40, left: 12, right: 12),
            child: BlocBuilder<ListExitCubit, ListExitState>(
              bloc: context.read<ListExitCubit>(),
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: _getWidget(state),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }

  Widget _getWidget(ListExitState state) {
    if (state is ListExitLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is ListExitLoaded || state is ListExitEmpty) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: state is ListExitLoaded
            ? ListExitPage(list: state.list)
            : ListExitEmptyPage(),
      );
    }
    return const UnknowError();
  }
}
