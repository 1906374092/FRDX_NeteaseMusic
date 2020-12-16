import 'package:json_annotation/json_annotation.dart';
import "commentData.dart";
part 'commentResponse.g.dart';

@JsonSerializable()
class CommentResponse {
    CommentResponse();

    num code;
    CommentData data;
    
    factory CommentResponse.fromJson(Map<String,dynamic> json) => _$CommentResponseFromJson(json);
    Map<String, dynamic> toJson() => _$CommentResponseToJson(this);
}
