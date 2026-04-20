import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_it/get_it.dart';
import 'package:portal1409/features/auth/login/bloc/login_bloc.dart';
import 'package:portal1409/features/auth/sms/bloc/sms_bloc.dart';
import 'package:portal1409/features/exit/create_exit/cubit/create_exit_cubit.dart';
import 'package:portal1409/features/exit/info_exit/cubit/info_exit_cubit.dart';
import 'package:portal1409/features/exit/list_exit/cubit/list_exit_cubit.dart';
import 'package:portal1409/features/home/main/cubit/lift_cubit.dart';
import 'package:portal1409/features/home/services/cubit/service_cubit.dart';
import 'package:portal1409/repository/repository.dart';
import 'package:portal1409/router/router.dart';
import 'package:portal1409/theme/theme.dart';
import 'package:dio/dio.dart';
import 'package:portal1409/api/api.dart';
import 'package:portal1409/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadConfig();

  // loginManager.logout();

  // GetIt.I<ServiceRepository>().removeAllFavorite();

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
        BlocProvider(create: (context) => ServiceCubit()),
        BlocProvider(create: (context) => ListExitCubit(apiClient: apiClient)),
        BlocProvider(create: (context) => CreateExitCubit(apiClient: apiClient)),
        BlocProvider(create: (context) => InfoExitCubit(apiClient: apiClient))
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
