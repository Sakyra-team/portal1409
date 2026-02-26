import 'package:json_annotation/json_annotation.dart';

part 'generic/check_code.g.dart';

@JsonSerializable()
class CheckCode {
  const CheckCode(this.status, this.message);

  factory CheckCode.fromJson(Map<String, dynamic> json) =>
      _$CheckCodeFromJson(json);

  final String status;
  final String? message;

  Map<String, dynamic> toJson() => _$CheckCodeToJson(this);
}
