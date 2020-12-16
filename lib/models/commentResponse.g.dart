// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentResponse _$CommentResponseFromJson(Map<String, dynamic> json) {
  return CommentResponse()
    ..code = json['code'] as num
    ..data = json['data'] == null
        ? null
        : CommentData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CommentResponseToJson(CommentResponse instance) =>
    <String, dynamic>{'code': instance.code, 'data': instance.data};
