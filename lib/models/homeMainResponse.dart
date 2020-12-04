import 'package:json_annotation/json_annotation.dart';
import "homeMainData.dart";
part 'homeMainResponse.g.dart';

@JsonSerializable()
class HomeMainResponse {
    HomeMainResponse();

    num code;
    HomeMainData data;
    String message;
    
    factory HomeMainResponse.fromJson(Map<String,dynamic> json) => _$HomeMainResponseFromJson(json);
    Map<String, dynamic> toJson() => _$HomeMainResponseToJson(this);
}
