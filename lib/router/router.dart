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
      ],
    ),

    AutoRoute(
      page: ListExitRoute.page,
      path: "/exit/list",
      guards: [AuthGuard()],
    ),
    AutoRoute(
      page: CreateExitRoute.page,
      path: "/exit/create",
      guards: [AuthGuard()],
    ),
    AutoRoute(
      page: InfoExitRoute.page,
      path: "/exit/info",
      guards: [AuthGuard()],
    ),

    AutoRoute(page: AccountRoute.page, path: "/account", guards: [AuthGuard()]),
    AutoRoute(
      page: SettingsRoute.page,
      path: "/settings",
      guards: [AuthGuard()],
    ),
    AutoRoute(
      page: SecurityRoute.page,
      path: "/security",
      guards: [AuthGuard()],
    ),
    AutoRoute(page: DevicesRoute.page, path: "/devices", guards: [AuthGuard()]),

    AutoRoute(page: EventsRoute.page, path: "/events"),
    AutoRoute(page: BarinRoute.page, path: "/barin", guards: [AuthGuard()]),
    AutoRoute(page: LiftRoute.page, path: "/lift", guards: [AuthGuard()]),
    AutoRoute(page: GuestPassRoute.page, path: "/guest/pass", guards: [AuthGuard()]),

    AutoRoute(page: RadioRoute.page, path: "/radio", guards: [AuthGuard()]),
    AutoRoute(page: BellsRoute.page, path: "/bells", guards: [AuthGuard()]),
    AutoRoute(page: AnnouncerRoute.page, path: "/announcer", guards: [AuthGuard()]),
    AutoRoute(page: NewsRoute.page, path: "/news", guards: [AuthGuard()]),

    AutoRoute(page: ITRezidentsRoute.page, path: "/it_rezidents", guards: [AuthGuard()]),
    AutoRoute(page: ITPolygonRoute.page, path: "/it_polygon", guards: [AuthGuard()]),

  ];
}
