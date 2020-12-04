// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_ball.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Home_ball _$Home_ballFromJson(Map<String, dynamic> json) {
  return Home_ball()
    ..code = json['code'] as num
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : DragonBall.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..message = json['message'] as String;
}

Map<String, dynamic> _$Home_ballToJson(Home_ball instance) => <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message
    };
