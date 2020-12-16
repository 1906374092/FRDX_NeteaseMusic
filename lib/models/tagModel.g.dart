// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tagModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagModel _$TagModelFromJson(Map<String, dynamic> json) {
  return TagModel()
    ..text = json['text'] as String
    ..type = json['type'] as num
    ..recommendType = json['recommendType'] as String;
}

Map<String, dynamic> _$TagModelToJson(TagModel instance) => <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
      'recommendType': instance.recommendType
    };
