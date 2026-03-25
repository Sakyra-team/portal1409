import 'package:portal1409/api/models/history_exit_app_info.dart';

List<HistoryExitAppInfo> getExitListByName(List<HistoryExitAppInfo> list, String name) {
  final List<HistoryExitAppInfo> result = [];

  for (int i = 0; i < list.length; i++) {
    if (list[i].name.toLowerCase().contains(name.toLowerCase()) || list[i].group.toLowerCase().contains(name.toLowerCase())) {
      result.add(list[i]);
    }
  }

  return result;
}