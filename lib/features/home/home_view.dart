import 'package:auto_route/auto_route.dart';
import 'package:cupertino_native/cupertino_native.dart';
import 'package:flutter/foundation.dart';
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
          body: defaultTargetPlatform != TargetPlatform.iOS
              ? child
              : Stack(
                  children: [
                    child,
                    Align(
                      alignment: .bottomCenter,
                      child: CNTabBar(
                        split: true,
                        splitSpacing: 0.1,
                        backgroundColor: Colors.red,
                        currentIndex: tabsRouter.activeIndex,
                        onTap: (index) => tabsRouter.setActiveIndex(index),
                        items: [
                          CNTabBarItem(
                            icon: CNSymbol("house"),
                            label: "Главная",
                          ),
                          CNTabBarItem(
                            icon: CNSymbol("square.grid.3x3.topleft.filled"),
                            label: "Сервисы",
                          ),
                          CNTabBarItem(
                            icon: CNSymbol("app.badge"),
                            label: "Уведомления",
                          ),
                          CNTabBarItem(icon: CNSymbol("magnifyingglass")),
                        ],
                      ),
                    ),
                  ],
                ),
          bottomNavigationBar: defaultTargetPlatform != TargetPlatform.iOS
              ? BottomNavigationBar(
                  currentIndex: tabsRouter.activeIndex,
                  onTap: (index) => tabsRouter.setActiveIndex(index),
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: "Главная",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.list_outlined),
                      label: "Сервисы",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.notifications_outlined),
                      label: "Уведомления",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search_outlined),
                      label: "Поиск",
                    ),
                  ],
                )
              : const SizedBox(),
        );
      },
    );
  }
}
