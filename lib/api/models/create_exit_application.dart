import 'package:json_annotation/json_annotation.dart';

part 'create_exit_application.g.dart';

@JsonSerializable()
class CreateExitApplication {
  const CreateExitApplication({
    required this.status,
    required this.application_id,
    required this.code, this.message,
  });

  factory CreateExitApplication.fromJson(Map<String, dynamic> json) =>
      _$CreateExitApplicationFromJson(json);

  final String status;
  final String application_id;
  final String code;
  final String? message;

  Map<String, dynamic> toJson() => _$CreateExitApplicationToJson(this);
}
