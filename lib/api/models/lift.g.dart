// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lift _$LiftFromJson(Map<String, dynamic> json) =>
    Lift(json['status'] as String?, (json['id'] as num?)?.toInt());

Map<String, dynamic> _$LiftToJson(Lift instance) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
};
