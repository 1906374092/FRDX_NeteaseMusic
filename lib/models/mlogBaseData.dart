import 'package:json_annotation/json_annotation.dart';

part 'mlogBaseData.g.dart';

@JsonSerializable()
class MlogBaseData {
    MlogBaseData();

    String id;
    num type;
    String text;
    String interveneText;
    String coverUrl;
    String coverDynamicUrl;
    num coverHeight;
    num coverWidth;
    num coverColor;
    
    factory MlogBaseData.fromJson(Map<String,dynamic> json) => _$MlogBaseDataFromJson(json);
    Map<String, dynamic> toJson() => _$MlogBaseDataToJson(this);
}
