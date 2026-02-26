import 'package:json_annotation/json_annotation.dart';

part 'generic/history_exit_app_info.g.dart';

@JsonSerializable()
class HistoryExitAppInfo {
  const HistoryExitAppInfo({
    required this.cause,
    required this.created_at,
    required this.group,
    required this.id,
    required this.is_deleted,
    required this.is_show,
    required this.name,
    required this.teacher_name,
    this.usedAt,
  });

  factory HistoryExitAppInfo.fromJson(Map<String, dynamic> json) =>
      _$HistoryExitAppInfoFromJson(json);

  final String cause;
  final String created_at;
  final String group;
  final String id;
  final bool is_deleted;
  final bool is_show;
  final String name;
  final String teacher_name;
  final String? usedAt;

  Map<String, dynamic> toJson() => _$HistoryExitAppInfoToJson(this);
}
