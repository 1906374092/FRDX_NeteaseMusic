// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment()
    ..user = json['user'] == null
        ? null
        : User_info.fromJson(json['user'] as Map<String, dynamic>)
    ..beReplied = json['beReplied'] as String
    ..commentId = json['commentId'] as num
    ..content = json['content'] as String
    ..status = json['status'] as num
    ..time = json['time'] as num
    ..likedCount = json['likedCount'] as num
    ..liked = json['liked'] as bool
    ..expressionUrl = json['expressionUrl'] as String
    ..parentCommentId = json['parentCommentId'] as num
    ..repliedMark = json['repliedMark'] as bool
    ..pendantData = json['pendantData'] as Map<String, dynamic>
    ..showFloorComment = json['showFloorComment'] == null
        ? null
        : FloorComment.fromJson(
            json['showFloorComment'] as Map<String, dynamic>)
    ..decoration = json['decoration'] as Map<String, dynamic>
    ..commentLocationType = json['commentLocationType'] as num
    ..args = json['args'] as String
    ..tag = json['tag'] == null
        ? null
        : TagData.fromJson(json['tag'] as Map<String, dynamic>)
    ..source = json['source'] as Map<String, dynamic>
    ..extInfo = json['extInfo'] as Map<String, dynamic>;
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'user': instance.user,
      'beReplied': instance.beReplied,
      'commentId': instance.commentId,
      'content': instance.content,
      'status': instance.status,
      'time': instance.time,
      'likedCount': instance.likedCount,
      'liked': instance.liked,
      'expressionUrl': instance.expressionUrl,
      'parentCommentId': instance.parentCommentId,
      'repliedMark': instance.repliedMark,
      'pendantData': instance.pendantData,
      'showFloorComment': instance.showFloorComment,
      'decoration': instance.decoration,
      'commentLocationType': instance.commentLocationType,
      'args': instance.args,
      'tag': instance.tag,
      'source': instance.source,
      'extInfo': instance.extInfo
    };
