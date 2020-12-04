// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banners _$BannersFromJson(Map<String, dynamic> json) {
  return Banners()
    ..banners = (json['banners'] as List)
        ?.map((e) =>
            e == null ? null : Banner_item.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..code = json['code'] as num;
}

Map<String, dynamic> _$BannersToJson(Banners instance) =>
    <String, dynamic>{'banners': instance.banners, 'code': instance.code};
