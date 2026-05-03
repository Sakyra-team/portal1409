// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
  name: json['name'] as String,
  defaultGroupNumber: (json['default_group_number'] as num?)?.toInt(),
  defaultGroupLetter: json['default_group_letter'] as String?,
  login: json['login'] as String,
  blockClassExit: json['block_class_exit'] as bool,
  campus: json['campus'] as String,
  card: json['card'] as String?,
  birthdayData: json['birth_date'] as String?,
  extraInfo: json['extra_info'] as String?,
  showContactToColleagues: json['show_contact_to_colleagues'] as bool?,
);

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
  'name': instance.name,
  'default_group_number': instance.defaultGroupNumber,
  'default_group_letter': instance.defaultGroupLetter,
  'login': instance.login,
  'block_class_exit': instance.blockClassExit,
  'campus': instance.campus,
  'card': instance.card,
  'birth_date': instance.birthdayData,
  'extra_info': instance.extraInfo,
  'show_contact_to_colleagues': instance.showContactToColleagues,
};
