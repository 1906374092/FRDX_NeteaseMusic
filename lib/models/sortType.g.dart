// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sortType.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortType _$SortTypeFromJson(Map<String, dynamic> json) {
  return SortType()
    ..sortType = json['sortType'] as num
    ..sortTypeName = json['sortTypeName'] as String
    ..target = json['target'] as String;
}

Map<String, dynamic> _$SortTypeToJson(SortType instance) => <String, dynamic>{
      'sortType': instance.sortType,
      'sortTypeName': instance.sortTypeName,
      'target': instance.target
    };
