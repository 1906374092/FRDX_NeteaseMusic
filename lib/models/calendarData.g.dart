// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendarData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarData _$CalendarDataFromJson(Map<String, dynamic> json) {
  return CalendarData()
    ..abtest = json['abtest'] as String
    ..calendarEvents = (json['calendarEvents'] as List)
        ?.map((e) => e == null
            ? null
            : CalendarEvent.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CalendarDataToJson(CalendarData instance) =>
    <String, dynamic>{
      'abtest': instance.abtest,
      'calendarEvents': instance.calendarEvents
    };
