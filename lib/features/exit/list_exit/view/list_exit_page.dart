import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal1409/api/models/history_exit_app_info.dart';
import 'package:portal1409/core/widgets/cards/deskription_card.dart';
import 'package:portal1409/features/exit/list_exit/cubit/list_exit_cubit.dart';
import 'package:portal1409/features/exit/list_exit/domain/domain.dart';

class ListExitPage extends StatelessWidget {
  const ListExitPage({super.key, required this.list});

  final List<HistoryExitAppInfo> list;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ShaderMask(
      shaderCallback: (Rect rect) {
        return const LinearGradient(
          begin: .topCenter,
          end: .bottomCenter,
          colors: [Colors.transparent, Colors.black, Colors.black],
          stops: [0.0, 0.1, 1.0],
        ).createShader(rect);
      },
      blendMode: .dstIn,
      child: RefreshIndicator(
        onRefresh: () async => await context.read<ListExitCubit>().loadListExit(),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(" История заявок", style: theme.textTheme.titleLarge),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/account_icon.png",
                    width: 64,
                    height: 64,
                  ),
                ),
              ],
            ),
        
            const SizedBox(height: 32),
        
            ...getCards(list),
          ],
        ),
      ),
    );
  }

  List<Widget> getCards(List<HistoryExitAppInfo> list) {
    final List<Widget> result = [];
    for (var element in list) {
      result.add(
        DeskriptionCard(
          text: "${element.name} ${element.group}",
          // date: calcListExitDate(element.created_at),
          date: element.created_at,
          time: "",
          leading: Icons.directions_run_outlined,
          action: Icons.arrow_forward_ios,
          func: () {},
          actionFunc: () {},
        ),
      );
      result.add(const SizedBox(height: 12));
    }
    return result;
  }
}
