// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamicCover.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicCover _$DynamicCoverFromJson(Map<String, dynamic> json) {
  return DynamicCover()
    ..priorityLevel = json['priorityLevel'] as num
    ..type = json['type'] as num
    ..playUrl = json['playUrl'] as String;
}

Map<String, dynamic> _$DynamicCoverToJson(DynamicCover instance) =>
    <String, dynamic>{
      'priorityLevel': instance.priorityLevel,
      'type': instance.type,
      'playUrl': instance.playUrl
    };
