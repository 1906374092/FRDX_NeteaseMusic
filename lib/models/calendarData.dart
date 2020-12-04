import 'package:json_annotation/json_annotation.dart';
import "calendarEvent.dart";
part 'calendarData.g.dart';

@JsonSerializable()
class CalendarData {
    CalendarData();

    String abtest;
    List<CalendarEvent> calendarEvents;
    
    factory CalendarData.fromJson(Map<String,dynamic> json) => _$CalendarDataFromJson(json);
    Map<String, dynamic> toJson() => _$CalendarDataToJson(this);
}
