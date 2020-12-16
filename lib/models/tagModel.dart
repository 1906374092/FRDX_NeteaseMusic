import 'package:json_annotation/json_annotation.dart';

part 'tagModel.g.dart';

@JsonSerializable()
class TagModel {
    TagModel();

    String text;
    num type;
    String recommendType;
    
    factory TagModel.fromJson(Map<String,dynamic> json) => _$TagModelFromJson(json);
    Map<String, dynamic> toJson() => _$TagModelToJson(this);
}
