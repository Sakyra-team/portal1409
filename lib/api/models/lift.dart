import 'package:json_annotation/json_annotation.dart';

part 'generic/lift.g.dart';

@JsonSerializable()
class Lift {
  const Lift(this.status, this.id);

  factory Lift.fromJson(Map<String, dynamic> json) =>
      _$LiftFromJson(json);

  final int? id;
  final String? status;

  Map<String, dynamic> toJson() => _$LiftToJson(this);
}
