import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:portal1409/features/auth/login/bloc/login_bloc.dart';
import 'package:portal1409/features/auth/sms/bloc/sms_bloc.dart';
import 'package:portal1409/features/exit/list_exit/cubit/list_exit_cubit.dart';
import 'package:portal1409/features/home/main/cubit/lift_cubit.dart';
import 'package:portal1409/features/home/services/cubit/service_cubit.dart';
import 'package:portal1409/repository/auth/login_repository.dart';
import 'package:portal1409/repository/service/service_repository.dart';
import 'package:portal1409/router/router.dart';
import 'package:portal1409/theme/theme.dart';
import 'package:dio/dio.dart';
import 'package:portal1409/api/api.dart';
import 'package:portal1409/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

part 'config.dart';

void mai
n() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadConfig();

  // loginManager.logout();

  // GetIt.I<ServiceRepository>().removeAllFavorite();h

  runApp(const MobileApp());
}

class MobileApp extends StatelessWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter router = AppRouter();
    return MultiBlocProvider(
      providers:  [
        BlocProvider(create: (context) => LoginBloc(apiClient: apiClient)),
        BlocProvider(create: (context) => SmsBloc(apiClient: apiClient)),
        BlocProvider(create: (context) => LiftCubit(apiClient: apiClient)),
        BlocProvider(create: (context) =>я ServiceCubit()),
        BlocProvider(create: (context) => ListExitCubit(apiClient: apiClient))
      ],
      child: MaterialApp.router(
        title: 'Портал 1409',
        scaffoldMessengerKey: snackKey,
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        routerConfig: router.config(),
      ),
    );
  }
}
