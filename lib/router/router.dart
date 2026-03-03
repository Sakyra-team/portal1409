import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portal1409/features/auth/auth.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, path: "/login", initial: true),
    AutoRoute(page: SmsRoute.page, path: "/sms"),
  ];
}
