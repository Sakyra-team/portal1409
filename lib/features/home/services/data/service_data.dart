import 'package:flutter/material.dart';
import 'package:portal1409/features/home/services/data/service_enum.dart';

final Map<ServiceEnum, Map<int, Map<String, dynamic>>> servicesMap = {
  ServiceEnum.morePopularity: {
    1: {
      "text": "Заявки на выход",
      "icon": Icons.directions_run_outlined,
      "func": "/exit/list",
    },
    2: {
      "text": "Заявки на карты",
      "icon": Icons.payment_outlined,
      "func": "/card/requests",
    },
    3: {"text": "Мероприятия", "icon": Icons.event_outlined, "func": "/events"},
    4: {"text": "Лифт", "icon": Icons.elevator_outlined, "func": "/lift"},
  },
  ServiceEnum.alerts: {
    5: {"text": "Радио", "icon": Icons.radio_outlined, "func": "/radio"},
    6: {"text": "Звонки", "icon": Icons.call_outlined, "func": "/bells"},
    7: {
      "text": "Громкая связь",
      "icon": Icons.speaker_outlined,
      "func": "/announcer",
    },
    8: {"text": "Новости", "icon": Icons.newspaper_outlined, "func": "/news"},
  },
  ServiceEnum.polygon: {
    9: {
      "text": "B.A.R.I.N.",
      "icon": Icons.admin_panel_settings_outlined,
      "func": "/barin",
    },
    10: {
      "text": "IT-резиденты",
      "icon": Icons.people_outline,
      "func": "/it_rezidents",
    },
    11: {
      "text": "IT-полигон",
      "icon": Icons.polymer_outlined,
      "func": "/it_polygon",
    },
  },
  ServiceEnum.other: {
    12: {
      "text": "Пропуск для гостя",
      "icon": Icons.sports_baseball_outlined,
      "func": "/guest/pass",
    },

    13: {
      "text": "Учителя",
      "icon": Icons.people_alt_outlined,
      "func": "/teachers",
    },
    14: {
      "text": "Зачисления",
      "icon": Icons.add_chart_outlined,
      "func": "/enrollment",
    },
    15: {
      "text": "Выпускники",
      "icon": Icons.school_outlined,
      "func": "/alumni",
    },
    16: {"text": "АдминЛифт", "icon": Icons.elevator, "func": "/lift/admin"},
    17: {"text": "Сканер", "icon": Icons.scanner_outlined, "func": "/scanner"},
    18: {
      "text": "Заявки совет",
      "icon": Icons.help_center_outlined,
      "func": "/sovet/request",
    },
    19: {
      "text": "Реестр спортсменов",
      "icon": Icons.sports_baseball_outlined,
      "func": "/exit/sportsman",
    },
  },
};

final Map<int, Map<String, dynamic>> servicesMapWithout = {
  1: {
    "text": "Заявки на выход",
    "icon": Icons.directions_run_outlined,
    "func": "/exit/list",
  },
  2: {
    "text": "Заявки на карты",
    "icon": Icons.payment_outlined,
    "func": "/card/requests",
  },
  3: {"text": "Мероприятия", "icon": Icons.event_outlined, "func": "/events"},
  4: {"text": "Лифт", "icon": Icons.elevator_outlined, "func": "/lift"},

  5: {"text": "Радио", "icon": Icons.radio_outlined, "func": "/radio"},
  6: {"text": "Звонки", "icon": Icons.call_outlined, "func": "/bells"},
  7: {
    "text": "Громкая связь",
    "icon": Icons.speaker_outlined,
    "func": "/announcer",
  },
  8: {"text": "Новости", "icon": Icons.newspaper_outlined, "func": "/news"},

  9: {
    "text": "B.A.R.I.N.",
    "icon": Icons.admin_panel_settings_outlined,
    "func": "/barin",
  },
  10: {
    "text": "IT-резиденты",
    "icon": Icons.people_outline,
    "func": "/it_rezidents",
  },
  11: {
    "text": "IT-полигон",
    "icon": Icons.polymer_outlined,
    "func": "/it_polygon",
  },

  12: {
    "text": "Пропуск для гостя",
    "icon": Icons.sports_baseball_outlined,
    "func": "/guest/pass",
  },
  13: {
    "text": "Учителя",
    "icon": Icons.people_alt_outlined,
    "func": "/teachers",
  },
  14: {
    "text": "Зачисления",
    "icon": Icons.add_chart_outlined,
    "func": "/enrollment",
  },
  15: {"text": "Выпускники", "icon": Icons.school_outlined, "func": "/alumni"},
  16: {"text": "АдминЛифт", "icon": Icons.elevator, "func": "/lift/admin"},
  17: {"text": "Сканер", "icon": Icons.scanner_outlined, "func": "/scanner"},
  18: {
    "text": "Заявки совет",
    "icon": Icons.help_center_outlined,
    "func": "/sovet/request",
  },
  19: {
    "text": "Реестр спортсменов",
    "icon": Icons.sports_baseball_outlined,
    "func": "/exit/sportsman",
  },
};
