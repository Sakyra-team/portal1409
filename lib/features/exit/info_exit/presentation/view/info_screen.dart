import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/exit/info_exit/cubit/info_exit_cubit.dart';
import 'package:portal1409/features/exit/info_exit/presentation/widgets/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class InfoExitScreen extends StatefulWidget {
  const InfoExitScreen({
    super.key,
    required this.uuid,
    required this.name,
    required this.iat,
    required this.isDeactivate,
  });

  final String uuid;
  final String name;
  final String iat;
  final bool isDeactivate;

  @override
  State<InfoExitScreen> createState() => _InfoExitScreenState();
}

class _InfoExitScreenState extends State<InfoExitScreen> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: header(context, [
        Center(
          child: Padding(
            padding: const .only(top: 108, left: 12, right: 12, bottom: 64),
            child: Column(
              children: [
                Text(widget.name, style: theme.textTheme.titleLarge),
                const SizedBox(height: 5),
                Text(
                  widget.iat,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.hintColor,
                  ),
                ),

                Expanded(
                  child: Center(
                    child: QrImageView(
                      data: "https://my1409.ru/application/${widget.uuid}",
                      version: QrVersions.auto,
                      eyeStyle: const QrEyeStyle(color: Colors.white),
                      dataModuleStyle: const QrDataModuleStyle(
                        color: Colors.white,
                      ),
                      size: 200,
                    ),
                  ),
                ),

                BasicButton(
                  text: "Поделится",
                  onTap: () => SharePlus.instance.share(
                    ShareParams(
                      uri: .parse(
                        "https://my1409.ru/application/${widget.uuid}",
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                BlocConsumer<InfoExitCubit, InfoExitState>(
                  bloc: context.read<InfoExitCubit>(),
                  listener: (context, state) {
                    if (state is InfoExitLoaded) {
                    }
                  },
                  builder: (context, state) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: _getPage(state),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget _getPage(InfoExitState state) {
    if (state is InfoExitLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is InfoExitLoaded) {
      return SmallButtonCopy(uuid: widget.uuid, isFull: true);
    } else if (state is InfoExitError) {
      return Center(child: Text("Ошибка удаления заявки"));
    }

    return widget.isDeactivate
        ? SmallButtonCopy(uuid: widget.uuid, isFull: true)
        : Row(
            children: [
              SmallButtonDelete(uuid: widget.uuid),
              const SizedBox(width: 8),
              SmallButtonCopy(uuid: widget.uuid, isFull: false),
            ],
          );
  }
}
