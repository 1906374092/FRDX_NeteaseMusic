// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'titleModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TitleModel _$TitleModelFromJson(Map<String, dynamic> json) {
  return TitleModel()
    ..title = json['title'] as String
    ..titleType = json['titleType'] as String;
}

Map<String, dynamic> _$TitleModelToJson(TitleModel instance) =>
    <String, dynamic>{'title': instance.title, 'titleType': instance.titleType};
