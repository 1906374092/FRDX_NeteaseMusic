// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'squareFeedViewDTOList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SquareFeedViewDTOList _$SquareFeedViewDTOListFromJson(
    Map<String, dynamic> json) {
  return SquareFeedViewDTOList()
    ..id = json['id'] as String
    ..type = json['type'] as num
    ..typeDesc = json['typeDesc'] as String
    ..position = json['position'] as num
    ..alg = json['alg'] as String
    ..log_info = json['log_info'] as String
    ..reason = json['reason'] as String
    ..resource = json['resource'] == null
        ? null
        : SquareFeedViewDTOListResource.fromJson(
            json['resource'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SquareFeedViewDTOListToJson(
        SquareFeedViewDTOList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'typeDesc': instance.typeDesc,
      'position': instance.position,
      'alg': instance.alg,
      'log_info': instance.log_info,
      'reason': instance.reason,
      'resource': instance.resource
    };
