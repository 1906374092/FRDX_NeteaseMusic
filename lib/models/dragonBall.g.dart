// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dragonBall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DragonBall _$DragonBallFromJson(Map<String, dynamic> json) {
  return DragonBall()
    ..id = json['id'] as num
    ..name = json['name'] as String
    ..iconUrl = json['iconUrl'] as String
    ..url = json['url'] as String
    ..skinSupport = json['skinSupport'] as bool;
}

Map<String, dynamic> _$DragonBallToJson(DragonBall instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
      'url': instance.url,
      'skinSupport': instance.skinSupport
    };
