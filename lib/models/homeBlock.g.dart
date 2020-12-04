// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeBlock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBlock _$HomeBlockFromJson(Map<String, dynamic> json) {
  return HomeBlock()
    ..blockCode = json['blockCode'] as String
    ..showType = json['showType'] as String
    ..action = json['action'] as String
    ..actionType = json['actionType'] as String
    ..canClose = json['canClose'] as bool
    ..uiElement = json['uiElement'] == null
        ? null
        : UiElement.fromJson(json['uiElement'] as Map<String, dynamic>)
    ..creatives = (json['creatives'] as List)
        ?.map((e) =>
            e == null ? null : Creative.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..extInfo = (json['extInfo'] as List)
        ?.map((e) =>
            e == null ? null : ExtInfo.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$HomeBlockToJson(HomeBlock instance) => <String, dynamic>{
      'blockCode': instance.blockCode,
      'showType': instance.showType,
      'action': instance.action,
      'actionType': instance.actionType,
      'canClose': instance.canClose,
      'uiElement': instance.uiElement,
      'creatives': instance.creatives,
      'extInfo': instance.extInfo
    };
