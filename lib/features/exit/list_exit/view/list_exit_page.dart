import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal1409/api/models/history_exit_app_info.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/exit/list_exit/cubit/list_exit_cubit.dart';
import 'package:portal1409/features/exit/list_exit/domain/domain.dart';
import 'package:portal1409/features/exit/list_exit/widgets/widgets.dart';
import 'package:portal1409/router/router.dart';

class ListExitPage extends StatefulWidget {
  const ListExitPage({super.key, required this.list, required this.isOnlyMy});

  final List<HistoryExitAppInfo> list;
  final bool isOnlyMy;

  @override
  State<ListExitPage> createState() => _ListExitPageState();
}

class _ListExitPageState extends State<ListExitPage> {
  final TextEditingController controller = TextEditingController();
  late List<HistoryExitAppInfo> list = widget.list;

  @override
  void initState() {
    super.initState();
    controller.addListener(_listner);
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(_listner);
  }

  void _listner() {
    debugPrint(controller.text);
    if (controller.text == "") {
      setState(() => list = widget.list);
    } else {
      setState(() {
        list = getExitListByName(widget.list, controller.text);
      });
    }
  }

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
        onRefresh: () async =>
            await context.read<ListExitCubit>().loadListExit(widget.isOnlyMy),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(" История заявок", style: theme.textTheme.titleLarge),
                IconButton(
                  onPressed: () => context.router.push(
                    AccountRoute(heroTag: HeroTags.fromListExitToAccount),
                  ),
                  icon: Hero(
                    tag: HeroTags.fromListExitToAccount,
                    child: Image.asset(
                      "assets/images/account_icon.png",
                      width: 64,
                      height: 64,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            ClipRRect(
              borderRadius: .circular(26),
              child: BackdropFilter(
                filter: .blur(sigmaX: 26, sigmaY: 26),
                child: Container(
                  width: double.infinity,
                  padding: const .symmetric(horizontal: 12, vertical: 18),
                  decoration: BoxDecoration(
                    borderRadius: .circular(26),
                    color: theme.cardColor,
                  ),
                  child: Column(
                    mainAxisSize: .min,
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .center,
                    children: [
                      TextFieldListExit(controller: controller),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: .spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 29,
                            height: 57,
                            decoration: BoxDecoration(
                              color: theme.cardColor,
                              border: .all(color: .fromARGB(255, 51, 51, 53)),
                              borderRadius: .circular(8),
                            ),
                            child: Row(
                              mainAxisSize: .min,
                              mainAxisAlignment: .spaceEvenly,
                              crossAxisAlignment: .center,
                              children: [
                                Text(
                                  "01.10.26",
                                  style: theme.textTheme.titleSmall,
                                ),
                                const Icon(Icons.event_outlined),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 29,
                            height: 57,
                            decoration: BoxDecoration(
                              color: theme.cardColor,
                              border: .all(color: .fromARGB(255, 51, 51, 53)),
                              borderRadius: .circular(8),
                            ),
                            child: Row(
                              mainAxisSize: .min,
                              mainAxisAlignment: .spaceEvenly,
                              crossAxisAlignment: .center,
                              children: [
                                Text(
                                  "01.10.26",
                                  style: theme.textTheme.titleSmall,
                                ),
                                const Icon(Icons.event_outlined),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Checkbox(
                            value: widget.isOnlyMy,
                            checkColor: Colors.white,
                            onChanged: (value) => context
                                .read<ListExitCubit>()
                                .loadListExit(value!),
                          ),
                          const Text("Только мои"),
                        ],
                      ),
                      const SizedBox(height: 8),

                      const DownloadButtonListExit(),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            ...getCards(context, list),
          ],
        ),
      ),
    );
  }

  List<Widget> getCards(BuildContext context, List<HistoryExitAppInfo> list) {
    final List<Widget> result = [];
    for (var element in list) {
      result.add(
        DeskriptionCard(
          text: "${element.name} ${element.group}",
          date: element.is_deleted
              ? "Заявка удалена"
              : calcListExitDate(element.created_at),
          time: element.is_deleted ? "" : calcListExitTime(element.created_at),
          leading: Icons.directions_run_outlined,
          action: Icons.arrow_forward_ios,
          func: () => showCustomAlert(
            context,
            "${element.name} ${element.group}",
            "Закрыть",
            subtitileText:
                "Причина: ${element.cause}\nДата создания заявки: ${calcListExitDate(element.created_at)}\nИспользовано: ${element.usedAt != null ? calcListExitDate(element.created_at) : "Не использована"}\nСоздал заявку: ${element.teacher_name}",
            isCenter: true,
          ),
          actionFunc: () {},
        ),
      );
      result.add(const SizedBox(height: 12));
    }
    return result;
  }
}
