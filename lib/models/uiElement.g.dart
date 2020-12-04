// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uiElement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UiElement _$UiElementFromJson(Map<String, dynamic> json) {
  return UiElement()
    ..mainTitle = json['mainTitle'] == null
        ? null
        : TitleModel.fromJson(json['mainTitle'] as Map<String, dynamic>)
    ..subTitle = json['subTitle'] == null
        ? null
        : TitleModel.fromJson(json['subTitle'] as Map<String, dynamic>)
    ..button = json['button'] == null
        ? null
        : ButtonModel.fromJson(json['button'] as Map<String, dynamic>)
    ..image = json['image'] == null
        ? null
        : ImageModel.fromJson(json['image'] as Map<String, dynamic>)
    ..labelTexts =
        (json['labelTexts'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$UiElementToJson(UiElement instance) => <String, dynamic>{
      'mainTitle': instance.mainTitle,
      'subTitle': instance.subTitle,
      'button': instance.button,
      'image': instance.image,
      'labelTexts': instance.labelTexts
    };
