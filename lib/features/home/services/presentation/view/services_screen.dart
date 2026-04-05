import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/home/services/cubit/service_cubit.dart';
import 'package:portal1409/features/home/services/presentation/view/service_page.dart';
import 'package:portal1409/features/home/services/presentation/view/service_page_no_favorite.dart';

@RoutePage()
class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    context.read<ServiceCubit>().loadFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: header([
        Center(
          child: Padding(
            padding: const .only(top: 40, left: 12, right: 12),
            child: ShaderMask(
              shaderCallback: (Rect rect) {
                return const LinearGradient(
                  begin: .topCenter,
                  end: .bottomCenter,
                  colors: [Colors.transparent, Colors.black, Colors.black],
                  stops: [0.0, 0.1, 1.0],
                ).createShader(rect);
              },
              blendMode: .dstIn,
              child: BlocBuilder<ServiceCubit, ServiceState>(
                bloc: context.read<ServiceCubit>(),
                builder: (context, state) {
                  if (state is ServiceLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ServiceSpace || state is ServiceLoaded) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),

                      child: state is ServiceSpace
                          ? ServicePageNoFavorite(state: state)
                          : state is ServiceLoaded
                          ? ServicePage(state: state)
                          : null,
                    );
                  }

                  return UnknowError();
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
