import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portal1409/router/router.dart';

@RoutePage()
class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        MainRoute(),
        ServicesRoute(),
        NotificationsRoute(),
        SearchRoute(),
      ],
      homeIndex: 0,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
            items: [
              BottomNavigationBarItem(icon:Icon(Icons.home_outlined), label: "Главная"),
              BottomNavigationBarItem(icon:Icon(Icons.list_outlined), label: "Сервисы"),
              BottomNavigationBarItem(icon:Icon(Icons.notifications_outlined), label: "Уведомления"),
              BottomNavigationBarItem(icon:Icon(Icons.search_outlined), label: "Поиск"),
            ],
          ),
        );
      }
    );
  }
}
