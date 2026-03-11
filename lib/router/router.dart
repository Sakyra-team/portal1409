import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portal1409/features/features.dart';
import 'package:portal1409/router/router_guard.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, path: "/login"),
    AutoRoute(page: SmsRoute.page, path: "/sms"),

    AutoRoute(
      page: TabRoute.page,
      initial: true,
      path: "/",
      guards: [AuthGuard()],
      children: [
        AutoRoute(page: MainRoute.page, path: "home"),
        AutoRoute(page: ServicesRoute.page, path: "services"),
        AutoRoute(page: NotificationsRoute.page, path: "notifications"),
        AutoRoute(page: SearchRoute.page, path: "search"),
      ]
    ),
  ];
}
