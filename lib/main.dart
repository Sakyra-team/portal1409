import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:portal1409/features/auth/login/bloc/login_bloc.dart';
import 'package:portal1409/features/auth/sms/bloc/sms_bloc.dart';
import 'package:portal1409/repository/auth/login_repository.dart';
import 'package:portal1409/router/router.dart';
import 'package:portal1409/theme/theme.dart';
import 'package:dio/dio.dart';
import 'package:portal1409/api/api.dart';
import 'package:portal1409/core/core.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

part 'config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  loadConfig();

  // loginManager.logout();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter router = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc(apiClient: apiClient)),
        BlocProvider(create: (context) => SmsBloc(apiClient: apiClient)),
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
