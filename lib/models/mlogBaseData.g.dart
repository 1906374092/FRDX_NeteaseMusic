// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mlogBaseData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MlogBaseData _$MlogBaseDataFromJson(Map<String, dynamic> json) {
  return MlogBaseData()
    ..id = json['id'] as String
    ..type = json['type'] as num
    ..text = json['text'] as String
    ..interveneText = json['interveneText'] as String
    ..coverUrl = json['coverUrl'] as String
    ..coverDynamicUrl = json['coverDynamicUrl'] as String
    ..coverHeight = json['coverHeight'] as num
    ..coverWidth = json['coverWidth'] as num
    ..coverColor = json['coverColor'] as num;
}

Map<String, dynamic> _$MlogBaseDataToJson(MlogBaseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'text': instance.text,
      'interveneText': instance.interveneText,
      'coverUrl': instance.coverUrl,
      'coverDynamicUrl': instance.coverDynamicUrl,
      'coverHeight': instance.coverHeight,
      'coverWidth': instance.coverWidth,
      'coverColor': instance.coverColor
    };
