import 'package:json_annotation/json_annotation.dart';

part 'get_event.g.dart';

@JsonSerializable()
class GetEvent {
  const GetEvent({
    this.id,
    this.eventName,
    this.date,
    this.time,
    this.description,
    this.location,
    this.isOnline,
    this.conference_link,
    this.isRegistrationOpen,
  });

  factory GetEvent.fromJson(Map<String, dynamic> json) =>
      _$GetEventFromJson(json);

  final id;
  @JsonKey(name: "event_name")
  final eventName;
  final date;
  final time;
  final description;
  final location;
  @JsonKey(name: "is_online")
  final isOnline;
  final conference_link;
  @JsonKey(name: "is_registration_open")
  final isRegistrationOpen;

  Map<String, dynamic> toJson() => _$GetEventToJson(this);
}
