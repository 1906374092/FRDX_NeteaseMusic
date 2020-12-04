// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyricsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LyricsResponse _$LyricsResponseFromJson(Map<String, dynamic> json) {
  return LyricsResponse()
    ..sgc = json['sgc'] as bool
    ..sfy = json['sfy'] as bool
    ..qfy = json['qfy'] as bool
    ..lrc = json['lrc'] == null
        ? null
        : LyricsModel.fromJson(json['lrc'] as Map<String, dynamic>)
    ..code = json['code'] as num;
}

Map<String, dynamic> _$LyricsResponseToJson(LyricsResponse instance) =>
    <String, dynamic>{
      'sgc': instance.sgc,
      'sfy': instance.sfy,
      'qfy': instance.qfy,
      'lrc': instance.lrc,
      'code': instance.code
    };
