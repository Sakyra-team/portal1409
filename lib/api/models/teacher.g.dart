// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
  name: json['name'] as String,
  defaultGroupNumber: (json['defaultGroupNumber'] as num).toInt(),
  defaultGroupLetter: json['defaultGroupLetter'] as String,
  login: json['login'] as String,
  blockClassExit: json['blockClassExit'] as bool,
  campus: json['campus'] as String,
  card: json['card'] as String,
);

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
  'name': instance.name,
  'defaultGroupNumber': instance.defaultGroupNumber,
  'defaultGroupLetter': instance.defaultGroupLetter,
  'login': instance.login,
  'blockClassExit': instance.blockClassExit,
  'campus': instance.campus,
  'card': instance.card,
};
