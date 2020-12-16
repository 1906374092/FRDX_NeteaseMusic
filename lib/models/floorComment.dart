import 'package:json_annotation/json_annotation.dart';

part 'floorComment.g.dart';

@JsonSerializable()
class FloorComment {
    FloorComment();

    num replyCount;
    String comments;
    bool showReplyCount;
    String topCommentIds;
    String target;
    
    factory FloorComment.fromJson(Map<String,dynamic> json) => _$FloorCommentFromJson(json);
    Map<String, dynamic> toJson() => _$FloorCommentToJson(this);
}
