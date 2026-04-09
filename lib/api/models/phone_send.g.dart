// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendPhone _$SendPhoneFromJson(Map<String, dynamic> json) => SendPhone(
  status: json['status'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$SendPhoneToJson(SendPhone instance) => <String, dynamic>{
  'message': instance.message,
  'status': instance.status,
};
