import 'package:json_annotation/json_annotation.dart';

part 'calendarEvent.g.dart';

@JsonSerializable()
class CalendarEvent {
    CalendarEvent();

    String id;
    String eventType;
    num onlineTime;
    num offlineTime;
    String tag;
    String title;
    String imgUrl;
    bool canRemind;
    bool reminded;
    String targetUrl;
    String remindText;
    String logInfo;
    String alg;
    String resourceType;
    String resourceId;
    String eventStatus;
    String remindedText;
    
    factory CalendarEvent.fromJson(Map<String,dynamic> json) => _$CalendarEventFromJson(json);
    Map<String, dynamic> toJson() => _$CalendarEventToJson(this);
}
