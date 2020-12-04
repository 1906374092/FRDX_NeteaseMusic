import 'package:json_annotation/json_annotation.dart';

part 'dynamicCover.g.dart';

@JsonSerializable()
class DynamicCover {
    DynamicCover();

    num priorityLevel;
    num type;
    String playUrl;
    
    factory DynamicCover.fromJson(Map<String,dynamic> json) => _$DynamicCoverFromJson(json);
    Map<String, dynamic> toJson() => _$DynamicCoverToJson(this);
}
