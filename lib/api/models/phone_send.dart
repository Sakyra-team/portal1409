import 'package:json_annotation/json_annotation.dart';

part 'generic/phone_send.g.dart';

@JsonSerializable()
class SendPhone {
  const SendPhone({this.status, this.message});

  factory SendPhone.fromJson(Map<String, dynamic> json) =>
      _$SendPhoneFromJson(json);

  final String? message;
  final String? status;

  Map<String, dynamic> toJson() => _$SendPhoneToJson(this);
}
