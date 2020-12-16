// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentData _$CommentDataFromJson(Map<String, dynamic> json) {
  return CommentData()
    ..comments = (json['comments'] as List)
        ?.map((e) =>
            e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..currentComment = json['currentComment'] as String
    ..totalCount = json['totalCount'] as num
    ..hasMore = json['hasMore'] as bool
    ..cursor = json['cursor'] as String
    ..sortType = json['sortType'] as num
    ..sortTypeList = (json['sortTypeList'] as List)
        ?.map((e) =>
            e == null ? null : SortType.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CommentDataToJson(CommentData instance) =>
    <String, dynamic>{
      'comments': instance.comments,
      'currentComment': instance.currentComment,
      'totalCount': instance.totalCount,
      'hasMore': instance.hasMore,
      'cursor': instance.cursor,
      'sortType': instance.sortType,
      'sortTypeList': instance.sortTypeList
    };
