import 'package:json_annotation/json_annotation.dart';

part 'register_link.g.dart';

@JsonSerializable()
class RegisterLink {
  const RegisterLink({required this.createdAt, required this.expiresAt, required this.link, required this.status});

  factory RegisterLink.fromJson(Map<String, dynamic> json) =>
      _$RegisterLinkFromJson(json);

  @JsonKey(name: "created_at")
  final String createdAt;

  @JsonKey(name: "expires_at")
  final String expiresAt;

  final String link;

  final String status;

  Map<String, dynamic> toJson() => _$RegisterLinkToJson(this);
}
