// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tagData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagData _$TagDataFromJson(Map<String, dynamic> json) {
  return TagData()
    ..datas = (json['datas'] as List)
        ?.map((e) =>
            e == null ? null : TagModel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..relatedCommentIds = json['relatedCommentIds'] as String;
}

Map<String, dynamic> _$TagDataToJson(TagData instance) => <String, dynamic>{
      'datas': instance.datas,
      'relatedCommentIds': instance.relatedCommentIds
    };
