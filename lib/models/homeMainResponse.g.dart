// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeMainResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeMainResponse _$HomeMainResponseFromJson(Map<String, dynamic> json) {
  return HomeMainResponse()
    ..code = json['code'] as num
    ..data = json['data'] == null
        ? null
        : HomeMainData.fromJson(json['data'] as Map<String, dynamic>)
    ..message = json['message'] as String;
}

Map<String, dynamic> _$HomeMainResponseToJson(HomeMainResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message
    };
