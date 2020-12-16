import 'package:json_annotation/json_annotation.dart';
import "user_info.dart";
import "floorComment.dart";
import "tagData.dart";
part 'comment.g.dart';

@JsonSerializable()
class Comment {
    Comment();

    User_info user;
    String beReplied;
    num commentId;
    String content;
    num status;
    num time;
    num likedCount;
    bool liked;
    String expressionUrl;
    num parentCommentId;
    bool repliedMark;
    Map<String,dynamic> pendantData;
    FloorComment showFloorComment;
    Map<String,dynamic> decoration;
    num commentLocationType;
    String args;
    TagData tag;
    Map<String,dynamic> source;
    Map<String,dynamic> extInfo;
    
    factory Comment.fromJson(Map<String,dynamic> json) => _$CommentFromJson(json);
    Map<String, dynamic> toJson() => _$CommentToJson(this);
}
