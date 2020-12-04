// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeMainData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeMainData _$HomeMainDataFromJson(Map<String, dynamic> json) {
  return HomeMainData()
    ..hasMore = json['hasMore'] as bool
    ..blockUUIDs = json['blockUUIDs'] as String
    ..blocks = (json['blocks'] as List)
        ?.map((e) =>
            e == null ? null : HomeBlock.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$HomeMainDataToJson(HomeMainData instance) =>
    <String, dynamic>{
      'hasMore': instance.hasMore,
      'blockUUIDs': instance.blockUUIDs,
      'blocks': instance.blocks
    };
