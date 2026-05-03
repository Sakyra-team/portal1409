// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterLink _$RegisterLinkFromJson(Map<String, dynamic> json) => RegisterLink(
  createdAt: json['created_at'] as String,
  expiresAt: json['expires_at'] as String,
  link: json['link'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$RegisterLinkToJson(RegisterLink instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'expires_at': instance.expiresAt,
      'link': instance.link,
      'status': instance.status,
    };
