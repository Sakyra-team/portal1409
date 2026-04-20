import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/exit/create_exit/cubit/create_exit_cubit.dart';
import 'package:portal1409/features/exit/create_exit/presentation/view/create_exit_page.dart';
import 'package:portal1409/router/router.dart';

@RoutePage()
class CreateExitScreen extends StatefulWidget {
  const CreateExitScreen({super.key});

  @override
  State<CreateExitScreen> createState() => _CreateExitScreenState();
}

class _CreateExitScreenState extends State<CreateExitScreen> {
  final TextEditingController controllerFIO = TextEditingController();
  final TextEditingController controllerSymbol = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<CreateExitCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: header(context, [
        Center(
          child: Padding(
            padding: const .only(top: 40, left: 12, right: 12),
            child: BlocConsumer<CreateExitCubit, CreateExitState>(
              listener: (context, state) {
                if (state is CreateExitNoCorpuse) {
                  showSnack("Вы не можете создавать заявки для этого корпуса");
                } else if (state is CreateExitNoAfford) {
                  showSnack(
                    "Классный руководитель запретил(а) создавать заявки",
                  );
                } else if (state is CreateExitLoaded) {
                  context.router.push(
                    InfoExitRoute(
                      uuid: state.uuid,
                      name: state.name,
                      iat: state.date,
                      isDeactivate: true,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: getPage(state),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }

  Widget getPage(CreateExitState state) {
    if (state is CreateExitInitial) {
      return CreateExitPage(
        controllerFIO: controllerFIO,
        controllerSymbol: controllerSymbol,
      );
    } else if (state is CreateExitLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is CreateExitLoaded) {
      return Center(
        child: Text(
          "Заявка создана, переадресация",
          softWrap: true,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }
    return const UnknowError();
  }
}
