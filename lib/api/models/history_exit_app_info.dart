import 'package:json_annotation/json_annotation.dart';

part 'history_exit_app_info.g.dart';

@JsonSerializable()
class HistoryExitAppInfo {
  const HistoryExitAppInfo({
    required this.cause,
    required this.createdAt,
    required this.group,
    required this.id,
    required this.isDeleted,
    required this.isShow,
    required this.name,
    required this.teacherName,
    this.usedAt,
  });

  factory HistoryExitAppInfo.fromJson(Map<String, dynamic> json) =>
      _$HistoryExitAppInfoFromJson(json);

  final String cause;
  @JsonKey(name: "created_at")
  final String createdAt;
  final String group;
  final String id;
  @JsonKey(name: "is_deleted")
  final bool isDeleted;
  @JsonKey(name: "is_show")
  final bool isShow;
  final String name;
  @JsonKey(name: "teacher_name")
  final String teacherName;
  final String? usedAt;

  Map<String, dynamic> toJson() => _$HistoryExitAppInfoToJson(this);
}
