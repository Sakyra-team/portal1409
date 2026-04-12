import 'package:json_annotation/json_annotation.dart';

part 'exit_close.g.dart';

@JsonSerializable()
class ExitClose {
  const ExitClose(this.status, this.message);

  factory ExitClose.fromJson(Map<String, dynamic> json) =>
      _$ExitCloseFromJson(json);

  final String status;
  final String? message;

  Map<String, dynamic> toJson() => _$ExitCloseToJson(this);
}
