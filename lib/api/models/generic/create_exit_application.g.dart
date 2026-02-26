// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../create_exit_application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateExitApplication _$CreateExitApplicationFromJson(
  Map<String, dynamic> json,
) => CreateExitApplication(
  status: json['status'] as String,
  application_id: json['application_id'] as String,
  code: json['code'] as String,
  message: json['message'] as String?,
);

Map<String, dynamic> _$CreateExitApplicationToJson(
  CreateExitApplication instance,
) => <String, dynamic>{
  'status': instance.status,
  'application_id': instance.application_id,
  'code': instance.code,
  'message': instance.message,
};
