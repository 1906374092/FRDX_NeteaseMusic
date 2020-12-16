// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floorComment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FloorComment _$FloorCommentFromJson(Map<String, dynamic> json) {
  return FloorComment()
    ..replyCount = json['replyCount'] as num
    ..comments = json['comments'] as String
    ..showReplyCount = json['showReplyCount'] as bool
    ..topCommentIds = json['topCommentIds'] as String
    ..target = json['target'] as String;
}

Map<String, dynamic> _$FloorCommentToJson(FloorComment instance) =>
    <String, dynamic>{
      'replyCount': instance.replyCount,
      'comments': instance.comments,
      'showReplyCount': instance.showReplyCount,
      'topCommentIds': instance.topCommentIds,
      'target': instance.target
    };
