// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageConfig.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageConfig _$PageConfigFromJson(Map<String, dynamic> json) {
  return PageConfig()
    ..refreshToast = json['refreshToast'] as String
    ..nodataToast = json['nodataToast'] as String
    ..refreshInterval = json['refreshInterval'] as num
    ..title = json['title'] as String
    ..fullscreen = json['fullscreen'] as bool;
}

Map<String, dynamic> _$PageConfigToJson(PageConfig instance) =>
    <String, dynamic>{
      'refreshToast': instance.refreshToast,
      'nodataToast': instance.nodataToast,
      'refreshInterval': instance.refreshInterval,
      'title': instance.title,
      'fullscreen': instance.fullscreen
    };
