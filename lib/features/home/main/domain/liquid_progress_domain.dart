List<String?> liquidProgressDomain() {
  DateTime now = DateTime.now();

  if (now.hour >= 15 && now.minute >= 55 || now.hour >= 16) {
    // После уроков
    return (["Уроки закончены!", null]);
  } else if (now.hour <= 8 && now.minute < 30) {
    // До уроков
    if (now.hour == 8) {
      return (["${30 - now.minute} мин.", "До начала уроков, далее урок(45 мин.)"]);
    }
    return ([
      "${8 - now.hour} ${30 - now.minute} мин.",
      "До начала уроков, далее урок(45 мин.)",
    ]);
  }
  // Идут уроки
  else if (now.hour >= 8 ||
      now.hour <= 9 &&
      now.minute >= 30 ||
      now.minute <= 15) {
    return ([
      "${now.minute > 30 ? "${15 + (60 - now.minute)}" : "${15 - now.minute}"} мин.",
      "До конца урока, далее перемена(10 мин.)",
    ]);
  } else if (now.hour >= 9 ||
      now.hour <= 10 &&
      now.minute >= 25 ||
      now.minute <= 10) {
    return ([
      "${now.minute > 25 ? "${10 + (60 - now.minute)}" : "${10 - now.minute}"} мин.",
      "До конца урока, далее перемена(15 мин.)",
    ]);
  } else if (now.hour >= 10 ||
      now.hour <= 11 &&
      now.minute >= 25 ||
      now.minute <= 10) {
    return ([
      "${now.minute > 25 ? "${10 + (60 - now.minute)}" : "${10 - now.minute}"} мин.",

      "До конца урока, далее перемена(15 мин.)",
    ]);
  } else if (now.hour >= 11 ||
      now.hour <= 12 &&
      now.minute >= 25 ||
      now.minute <= 10) {
    return ([
      "${now.minute > 25 ? "${10 + (60 - now.minute)}" : "${10 - now.minute}"} мин.",

      "До конца урока, далее перемена(15 мин.)",
    ]);
  } else if (now.hour >= 12 ||
      now.hour <= 13 &&
      now.minute >= 30 ||
      now.minute <= 15) {
    return ([
      "${now.minute > 30 ? "${15 + (60 - now.minute)}" : "${15 - now.minute}"} мин.",

      "До конца урока, далее большая перемена(20 мин.)",
    ]);
  } else if (now.hour >= 13 ||
      now.hour <= 14 &&
      now.minute >= 25 ||
      now.minute <= 10) {
    return ([
      "${now.minute > 25 ? "${10 + (60 - now.minute)}" : "${10 - now.minute}"} мин.",

      "До конца урока, далее перемена(10 мин.)",
    ]);
  } else if (now.hour >= 14 ||
      now.hour <= 15 &&
      now.minute >= 20 ||
      now.minute <= 05) {
    return ([
      "${now.minute > 20 ? "${5 + (60 - now.minute)} " : "${5 - now.minute}"} мин.",

      "До конца урока, далее перемена(5 мин.)",
    ]);
  } else if (now.hour == 15 && now.minute >= 10 && now.minute <= 55) {
    return (["${60 - now.minute} мин.", 
      "До конца урока, далее уроков нет!",]);
  }



  // Идёт пермена
  else if (now.hour == 9 &&
      now.minute >= 15 &&
      now.minute <= 25) {
    return ([
      "${(25 - now.minute).toString()} мин.",
      "До конца перемены, далее урок(45 мин.)",
    ]);
  } else if (now.hour == 10 &&
      now.minute >= 10 &&
      now.minute <= 25) {
    return ([
      "${(25 - now.minute).toString()} мин.",
      "До конца перемены, далее урок(45 мин.)",
    ]);
  } else if (now.hour == 11 &&
      now.minute >= 10 &&
      now.minute <= 25) {
    return ([
      "${(25 - now.minute).toString()} мин.",
      "До конца перемены, далее урок(45 мин.)",
    ]);
  } else if (now.hour == 12 &&
      now.minute >= 10 &&
      now.minute <= 30) {
    return ([
      "${(30 - now.minute).toString()} мин.",
      "До конца перемены, далее урок(45 мин.)",
    ]);
  } else if (now.hour == 13 &&
      now.minute >= 15 &&
      now.minute <= 25) {
    return ([
      "${(25 - now.minute).toString()} мин.",
      "До конца перемены, далее урок(45 мин.)",
    ]);
  } else if (now.hour == 14 &&
      now.minute >= 10 &&
      now.minute <= 20) {
    return ([
      "${(20 - now.minute).toString()} мин.",
      "До конца перемены, далее урок(45 мин.)",
    ]);
  } else if (now.hour == 15 &&
      now.minute >= 05 &&
      now.minute <= 10) {
    return ([
      "${(10 - now.minute).toString()} мин.",
      "До конца перемены, далее урок(45 мин.)",
    ]);
  } 


  return ["Ошибка загрузка", null];
}
