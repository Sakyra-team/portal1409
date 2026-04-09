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
  });

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);

  final String name;
  final int defaultGroupNumber;
  final String defaultGroupLetter;
  final String login;
  final bool blockClassExit;
  final String campus;
  final String card;

  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}
