import 'package:json_annotation/json_annotation.dart';

part 'generic/edit_teacher.g.dart';

@JsonSerializable()
class EditTeacher {
  const EditTeacher({required this.status});

  factory EditTeacher.fromJson(Map<String, dynamic> json) =>
      _$EditTeacherFromJson(json);

  final String status;

  Map<String, dynamic> toJson() => _$EditTeacherToJson(this);
}
