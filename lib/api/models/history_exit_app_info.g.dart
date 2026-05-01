// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_exit_app_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryExitAppInfo _$HistoryExitAppInfoFromJson(Map<String, dynamic> json) =>
    HistoryExitAppInfo(
      cause: json['cause'] as String,
      createdAt: json['created_at'] as String,
      group: json['group'] as String,
      id: json['id'] as String,
      isDeleted: json['is_deleted'] as bool,
      isShow: json['is_show'] as bool,
      name: json['name'] as String,
      teacherName: json['teacher_name'] as String,
      usedAt: json['usedAt'] as String?,
    );

Map<String, dynamic> _$HistoryExitAppInfoToJson(HistoryExitAppInfo instance) =>
    <String, dynamic>{
      'cause': instance.cause,
      'created_at': instance.createdAt,
      'group': instance.group,
      'id': instance.id,
      'is_deleted': instance.isDeleted,
      'is_show': instance.isShow,
      'name': instance.name,
      'teacher_name': instance.teacherName,
      'usedAt': instance.usedAt,
    };
