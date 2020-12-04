// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource()
    ..uiElement = json['uiElement'] == null
        ? null
        : UiElement.fromJson(json['uiElement'] as Map<String, dynamic>)
    ..resourceType = json['resourceType'] as String
    ..resourceId = json['resourceId'] as String
    ..resourceUrl = json['resourceUrl'] as String
    ..action = json['action'] as String
    ..actionType = json['actionType'] as String
    ..valid = json['valid'] as bool
    ..alg = json['alg'] as String
    ..logInfo = json['logInfo'] as String
    ..resourceExtInfo = json['resourceExtInfo'] == null
        ? null
        : ResourceExtInfo.fromJson(
            json['resourceExtInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
      'uiElement': instance.uiElement,
      'resourceType': instance.resourceType,
      'resourceId': instance.resourceId,
      'resourceUrl': instance.resourceUrl,
      'action': instance.action,
      'actionType': instance.actionType,
      'valid': instance.valid,
      'alg': instance.alg,
      'logInfo': instance.logInfo,
      'resourceExtInfo': instance.resourceExtInfo
    };
