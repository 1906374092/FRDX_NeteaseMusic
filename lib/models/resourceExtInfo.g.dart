// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resourceExtInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceExtInfo _$ResourceExtInfoFromJson(Map<String, dynamic> json) {
  return ResourceExtInfo()
    ..playCount = json['playCount'] as num
    ..highQuality = json['highQuality'] as bool
    ..artists = (json['artists'] as List)
        ?.map((e) =>
            e == null ? null : Artist.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..action = json['action'] as String
    ..actionType = json['actionType'] as String
    ..valid = json['valid'] as bool
    ..alg = json['alg'] as String
    ..logInfo = json['logInfo'] as String
    ..songData = json['songData'] == null
        ? null
        : SongData.fromJson(json['songData'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ResourceExtInfoToJson(ResourceExtInfo instance) =>
    <String, dynamic>{
      'playCount': instance.playCount,
      'highQuality': instance.highQuality,
      'artists': instance.artists,
      'action': instance.action,
      'actionType': instance.actionType,
      'valid': instance.valid,
      'alg': instance.alg,
      'logInfo': instance.logInfo,
      'songData': instance.songData
    };
