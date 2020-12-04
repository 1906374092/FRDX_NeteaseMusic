import 'package:json_annotation/json_annotation.dart';
import "calendarData.dart";
part 'calendarResponse.g.dart';

@JsonSerializable()
class CalendarResponse {
    CalendarResponse();

    num code;
    CalendarData data;
    String message;
    
    factory CalendarResponse.fromJson(Map<String,dynamic> json) => _$CalendarResponseFromJson(json);
    Map<String, dynamic> toJson() => _$CalendarResponseToJson(this);
}
