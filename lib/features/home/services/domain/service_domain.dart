import 'package:flutter/material.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/home/services/domain/service_enum.dart';

final Map<ServiceEnum, Map<int, Map<String, dynamic>>> servicesMap = {
  ServiceEnum.morePopularity: {
    1: {"text": "Заявки на выход", "icon": Icons.directions_run_outlined, "func": () async => await openLink("create_exit_application")},
    2: {"text": "Заявки на карты", "icon": Icons.directions_run_outlined, "func": () async => await openLink("admin/card-applications")},
    3: {"text": "Мероприятия", "icon": Icons.directions_run_outlined, "func": () async => await openLink("events")},
    4: {"text": "Лифт", "icon": Icons.directions_run_outlined, "func": () async => await openLink("create-lift-application")},
  },
  ServiceEnum.alerts: {
    5: {"text": "Радио", "icon": Icons.directions_run_outlined, "func": () async => await openLink("scheduled-announcements/admin")},
    6: {"text": "Звонки", "icon": Icons.directions_run_outlined, "func": () async => await openLink("bells/admin")},
    7: {"text": "Громкая связь", "icon": Icons.directions_run_outlined, "func": () async => await openLink("announcer/admin")},
    8: {"text": "Новости", "icon": Icons.directions_run_outlined, "func": () async => await openLink("admin/news")},
  },
  ServiceEnum.polygon: {
    9: {"text": "B.A.R.I.N.", "icon": Icons.directions_run_outlined, "func": () async => await openLink("barin")},
    10: {"text": "IT-резиденты", "icon": Icons.directions_run_outlined, "func": () async => await openLink("admin/polygon/residents")},
    11: {"text": "IT-полигон", "icon": Icons.directions_run_outlined, "func": () async => await openLink("it-polygon")},
  },
  ServiceEnum.other: {
    12: {"text": "Учителя", "icon": Icons.directions_run_outlined, "func": () async => await openLink("admin/users")},
    13: {"text": "Зачисления", "icon": Icons.directions_run_outlined, "func": () async => await openLink("enrollment/view/5")},
    14: {"text": "Выпускники", "icon": Icons.directions_run_outlined, "func": () async => await openLink("alumni_admin")},
    15: {"text": "АдминЛифт", "icon": Icons.directions_run_outlined, "func": () async => await openLink("lift_log")},
    16: {"text": "Сканер", "icon": Icons.directions_run_outlined, "func": () async => await openLink("1409qr")},
    17: {"text": "Заявки совет", "icon": Icons.directions_run_outlined, "func": () async => await openLink("admin/sovet-applications")},
    18: {"text": "Реестр спортсменов", "icon": Icons.directions_run_outlined, "func": () async => await openLink("athlete_permissions")},
  },
};

final Map<int, Map<String, dynamic>> servicesMapWithout = {
  1: {"text": "Заявки на выход", "icon": Icons.directions_run_outlined, "func": () async => await openLink("create_exit_application")},
  2: {"text": "Заявки на карты", "icon": Icons.directions_run_outlined, "func": () async => await openLink("admin/card-applications")},
  3: {"text": "Мероприятия", "icon": Icons.directions_run_outlined, "func": () async => await openLink("events")},
  4: {"text": "Лифт", "icon": Icons.directions_run_outlined, "func": () async => await openLink("create-lift-application")},

  5: {"text": "Радио", "icon": Icons.directions_run_outlined, "func": () async => await openLink("scheduled-announcements/admin")},
  6: {"text": "Звонки", "icon": Icons.directions_run_outlined, "func": () async => await openLink("bells/admin")},
  7: {"text": "Громкая связь", "icon": Icons.directions_run_outlined, "func": () async => await openLink("announcer/admin")},
  8: {"text": "Новости", "icon": Icons.directions_run_outlined, "func": () async => await openLink("admin/news")},

  9: {"text": "B.A.R.I.N.", "icon": Icons.directions_run_outlined, "func": () async => await openLink("barin")},
  10: {"text": "IT-резиденты", "icon": Icons.directions_run_outlined, "func": () async => await openLink("admin/polygon/residents")},
  11: {"text": "IT-полигон", "icon": Icons.directions_run_outlined, "func": () async => await openLink("it-polygon")},

  12: {"text": "Учителя", "icon": Icons.directions_run_outlined, "func": () async => await openLink("admin/users")},
  13: {"text": "Зачисления", "icon": Icons.directions_run_outlined, "func": () async => await openLink("enrollment/view/5")},
  14: {"text": "Выпускники", "icon": Icons.directions_run_outlined, "func": () async => await openLink("alumni_admin")},
  15: {"text": "АдминЛифт", "icon": Icons.directions_run_outlined, "func": () async => await openLink("lift_log")},
  16: {"text": "Сканер", "icon": Icons.directions_run_outlined, "func": () async => await openLink("1409qr")},
  17: {"text": "Заявки совет", "icon": Icons.directions_run_outlined, "func": () async => await openLink("admin/sovet-applications")},
  18: {"text": "Реестр спортсменов", "icon": Icons.directions_run_outlined, "func": () async => await openLink("athlete_permissions")},
};
