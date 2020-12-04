// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songAudioModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongAudioModel _$SongAudioModelFromJson(Map<String, dynamic> json) {
  return SongAudioModel()
    ..id = json['id'] as num
    ..url = json['url'] as String
    ..br = json['br'] as num
    ..size = json['size'] as num
    ..md5 = json['md5'] as String
    ..code = json['code'] as num
    ..expi = json['expi'] as num
    ..type = json['type'] as String
    ..gain = json['gain'] as num
    ..fee = json['fee'] as num
    ..uf = json['uf'] as String
    ..payed = json['payed'] as num
    ..flag = json['flag'] as num
    ..canExtend = json['canExtend'] as bool
    ..freeTrialInfo = json['freeTrialInfo'] as String
    ..level = json['level'] as String
    ..encodeType = json['encodeType'] as String
    ..urlSource = json['urlSource'] as num;
}

Map<String, dynamic> _$SongAudioModelToJson(SongAudioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'br': instance.br,
      'size': instance.size,
      'md5': instance.md5,
      'code': instance.code,
      'expi': instance.expi,
      'type': instance.type,
      'gain': instance.gain,
      'fee': instance.fee,
      'uf': instance.uf,
      'payed': instance.payed,
      'flag': instance.flag,
      'canExtend': instance.canExtend,
      'freeTrialInfo': instance.freeTrialInfo,
      'level': instance.level,
      'encodeType': instance.encodeType,
      'urlSource': instance.urlSource
    };
