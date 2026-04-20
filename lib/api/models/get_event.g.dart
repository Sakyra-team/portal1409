// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEvent _$GetEventFromJson(Map<String, dynamic> json) => GetEvent(
  id: json['id'],
  eventName: json['event_name'],
  date: json['date'],
  time: json['time'],
  description: json['description'],
  location: json['location'],
  isOnline: json['is_online'],
  conference_link: json['conference_link'],
  isRegistrationOpen: json['is_registration_open'],
);

Map<String, dynamic> _$GetEventToJson(GetEvent instance) => <String, dynamic>{
  'id': instance.id,
  'event_name': instance.eventName,
  'date': instance.date,
  'time': instance.time,
  'description': instance.description,
  'location': instance.location,
  'is_online': instance.isOnline,
  'conference_link': instance.conference_link,
  'is_registration_open': instance.isRegistrationOpen,
};
