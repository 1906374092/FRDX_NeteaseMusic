// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendarEvent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarEvent _$CalendarEventFromJson(Map<String, dynamic> json) {
  return CalendarEvent()
    ..id = json['id'] as String
    ..eventType = json['eventType'] as String
    ..onlineTime = json['onlineTime'] as num
    ..offlineTime = json['offlineTime'] as num
    ..tag = json['tag'] as String
    ..title = json['title'] as String
    ..imgUrl = json['imgUrl'] as String
    ..canRemind = json['canRemind'] as bool
    ..reminded = json['reminded'] as bool
    ..targetUrl = json['targetUrl'] as String
    ..remindText = json['remindText'] as String
    ..logInfo = json['logInfo'] as String
    ..alg = json['alg'] as String
    ..resourceType = json['resourceType'] as String
    ..resourceId = json['resourceId'] as String
    ..eventStatus = json['eventStatus'] as String
    ..remindedText = json['remindedText'] as String;
}

Map<String, dynamic> _$CalendarEventToJson(CalendarEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventType': instance.eventType,
      'onlineTime': instance.onlineTime,
      'offlineTime': instance.offlineTime,
      'tag': instance.tag,
      'title': instance.title,
      'imgUrl': instance.imgUrl,
      'canRemind': instance.canRemind,
      'reminded': instance.reminded,
      'targetUrl': instance.targetUrl,
      'remindText': instance.remindText,
      'logInfo': instance.logInfo,
      'alg': instance.alg,
      'resourceType': instance.resourceType,
      'resourceId': instance.resourceId,
      'eventStatus': instance.eventStatus,
      'remindedText': instance.remindedText
    };
