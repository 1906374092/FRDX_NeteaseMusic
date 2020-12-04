// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recLiveDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecLiveDTO _$RecLiveDTOFromJson(Map<String, dynamic> json) {
  return RecLiveDTO()
    ..skipUrl = json['skipUrl'] as String
    ..typeDesc = json['typeDesc'] as String
    ..cardType = json['cardType'] as num
    ..alg = json['alg'] as String
    ..anchorId = json['anchorId'] as String
    ..songId = json['songId'] as num
    ..accompanimentId = json['accompanimentId'] as num
    ..supplemetParam = json['supplemetParam'] as String
    ..ops = json['ops'] as String
    ..recCoverId = json['recCoverId'] as num
    ..recCover = json['recCover'] as String;
}

Map<String, dynamic> _$RecLiveDTOToJson(RecLiveDTO instance) =>
    <String, dynamic>{
      'skipUrl': instance.skipUrl,
      'typeDesc': instance.typeDesc,
      'cardType': instance.cardType,
      'alg': instance.alg,
      'anchorId': instance.anchorId,
      'songId': instance.songId,
      'accompanimentId': instance.accompanimentId,
      'supplemetParam': instance.supplemetParam,
      'ops': instance.ops,
      'recCoverId': instance.recCoverId,
      'recCover': instance.recCover
    };
