// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_exit_app_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryExitAppInfo _$HistoryExitAppInfoFromJson(Map<String, dynamic> json) =>
    HistoryExitAppInfo(
      cause: json['cause'] as String,
      created_at: json['created_at'] as String,
      group: json['group'] as String,
      id: json['id'] as String,
      is_deleted: json['is_deleted'] as bool,
      is_show: json['is_show'] as bool,
      name: json['name'] as String,
      teacher_name: json['teacher_name'] as String,
      usedAt: json['usedAt'] as String?,
    );

Map<String, dynamic> _$HistoryExitAppInfoToJson(HistoryExitAppInfo instance) =>
    <String, dynamic>{
      'cause': instance.cause,
      'created_at': instance.created_at,
      'group': instance.group,
      'id': instance.id,
      'is_deleted': instance.is_deleted,
      'is_show': instance.is_show,
      'name': instance.name,
      'teacher_name': instance.teacher_name,
      'usedAt': instance.usedAt,
    };
