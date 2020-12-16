import 'package:json_annotation/json_annotation.dart';
import "tagModel.dart";
part 'tagData.g.dart';

@JsonSerializable()
class TagData {
    TagData();

    List<TagModel> datas;
    String relatedCommentIds;
    
    factory TagData.fromJson(Map<String,dynamic> json) => _$TagDataFromJson(json);
    Map<String, dynamic> toJson() => _$TagDataToJson(this);
}
