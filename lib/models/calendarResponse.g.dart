// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendarResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarResponse _$CalendarResponseFromJson(Map<String, dynamic> json) {
  return CalendarResponse()
    ..code = json['code'] as num
    ..data = json['data'] == null
        ? null
        : CalendarData.fromJson(json['data'] as Map<String, dynamic>)
    ..message = json['message'] as String;
}

Map<String, dynamic> _$CalendarResponseToJson(CalendarResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message
    };
