// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creative.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Creative _$CreativeFromJson(Map<String, dynamic> json) {
  return Creative()
    ..creativeType = json['creativeType'] as String
    ..creativeId = json['creativeId'] as String
    ..action = json['action'] as String
    ..actionType = json['actionType'] as String
    ..alg = json['alg'] as String
    ..position = json['position'] as num
    ..uiElement = json['uiElement'] == null
        ? null
        : UiElement.fromJson(json['uiElement'] as Map<String, dynamic>)
    ..resources = (json['resources'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CreativeToJson(Creative instance) => <String, dynamic>{
      'creativeType': instance.creativeType,
      'creativeId': instance.creativeId,
      'action': instance.action,
      'actionType': instance.actionType,
      'alg': instance.alg,
      'position': instance.position,
      'uiElement': instance.uiElement,
      'resources': instance.resources
    };
