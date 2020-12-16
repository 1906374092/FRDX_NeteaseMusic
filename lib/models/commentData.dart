import 'package:json_annotation/json_annotation.dart';
import "comment.dart";
import "sortType.dart";
part 'commentData.g.dart';

@JsonSerializable()
class CommentData {
    CommentData();

    List<Comment> comments;
    String currentComment;
    num totalCount;
    bool hasMore;
    String cursor;
    num sortType;
    List<SortType> sortTypeList;
    
    factory CommentData.fromJson(Map<String,dynamic> json) => _$CommentDataFromJson(json);
    Map<String, dynamic> toJson() => _$CommentDataToJson(this);
}
