// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buttonModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ButtonModel _$ButtonModelFromJson(Map<String, dynamic> json) {
  return ButtonModel()
    ..action = json['action'] as String
    ..actionType = json['actionType'] as String
    ..text = json['text'] as String
    ..iconUrl = json['iconUrl'] as String;
}

Map<String, dynamic> _$ButtonModelToJson(ButtonModel instance) =>
    <String, dynamic>{
      'action': instance.action,
      'actionType': instance.actionType,
      'text': instance.text,
      'iconUrl': instance.iconUrl
    };
