import 'package:flutter/material.dart';
import 'package:portal1409/config.dart';
import 'package:portal1409/router/router.dart';
import 'package:portal1409/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  loadConfig();
  
  // await GetIt.I<LoginRepository>().logout();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter router = AppRouter();
    return MaterialApp.router(
      title: 'Портал 1409',
      theme: darkTheme,
      routerConfig: router.config(),
    );
  }
}
