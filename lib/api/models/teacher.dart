import 'package:json_annotation/json_annotation.dart';

part 'teacher.g.dart';

@JsonSerializable()
class Teacher {
  const Teacher({
    required this.name,
    required this.defaultGroupNumber,
    required this.defaultGroupLetter,
    required this.login,
    required this.blockClassExit,
    required this.campus,
    required this.card,
    required this.birthdayData,
    required this.extraInfo,
    required this.showContactToColleagues,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);

  final String name;
  @JsonKey(name: "default_group_number")
  final int? defaultGroupNumber;
  @JsonKey(name: "default_group_letter")
  final String? defaultGroupLetter;
  final String login;
  @JsonKey(name: "block_class_exit")
  final bool blockClassExit;
  final String campus;
  final String? card;
  @JsonKey(name: "birth_date")
  final String? birthdayData;
  @JsonKey(name: "extra_info")
  final String? extraInfo;
  @JsonKey(name: "show_contact_to_colleagues")
  final bool? showContactToColleagues;

  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}
